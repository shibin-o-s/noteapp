import 'package:flutter/material.dart';
import 'package:noteapp/database/note.dart';

class DisplayPage extends StatelessWidget {
  const DisplayPage({super.key, required this.note});
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your note',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 2,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            Text(
              note.title!,
              style: const TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
            ),
            Text(
              note.content!,
              style: const TextStyle(),
            ) //stylling nee cheythoooo :)
          ],
        ),
      ),
    );
  }
}
