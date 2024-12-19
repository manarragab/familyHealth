/*
import 'package:abg/res/configuration/print_types.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RemoteFire {
  FirebaseFirestore firestore;

  RemoteFire(this.firestore);

  final String COLLECTION = 'apple_pay';

 Future<bool> displayApplePay() async{
   try{QuerySnapshot data = await firestore.collection(COLLECTION).get();
      Map? d = data.docs.first.data() as Map;
      return d['show_apple_pay'];
    }catch(e,s){
     Print.error(e.toString(), s);
     return true;
   }
  }
}
*/
