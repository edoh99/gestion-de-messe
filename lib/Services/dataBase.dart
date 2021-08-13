import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:gestion_eglise/Pages/User.dart';

class DataBaseService {
  final String uid;

  DataBaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Future<void> saveUser(String name, String userCount) async {
    return await userCollection.doc(uid).set({
      'name': name,
      'userCount': userCount,
    });
  }

  // AppUserData _userFromSnapshot(DocumentSnapshot snapshot) {
  //   return AppUserData(
  //     uid: uid,
  //     name: snapshot.data()["name"],
  //     userCount: snapshot.data()["userCount"],
  //   );
  // }

  // Stream<AppUserData> get user {
  //   return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  // }

  // List<AppUserData> _userListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.docs.
  // }

  // Stream<List<AppUserData>> get users {
  //   return userCollection.doc(uid).snapshots().map();
  // }
}
