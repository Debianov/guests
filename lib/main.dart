import 'package:flutter/material.dart';
import 'package:danya_production/screens/AuthScreen.dart';
import 'package:danya_production/theme/model_theme.dart';
import 'package:provider/provider.dart';

rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if false;
    }
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
          builder: (context, ModelTheme themeNotifier, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeNotifier.isDark
              ? ThemeData(
                  brightness: Brightness.dark,
                )
              : ThemeData(
                  brightness: Brightness.light,
                  primaryColor: Colors.blue[700],
                  primarySwatch: Colors.blue
                ),
          debugShowCheckedModeBanner: false,
          home:const AuthScreen(),
        );
      }),
    );
  }
}
