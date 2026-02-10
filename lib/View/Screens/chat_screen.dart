import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:riya_garage/View/AppColors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF658DDD)),
      ),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ScrollController _scrollController = ScrollController();

  // Device ID for identifying this device's messages
  String _deviceId = 'unknown';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getDeviceId();
  }

  // Get a unique device identifier
  Future<void> _getDeviceId() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        _deviceId = androidInfo.id;
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        _deviceId = iosInfo.identifierForVendor ?? 'unknown_ios';
      }
    } catch (e) {
      _deviceId = 'device_${DateTime.now().millisecondsSinceEpoch}';
      print('Error getting device ID: $e');
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _sendMessage() async {
    if (_messageController.text.trim().isEmpty) return;

    try {
      await _firestore.collection('chat_messages').add({
        'text': _messageController.text.trim(),
        'deviceId': _deviceId,
        'timestamp': FieldValue.serverTimestamp(),
      });

      _messageController.clear();

      // Scroll to bottom after sending
      Future.delayed(const Duration(milliseconds: 100), () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    } catch (e) {
      print('Error sending message: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send message: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenWidth, screenHeight * 0.07),
        child: AppBar(
            title: const Text(
              "Chat",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: AppColors.color9),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                children: [
                  // Device ID display
                  // Container(
                  //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  //   color: Colors.grey[200],
                  //   child: Row(
                  //     children: [
                  //       const Icon(Icons.smartphone, size: 16),
                  //       const SizedBox(width: 8),
                  //       Expanded(
                  //         child: Text(
                  //           'Your Device ID: ${_deviceId.substring(0, min(8, _deviceId.length))}...',
                  //           style: const TextStyle(fontSize: 12),
                  //           overflow: TextOverflow.ellipsis,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // Chat messages area
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _firestore.collection('chat_messages').orderBy('timestamp', descending: false).snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        }

                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const Center(child: Text('No messages yet. Start a conversation!'));
                        }

                        final messages = snapshot.data!.docs;
                        List<Widget> messageWidgets = [];

                        for (var message in messages) {
                          final messageData = message.data() as Map<String, dynamic>;
                          final messageText = messageData['text'] ?? '';
                          final messageDeviceId = messageData['deviceId'] ?? '';
                          final timestamp = messageData['timestamp'] as Timestamp?;

                          final isMe = messageDeviceId == _deviceId;

                          final messageWidget = MessageBubble(
                            text: messageText,
                            isMe: isMe,
                            deviceId: messageDeviceId.toString().substring(0, min(6, messageDeviceId.toString().length)),
                            timestamp: timestamp,
                          );

                          messageWidgets.add(messageWidget);
                        }

                        // Scroll to bottom on first load
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (_scrollController.hasClients) {
                            _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                          }
                        });

                        return ListView(
                          controller: _scrollController,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                          children: messageWidgets,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                    width: screenWidth <= 600 ? screenWidth * 0.85 : screenWidth * 0.2,
                    // width: screenWidth * 0.85,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        // alignment: screenWidth <= 600 ? Alignment.center : Alignment.centerRight,
                        backgroundColor: MaterialStateProperty.all<Color>(AppColors.color8),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on, size: 25, color: Colors.white),
                          SizedBox(width: 10),
                          Text(
                            'Location',
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Input area
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(
                          color: Colors.blue.shade300,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: TextField(
                              controller: _messageController,
                              decoration: const InputDecoration(
                                hintText: 'Enter your message...',
                                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                border: InputBorder.none,
                              ),
                              onSubmitted: (_) => _sendMessage(),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send, color: Color(0xFF658DDD)),
                          onPressed: _sendMessage,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  int min(int a, int b) {
    return a < b ? a : b;
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  final String deviceId;
  final Timestamp? timestamp;

  const MessageBubble({
    Key? key,
    required this.text,
    required this.isMe,
    required this.deviceId,
    this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // Text(
          //   isMe ? 'You' : '',
          //   style: TextStyle(
          //     fontSize: 12,
          //     color: Colors.grey[600],
          //   ),
          // ),
          const SizedBox(height: 3),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: isMe ? const Color(0xFF658DDD) : Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12),
                topRight: const Radius.circular(12),
                bottomLeft: isMe ? const Radius.circular(12) : const Radius.circular(0),
                bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(12),
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black87,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 2),
          if (timestamp != null)
            Text(
              DateFormat('HH:mm').format(timestamp!.toDate()),
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey[500],
              ),
            ),
        ],
      ),
    );
  }
}
