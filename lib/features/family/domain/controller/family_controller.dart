
import 'package:abg/data/const/export.dart';
import 'package:abg/data/models/family/get_family/family_model.dart';
import 'package:abg/data/models/family/post_family/post_family_MD.dart';
import 'package:abg/domain_data/custom_mixin/custom_state_mixin.dart';
import 'package:abg/domain_data/custom_mixin/mixen_widgets/status_error.dart';
import 'package:abg/features/family/domain/cases/family_cases.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FamilyController extends MainGetxController with CustomStateMixin {

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

List<String> disease=[
  "Heart Disease" ,"Brain Disease" , "Stomach Disease" ,"Lung Disease" ,"Lung Disease"
];

List<String> images=[
  "assets/images/heart.png",
    "assets/images/brain.png",
  "assets/images/stomach.png",
  "assets/images/lung.png",  "assets/images/lung.png",
];

  FamilyModel famMD = FamilyModel();
  PostFamilyModel postFam =PostFamilyModel();
  RefreshController ref = RefreshController();

TextEditingController dateController=TextEditingController();
TextEditingController familyController=TextEditingController();
TextEditingController selectSomeoneController=TextEditingController();
TextEditingController familyDiseaseController=TextEditingController();


  int _pageNum = 1;

  onRefresh() async {
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
        //load refresh part with part
        getPage: (page) => _pageNum = page);
  }

addFamily()async{
  loadingGetxController.showLoading();
  var response=await sl<FamilyCases>().addFamily(postFam);
 loadingGetxController.hideLoading();
    statusError.checkStatus(response, () {
      onRefresh();
      Get.back();
    });

}
  deleteFamily(int id) async {
    loadingGetxController.showCustomLoading(id.toString());
    var response = await sl<FamilyCases>().deleteFamily(id);
    loadingGetxController.hideCustomLoading(id.toString());
    statusError.checkStatus(response, () {
      famMD.data?.removeWhere((e) => e.id == id);
      change(famMD);
    });
  }

}
