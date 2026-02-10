import 'package:flutter/material.dart';
import 'package:riya_garage/View/AppColors.dart';

class ChatNumberWidget extends StatelessWidget {
  const ChatNumberWidget({super.key, required this.chatNumber});

  final String chatNumber;

  void chatScreen(BuildContext context, String chatNumber) {
    Navigator.pushNamed(context, '/chat', arguments: chatNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              chatScreen(context, chatNumber);
              // print(chatNumber);
            },
            child: Container(
              height: 60.0,
              decoration: BoxDecoration(
                color: AppColors.color9,
                borderRadius: BorderRadius.circular(5.0),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      chatNumber,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
