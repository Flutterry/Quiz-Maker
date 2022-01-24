import 'package:app3/backend/model/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../controller_manager.dart';

class Quiz extends Model {
  String? name;
  String? image;
  String? description;
  List<Question> questions = [];

  static const collectionName = 'Quiz';

  Quiz({
    this.name,
    this.image,
    this.description,
  });

  factory Quiz.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map? ?? {};
    final model = Quiz();
    model.id = snapshot.id;
    model.name = data["name"];
    model.image = data["image"];
    model.description = data["description"];

    return model;
  }

  @override
  Map<String, dynamic> toMap() => {
        if (name != null) 'name': name,
        if (image != null) 'image': image,
        if (description != null) 'description': description,
      };
}
