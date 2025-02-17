import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlarmItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String time;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const AlarmItem({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.lightGrey2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Alarm Image Placeholder
            Container(
                width: 100,
                height: 100,
                // Placeholder color
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 0.2,
                      blurRadius: 2,
                      offset: Offset(1.5, 1.5))
                ]),
                child: Image.asset("assets/images/checker.png")),

            const SizedBox(width: 12),

            // Alarm Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(title,
                          style: GoogleFonts.almarai(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.edit_outlined,
                          color: Colors.blue,
                          size: 20,
                        ),
                        onPressed: onEdit,
                        constraints: const BoxConstraints(
                          minHeight: 1,
                          minWidth: 1,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                          size: 20,
                        ),
                        onPressed: onDelete,
                        constraints: const BoxConstraints(
                          minHeight: 1,
                          minWidth: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.almarai(
                        fontSize: 14, color: CustomColors.lightBlue2),
                  ),
                  const SizedBox(height: 8),

                  // Date & Time
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 14, color: Colors.black),
                      const SizedBox(width: 4),
                      Text(date,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey)),
                      const SizedBox(width: 16),
                      const Icon(Icons.access_time,
                          size: 14, color: Colors.black),
                      const SizedBox(width: 4),
                      Text(time,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),

            // Edit & Delete Buttons
          ],
        ),
      ),
    );
  }
}
