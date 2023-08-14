import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/category_model.dart';

class CategoryServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CategoryModel>> fetchCategory() async {
    try {
      final QuerySnapshot category =
          await _firestore.collection('category').get();
      final List<CategoryModel> data = category.docs
          .map((doc) =>
              CategoryModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      return data;
    } catch (error) {
      throw Exception(error);
    }
  }
}
