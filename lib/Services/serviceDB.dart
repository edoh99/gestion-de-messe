// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:gestion_eglise/Pages/enregModel.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class DataBaseService {
//   String? enregId;
//   DataBaseService({this.enregId});
//   CollectionReference _enregistrements =
//       FirebaseStorage.instance.collection('enregistrements');
//   FirebaseStorage _storage = FirebaseStorage.instance;

//   void addEnregistrement(Enregistrement enreg) {
//     _enregistrements.add({
//       "enregNom": enreg.enregNom,
//       "dateEnreg": enreg.dateEnreg,
//       "nombreFavorie": enreg.nombreFavorie,
//     });
//   }

//   Future<String> uploadFile(file) async {
//     Reference reference =
//         _storage.ref().child('enregistrement/${DateTime.now()}.png');
//     UploadTask uploadTask = reference.putFile(file);
//     TaskSnapshot taskSnapshot = await uploadTask;
//     return await taskSnapshot.ref.getDownloadURL();
//   }

//   // suppression d'enregistrement
//   Future<void> deleteEnregistrement(String enregid) =>
//       _enregistrements.doc(enregId).delete();

//   // Récuperation de tous les enregistrement en temps réel
//   Stream<List<Enregistrement>> get cars {
//     Query queryCars =
//         _enregistrements.orderBy('carTimestamp', descending: true);
//     return queryCars.snapshots().map((snapshot) {
//       return snapshot.docs.map((doc) {
//         return Enregistrement(
//           enregId: doc.id,
//           enregNom: doc.get('enregNom'),
//           dateEnreg: doc.get('dateEnreg'),
//           nombreFavorie: doc.get('nombreFavorie'),
//           enregImag: doc.get('enregImag'),
//         );
//       }).toList();
//     });
//   }
// }
