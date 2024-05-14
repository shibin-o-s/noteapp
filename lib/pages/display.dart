import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  const DisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your note',style: TextStyle(fontWeight: FontWeight.bold),),
        elevation: 2,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
      ),
    );
  }
}
