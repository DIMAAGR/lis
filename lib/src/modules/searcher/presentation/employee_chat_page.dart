import 'package:flutter/material.dart';

import 'controllers/searcher_controller.dart';

class EmployeeChatPage extends StatelessWidget {
  const EmployeeChatPage({super.key, required this.controller, required this.constraint});

  final SearcherController controller;
  final BoxConstraints constraint;

  Widget _titleSubtitle(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: constraint.maxWidth - 112,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: constraint.maxWidth - 132,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$title: ',
                      style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
                    ),
                    TextSpan(
                      text: subtitle,
                      style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller.selectedEmployee,
        builder: (context, employee, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 112,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              employee!.imageURL!,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      employee.name!,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ...List.generate(
                employee.chatMessage.length,
                (i) => _titleSubtitle(
                  employee.chatMessage[i].fromWho.isMe ? employee.name! : 'Você',
                  employee.chatMessage[i].message,
                ),
              )
            ],
          );
        });
  }
}
