import 'package:abg/data/const/export.dart';
import 'package:abg/features/pills/presentation/widget/pdfContainer.dart';
import 'package:abg/res/configuration/text_field/text_field.dart';
import 'package:flutter/widgets.dart';

class  PillsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(CustomTrans.Pils.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(children: [
         
         CustomTextField.searchField((val){} ,
         hint: "What are you looking for?",
    //padding: EdgeInsets.only(right: 5)
         controller: TextEditingController(),

         ),
         SizedBox(height: 25,),
          
...List.generate(10, (index){
  return Pdfcontainer( index: index,);
})
        ],),
      ),
    );
  }


  
}