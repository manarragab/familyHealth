
import 'package:abg/data/const/enums.dart';
import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/data/models/family/post_family/post_family_MD.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/domain_data/custom_mixin/mixen_widgets/status_error.dart';
import 'package:abg/features/family/domain/cases/family_cases.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FamilyController extends MainGetxController with CustomStateMixin {

AlarmType? selectRadio;

void selectradio(AlarmType value) {
    selectRadio = value;
    update();
  }

var isSelect=(-1).obs;
void selected(index){
isSelect.value= index;
}

var istapped=(-1).obs;
void tapped(indexx){
istapped.value=indexx;
}

var isChoosen=(-1).obs;
void choosen(index){
  isChoosen.value=index;
}

  FamilyModel famMD = FamilyModel();
  PostFamilyModel postFam =PostFamilyModel();
  RefreshController ref = RefreshController();

TextEditingController dateController=TextEditingController();
TextEditingController familyController=TextEditingController();
TextEditingController selectSomeoneController=TextEditingController();
TextEditingController familyDiseaseController=TextEditingController();
TextEditingController nameController=TextEditingController();
TextEditingController phoneController=TextEditingController();
RefreshController refreshControllerr = RefreshController();
TextEditingController messageController=TextEditingController();
TextEditingController reminderDateController=TextEditingController();
TextEditingController reminderTimeController=TextEditingController();
TextEditingController numbersController=TextEditingController();

List<String> selectedTimes = [];


@override
void onInit() {
  super.onInit();
  onRefresh();
}


void clearData() {
  postFam = PostFamilyModel();
    nameController.clear();
    phoneController.clear();
    dateController.clear();
    familyController.clear();
    selectSomeoneController.clear();
    familyDiseaseController.clear();
    reminderTimeController.clear();
    reminderDateController.clear();
    messageController.clear();
    selectRadio=null;
  }

  int _pageNum = 1;

  onRefreshh() async {
    famMD = await refreshData(
        model: famMD,
        futureMethod: () => sl<FamilyCases>().getFamily(),
        controller: ref,
        checkIfEmpty: (data) {
          if (data is FamilyModel) {
            if (data.data?.isEmpty ?? true) {
              data.status=StatusType.empty.index;
            }
          }
          return data;
        },
        
        getPage: (page) => _pageNum = page);
        change(famMD, status: RxStatus.success());

  }



  onRefresh() async {
  famMD = await refreshData(
    model: famMD,
    futureMethod: () => sl<FamilyCases>().getFamily(),
    controller: ref,
    checkIfEmpty: (data) {
      if (data is FamilyModel) {
        if (data.data?.isEmpty ?? true) {
          data.status = StatusType.empty.index;
        }
      }
      return data;
    },
    getPage: (page) => _pageNum = page,
  );

  if (famMD != null) {
    change(famMD!, status: RxStatus.success());
  } else {
    change(null, status: RxStatus.error("No data received"));
  }
}


addFamily()async{
  loadingGetxController.showLoading();
  var response=await sl<FamilyCases>().addFamily(postFam);
 loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      onRefresh();
      Get.back();
      print("hhhhhhhhhhhhhh ${postFam.relative}");
        print(
      "Selected Medical Record: ${postFam.medicalRecord}");
                            
    });

}
  // deleteFamily(int id) async {
  //   loadingGetxController.showCustomLoading(id.toString());
  //   var response = await sl<FamilyCases>().deleteFamily(id);
  //   loadingGetxController.hideCustomLoading(id.toString());
  //   statusError.checkStatus(response, () {
  //     famMD.data?.removeWhere((e) => e.id == id);
  //     change(famMD);
  //   });
  // }

  deleteFamily(int id) async {
  print('Trying to delete ID: $id');
  print('Before deletion: ${famMD.data?.map((e) => e.id).toList()}');
  loadingGetxController.showCustomLoading(id.toString());
  var response = await sl<FamilyCases>().deleteFamily(id);
  loadingGetxController.hideCustomLoading(id.toString());

  statusError.checkStatus(response, () {
    famMD.data?.removeWhere((e) => e.id == id);

    print('After deletion: ${famMD.data?.map((e) => e.id).toList()}');

    change(famMD);
  });
}

List<MedicalType> selectedDiseases = [];
void reset() {
  isSelect.value = -1;
  //istapped.value = -1;
  isChoosen.value = -1;
  selectedDiseases.clear();
  familyDiseaseController.clear();
}

List<String> imagesDiseases=[
"assets/images/bone.png",
"assets/images/brain.png",
"assets/images/ear.png",
"assets/images/eye.png",
"assets/images/genycology.png",
"assets/images/heart.png",
"assets/images/kidney.png",
"assets/images/lung.png",
"assets/images/muscle.png",
"assets/images/pill.png",
"assets/images/stomach.png",
"assets/images/liver.png",
"assets/images/diabetess.png",
"assets/images/dental.png",
"assets/images/digestive.png",
"assets/images/endocrine.png",
"assets/images/immune.png",
"assets/images/infections.png",
"assets/images/neurological.png",
"assets/images/mental.png",
"assets/images/pill.png",
"assets/images/reproductive.png",
"assets/images/skin.png",
"assets/images/thyroid.png",
"assets/images/urinary.png",
];




}
