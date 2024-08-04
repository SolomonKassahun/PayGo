import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  Stream<QuerySnapshot> getLocation() {
    final resp =   FirebaseFirestore.instance.collection("paygo").snapshots();
    print("response at resp is ${resp.length}");
    return  resp;
  }

  Stream<QuerySnapshot> getGymHouse() {
    final resp =   FirebaseFirestore.instance.collection("gym").snapshots();
    print("response at resp gym is ${resp}");
    return  resp;
  }

}