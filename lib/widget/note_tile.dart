import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/database/base.dart';
import 'package:noteapp/database/note.dart';
import 'package:noteapp/pages/display.dart';
import 'package:provider/provider.dart';

class NoteTile extends StatefulWidget {
  const NoteTile(
      {super.key,
      required this.title,
      required this.content,
      required this.nid,
      required this.note});

  final String title;
  final String content;
  final int nid;
  final Note note;
  @override
  State<NoteTile> createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {
  @override
  Widget build(BuildContext context) {
    final noteDataBase = context.read<NoteDataBase>();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DisplayPage(
                      note: widget.note,
                    )));
      },
      onLongPress: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Pop()));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: Colors.black12, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset.zero,
                  blurRadius: 1,
                  spreadRadius: .01)
            ]),
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Expanded(
                  child: Text(
                    widget.content,
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.share_outlined),
                        label: const Text('share'))),
                PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.archive_rounded),
                        label: const Text('archive'))),
                PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: () {
                          noteDataBase.deleteNote(widget.nid);
                          Navigator.pop(context);
                          setState(() {});
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text('delete')))
              ],
            ),
            // IconButton(onPressed: () {}, icon: Icon(Icons.edit))
          ],
        ),
      ),
    );
  }
}
