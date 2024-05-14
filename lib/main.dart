import 'package:flutter/material.dart';
import 'package:noteapp/database/base.dart';
import 'package:noteapp/pages/home.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDataBase.initialize();
  runApp(ChangeNotifierProvider(
    create: (context) => NoteDataBase(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
