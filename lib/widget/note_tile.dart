import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/database/base.dart';
import 'package:noteapp/pages/display.dart';
import 'package:provider/provider.dart';

class NoteTile extends StatefulWidget {
  const NoteTile(
      {super.key,
      required this.title,
      required this.content,
      required this.nid});

  final String title;
  final String content;
  final int nid;

  @override
  State<NoteTile> createState() => _NoteTileState();
}

class _NoteTileState extends State<NoteTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DisplayPage()));
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
        padding: EdgeInsets.all(10),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  widget.content,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.share_outlined),
                        label: Text('share'))),
                PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.archive_rounded),
                        label: Text('archive'))),
                PopupMenuItem(
                    child: TextButton.icon(
                        onPressed: () {
                          context.watch<NoteDataBase>().deleteNote(widget.nid);
                          setState(() {});
                        },
                        icon: Icon(Icons.delete),
                        label: Text('delete')))
              ],
            )
          ],
        ),
      ),
    );
  }
}
