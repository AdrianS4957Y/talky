import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talky/provider.dart';

import 'globals/routes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() {
  scheduleMicrotask(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  });
  runApp(
    ChangeNotifierProvider<FireProvider>(
      create: (_) => FireProvider(),
      child: const MaterialApp(
        initialRoute: "/",
        onGenerateRoute: Routes.generateRoutes,
      ),
    ),
  );
}
