import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({super.key,required this.title,required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      padding: EdgeInsets.all(10),
      width:MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
          Text(content,style: TextStyle(fontSize: 18),),
        ],
      ),
    );
  }
}