import 'package:abg/data/const/export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.homeAppBar(
        onChange: (value) {},
        onMenuPress: () {},
        onNotificationPress: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Greeting and mood emojis
            const Text(
              "Hey Amira",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "How are you feeling today?",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Spacer(),
                CustomImage.asset("assets/svg/emojis.svg",
                    height: 25, fit: BoxFit.fitWidth)
              ],
            ),
            const SizedBox(height: 16),

            // Search bar
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/100'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "What are you looking for?",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Reminders Section
            const Text(
              "Reminders",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  4,
                  (index) => _buildReminderCard(
                    title: "Tablet Panadol",
                    subtitle: "After lunch 1:20pm",
                    dosage: "500mg",
                    isTaken: index % 2 == 0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Family Reminders Section
            const Text(
              "Family Reminders Today",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildFamilyReminderCard(
                  name: "Mohamed",
                  relation: "Dad",
                  title: "Tablet Panadol",
                  dosage: "500mg",
                  time: "1:20pm",
                  isTaken: true,
                  image: 'https://via.placeholder.com/100',
                ),
                _buildFamilyReminderCard(
                  name: "Ahmed",
                  relation: "Husband",
                  title: "Tablet Panadol",
                  dosage: "500mg",
                  time: "1:20pm",
                  isTaken: false,
                  image: 'https://via.placeholder.com/100',
                ),
                _buildFamilyReminderCard(
                  name: "Mayada",
                  relation: "Mum",
                  title: "Tablet Panadol",
                  dosage: "500mg",
                  time: "1:20pm",
                  isTaken: false,
                  image: 'https://via.placeholder.com/100',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReminderCard({
    required String title,
    required String subtitle,
    required String dosage,
    required bool isTaken,
  }) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isTaken ? Colors.green[50] : Colors.grey[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            dosage,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Icon(
            isTaken ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isTaken ? Colors.green : Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildFamilyReminderCard({
    required String name,
    required String relation,
    required String title,
    required String dosage,
    required String time,
    required bool isTaken,
    required String image,
  }) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(image),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    relation,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            dosage,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            time,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Icon(
            isTaken ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isTaken ? Colors.green : Colors.grey,
          ),
        ],
      ),
    );
  }
}
