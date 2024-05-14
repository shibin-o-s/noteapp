import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:noteapp/database/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDataBase extends ChangeNotifier{

 static late Isar isar;
 static final List<Note>currentlist= [];

  //initialize

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  //create
  Future<void> addNote(String head,String content)async{
    print('*****ADDNOTE CALLED******');
    final newNote = Note(title: head, content: content);
    isar.writeTxn(() => isar.notes.put(newNote));
  }
  //update 

  //read
  Future<void> fetchNote()async{
    print(' *****FETCH NOTE CALLED*****');
    List<Note> fetchedNotes=await isar.notes.where().findAll();
    currentlist.clear();
    currentlist.addAll(fetchedNotes);
    notifyListeners();
  }
  //delete
  Future<void>  deleteNote(Id id)async{
    await isar.writeTxn(() => deleteNote(id));
    await fetchNote();
  }
}
