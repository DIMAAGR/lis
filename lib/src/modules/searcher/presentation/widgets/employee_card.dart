import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:lis/src/modules/searcher/domain/employers_entity.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key, required this.entity, required this.onSeeDetailsPressed});

  final EmployersEntity entity;
  final void Function(EmployersEntity) onSeeDetailsPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width - 112,
      decoration: BoxDecoration(
        color: const Color(0xFFEAEAEA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 104,
            width: 104,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  entity.imageURL!,
                ),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        entity.name!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        entity.occupation!,
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        entity.experience!,
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        entity.localization!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 70,
                        child: StarRating(
                          starCount: 5,
                          rating: entity.rating!,
                          size: 14,
                          color: const Color(0xFFFFD700),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: ElevatedButton(
                    onPressed: () => onSeeDetailsPressed(entity),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      maximumSize: const Size(102, 32),
                      minimumSize: const Size(30, 32),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      backgroundColor: const Color(0xFF3EAF1C),
                      surfaceTintColor: const Color(0xFF3EAF1C),
                      foregroundColor: Colors.white,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ver detalhes', style: TextStyle(fontSize: 12)),
                        Icon(Icons.arrow_forward_ios_rounded, size: 12),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
