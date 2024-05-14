import 'package:flutter/material.dart';
import 'package:noteapp/database/base.dart';
import 'package:noteapp/database/note.dart';
import 'package:noteapp/pages/addpage.dart';
import 'package:noteapp/widget/note_tile.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void readNotes(){
    context.read<NoteDataBase>().fetchNote();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readNotes();
  }
  @override
  Widget build(BuildContext context) {

    final noteDataBase=context.watch<NoteDataBase>();
    List<Note> currentlist= NoteDataBase.currentlist;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Icon(Icons.note_alt_outlined),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 10, right: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            final note=currentlist[index];
            return NoteTile(title:note.title.toString() , content: note.content.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
