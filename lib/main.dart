import 'package:flutter/material.dart';

import 'globals/routes.dart';

void main() {
  runApp(
    const MaterialApp(
      initialRoute: "/",
      onGenerateRoute: Routes.generateRoutes,
    ),
  );
}
