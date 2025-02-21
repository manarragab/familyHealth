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
 Rxn<File> image = Rxn<File>(); // Reactive variable

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path); // Update reactive variable
    }

  }
}
