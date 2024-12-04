import 'package:aifer_machinetest/view/features/homepage.dart';
import 'package:aifer_machinetest/view_model/list_photo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context){
        return ListPhotoProvider();
      })],
      child: MaterialApp(
        home: HomePage(),
      theme:ThemeData.light() ,
      ),
    );
  }
}
