import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Model {
  String? id;
  Map<String, dynamic> toMap();
}

void _onError(Exception e) =>
    BotToast.showSimpleNotification(title: e.toString());

Future tryRun(Function action, [Function(Exception)? onError]) async {
  try {
    final result = await action();
    return result ?? true;
  } catch (e) {
    onError?.call(e as Exception);
    return null;
  }
}

class Controller<T extends Model> {
  final CollectionReference ref;

  Controller(String collectionName)
      : ref = FirebaseFirestore.instance.collection(collectionName);

  Future<DocumentReference?> insert(T model) async {
    final result = await tryRun(() => ref.add(model.toMap()), _onError);
    return result;
  }

  Future<QuerySnapshot?> get() async {
    late Query query = ref;
    final result = await tryRun(() => query.get(), _onError);
    return result;
  }
}
