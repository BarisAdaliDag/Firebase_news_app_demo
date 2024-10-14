import 'package:cloud_firestore/cloud_firestore.dart';

//4 - 40dk
enum FirebaseCollections {
  news,
  tag,
  recommended,
  version,
  category;

  CollectionReference get reference => FirebaseFirestore.instance.collection(name);
}
