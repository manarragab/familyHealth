import 'package:abg/data/const/export.dart';
import 'package:abg/features/family/domain/controller/family_controller.dart';

class FamilyContainer extends StatefulWidget{


  final  String name;
  final String relation;
  final String? title;
 final String? dosage;
 final String? whenGetIT;
 final String? time;
  bool? isTaken;
 final String image;
 final int index;

  FamilyContainer( {super.key, required this.name,required this.index,
   required this.relation,  this.title,  this.dosage, 
    this.whenGetIT,  this.time,  this.isTaken, required this.image});

  @override
  State<FamilyContainer> createState() => _FamilyContainerState();
}

class _FamilyContainerState extends State<FamilyContainer> {
  //FamilyController controller=Get.find();
@override
FamilyController controller = Get.put(FamilyController());

  @override
  Widget build(BuildContext context) {
    return Obx((){
      
 bool selected=controller.istapped.value==widget.index;
return GestureDetector(
  onTap: (){
    setState(() {
      controller.tapped(widget.index);
    });
  },
  child: Container(
       
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[100],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                 children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(widget.image),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.relation,
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
            // const SizedBox(width: 20),
              
                Icon(
                    selected ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: selected ? Colors.green : Colors.grey,
                    size: 25,
                  ),
                
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title??"",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              //  const SizedBox(width: 8),
          
                Text(
                  widget.dosage??"",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.whenGetIT ??"",
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.time??"",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
);
    }) ;
  }
}


  