import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreHelper{

  FireStoreHelper._();

  static final FireStoreHelper fireStoreHelper = FireStoreHelper._();

  static final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> fetchFoodData() {
    return fireStore.collection('food').snapshots();
  }

  Stream<QuerySnapshot> fetchFruitData() {
    return fireStore.collection('fruit').snapshots();
  }

  Stream<QuerySnapshot> fetchVegetableData() {
    return fireStore.collection('vegetable').snapshots();
  }

  Stream<QuerySnapshot> fetchColdDrinkData() {
    return fireStore.collection('cold-drink').snapshots();
  }



}