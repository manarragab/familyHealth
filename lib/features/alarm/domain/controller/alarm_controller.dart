import 'package:abg/data/const/export.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
class AlarmController extends MainGetxController with CustomStateMixin {
  
String? selectRadio;

void selectradio(String value){
  selectRadio=value;
  update();
}
 var image = Rx<File?>(null);
  var isLoading = false.obs;

  Future<void> pickImage() async {
    isLoading.value = true;  
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }

    isLoading.value = false; 
  

  }
}
