import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_buscar_gifs/ui/home_page.dart';

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white))
        )
    ),
  ));
}
