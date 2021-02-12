// ignore: non_constant_identifier_names

import 'package:Devnology/app/models/countries.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  FirebaseFirestore db = FirebaseFirestore.instance;

  saveHistory(String value_to, String value_from, String currency_from,
      String currency_to) async {
    DateTime today = new DateTime.now();
    String dateSlug =
        "${today.day.toString().padLeft(2, '0')}/${today.month.toString().padLeft(2, '0')}/${today.year.toString()}  ${today.hour.toString()}:${today.minute.toString()}";

    var flag_from = "";
    var flag_to = "";
    countries.asMap().forEach((index, country) {
      //todo
      if (currency_from == country['Code']) {
        flag_from = country['flag'];
      }
      if (currency_to == country['Code']) {
        flag_to = country['flag'];
      }
    });

    await db.collection('users').doc().set({
      "currency_from": currency_from,
      "currency_to": currency_to,
      "flag_from": flag_from,
      "flag_to": flag_to,
      "value_from": value_from,
      "value_to": value_to,
      "date": dateSlug,
    });
    return;
  }

  @action
  getRates(String code) async {
    var dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    Response response =
        await dio.get('https://api.exchangeratesapi.io/latest?base=$code');
    return response.data['rates'];
  }
}
