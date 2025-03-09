import 'package:abg/res/configuration/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

            const SizedBox(width: 12),

           Container(
              width: 100,
              height: 100,
              child: Image.asset(
                "assets/images/cheker.png",
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(title,
                          style: GoogleFonts.almarai(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          )),
                      const Spacer(),
                      InkWell(
                        onTap: onEdit,
                        child: SvgPicture.asset(
                          "assets/svg/edit.svg",
                        ),
                      ),

                      SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: onDelete,
                        child: SvgPicture.asset(
                          "assets/svg/delete.svg",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.almarai(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: CustomColors.lightBlue2),
                  ),
                  const SizedBox(height: 14),

                  // Date & Time
                  Row(
                    children: [
                      InkWell(
                        child: SvgPicture.asset(
                          "assets/svg/clender.svg",
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(date,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black)),
                      const SizedBox(width: 16),
                      InkWell(
                        child: SvgPicture.asset(
                          "assets/svg/clock.svg",
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(time,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black)),
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
