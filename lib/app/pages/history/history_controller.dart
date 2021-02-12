import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'history_controller.g.dart';

@Injectable()
class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  FirebaseFirestore db = FirebaseFirestore.instance;

  getHistoy() async {
    var res = await db.collection('users').doc().get();
    return res.data();
  }
}
