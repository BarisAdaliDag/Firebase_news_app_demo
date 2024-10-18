import 'package:firebase_news_app/product/utility/base/base_firebase_model.dart';
import 'package:firebase_news_app/product/utility/firebase/firebase_collections.dart';

// 7 - 31 dakika acikliyor
mixin FirebaseUtility {
  Future<List<T>?> fetchList<T extends IdModel, R extends BaseFirebaseModel<T>>(
    R data,
    FirebaseCollections collections,
  ) async {
    final newsCollectionReference = collections.reference;
    final response = await newsCollectionReference.withConverter<T>(
      fromFirestore: (snapshot, options) {
        return data.fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return {}; // set islemi yapmadigi icin data.toJson() sildi cunku sinirladik  IdModel, R extends BaseFirebaseModel<T>
      },
    ).get();

    if (response.docs.isNotEmpty) {
      final values = response.docs.map((e) => e.data()).toList();
      return values;
    }
    return null;
  }
}
