import 'package:flutter/material.dart';
import 'package:noteapp/database/base.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final myCtrl = TextEditingController();
  final myCtrl2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.watch<NoteDataBase>().addNote(myCtrl.text, myCtrl2.text);
                myCtrl.clear();
                myCtrl2.clear();
                Navigator.pop(context);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: myCtrl,
              ),
              TextField(
                controller: myCtrl2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
