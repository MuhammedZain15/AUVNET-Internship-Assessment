import 'package:cloud_firestore/cloud_firestore.dart';

class SliderImageRemoteDataSource {
  final FirebaseFirestore firestore;
  SliderImageRemoteDataSource(this.firestore);

  Future<List<String>> fetchSliderImages() async {
    final snapshot = await firestore.collection('banners').get();

    return snapshot.docs.map((doc) => doc['imageUrl'] as String).toList();
  }
}
