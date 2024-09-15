import 'package:flutter/material.dart';
import 'package:talky/globals/firebase_controller.dart';

class FireProvider extends ChangeNotifier {
  late FirebaseController controller;
  FireProvider() {
    controller = FirebaseController.init();
  }
}
