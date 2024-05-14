import 'dart:developer';

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
  List<Note> currentlist = NoteDataBase.currentlist;
  void readNotes() {
    context.read<NoteDataBase>().fetchNote();
  }

  @override
  void initState() {
    readNotes();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final noteDataBase = context.watch<NoteDataBase>();

    List<Note> currentlist = NoteDataBase.currentlist;

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          'Notes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const Icon(Icons.note_alt_outlined),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
                log(currentlist.toString());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView.builder(
          itemCount: currentlist.length,
          itemBuilder: (context, index) {
            final note = currentlist[index];
            return NoteTile(
              note: note,
              title: note.title.toString(),
              content: note.content.toString(),
              nid: note.id,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
