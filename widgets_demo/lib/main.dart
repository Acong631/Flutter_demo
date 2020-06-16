import 'package:flutter/material.dart';
import 'app.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  ErrorWidget.builder = (FlutterErrorDetails errorDetails){
    print(errorDetails.toString());
    return Container(
      color:  Colors.white,
      child: Center(
        child: Text(
          'Flutter 崩溃了',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  };

  runApp(App());
}

