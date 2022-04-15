import 'package:adotei/model/animal.dart';
import 'package:flutter/foundation.dart';

class AppController extends ChangeNotifier {
  static AppController getInstance = AppController();
  List<MyAnimal> animal = [];
}
