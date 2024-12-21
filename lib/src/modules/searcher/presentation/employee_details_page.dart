import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:lis/src/modules/searcher/presentation/widgets/chat_button.dart';

import 'controllers/searcher_controller.dart';

class EmployeeDetailsPage extends StatelessWidget {
  const EmployeeDetailsPage({super.key, required this.controller, required this.constraint});

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
            const SizedBox(width: 8),
            const Padding(
              padding: EdgeInsets.only(top: 6.0),
              child: CircleAvatar(radius: 2, backgroundColor: Colors.black),
            ),
            const SizedBox(width: 8),
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

  Widget _rating(String title, double value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: constraint.maxWidth - 112,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            const CircleAvatar(radius: 2, backgroundColor: Colors.black),
            const SizedBox(width: 8),
            Text(
              '$title: ',
              style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
            ),
            StarRating(rating: value, size: 16, color: Colors.black)
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Container(
                        height: 104,
                        width: 104,
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
                    ChatButton(
                      buttonSize: 48,
                      iconSize: 24,
                      onTap: () => controller.changePage(SelectedPage.chat),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _titleSubtitle('Nome', employee.name!),
              _titleSubtitle('Serviço Principal', employee.occupation!),
              _titleSubtitle('Experiência', employee.experience!),
              _rating('Avaliação', employee.rating!),
              _titleSubtitle('Localização', employee.localization!),
              _titleSubtitle('Descrição', employee.description!),
            ],
          );
        });
  }
}
