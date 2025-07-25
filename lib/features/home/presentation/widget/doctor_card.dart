import 'package:abg/data/const/export.dart';
import 'package:abg/data/remote_data/core.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Doctor's Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CustomImage.network(
              demoImage, // Replace with the actual image URL
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12), // Spacing between image and text
          // Doctor's Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Doctor's Name and Online Status
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Doctor Name
                    Text(
                      "Mahmoud Al-Sayed",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    // Online Status
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 12,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "online",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // Specialization
                Text(
                  "Psychiatrist",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                // Rating and Time
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "5.0",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.access_time,
                      color: Colors.grey,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "10:00 am - 11:00 am",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Fee
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Fee",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "500egp",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
