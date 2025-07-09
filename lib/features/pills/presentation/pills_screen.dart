import 'package:abg/data/const/export.dart';
import 'package:abg/features/pills/presentation/widget/pdfContainer.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';

class PillsScreen extends StatefulWidget {
  const PillsScreen({super.key});

  @override
  State<PillsScreen> createState() => _PillsScreenState();
}

class _PillsScreenState extends State<PillsScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Example pill data — replace with real data or a model list if needed
  List<String> allPills = [
    'Paracetamol',
    'Ibuprofen',
    'Amoxicillin',
    'Aspirin',
    'Vitamin C',
    'Loratadine',
    'Ciprofloxacin',
    'Metformin',
    'Omeprazole',
    'Cetirizine',
  ];

  List<String> filteredPills = [];

  @override
  void initState() {
    super.initState();
    filteredPills = allPills;
    
    _searchController.addListener(_filterPills); // ✅ Corrected listener
  }

  void _filterPills() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredPills = allPills
          .where((pill) => pill.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.Pils.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            CustomTextField.searchField(
              (val) {}, // You can remove this if not needed
              OnTap: () {},
              hint: "What are you looking for?",
              controller: _searchController,
            ),
            const SizedBox(height: 25),
            ...List.generate(filteredPills.length, (index) {
              return Pdfcontainer(
                index: index,
                pillName: filteredPills[index],
              );
            }),
          ],
        ),
      ),
    );
  }
}
