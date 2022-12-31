import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'screens/HomePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    var dir = await getApplicationDocumentsDirectory();
    
  await Hive.initFlutter(dir.path);
  var dataBase=await Hive.openBox('Todo');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
