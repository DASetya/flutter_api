import 'package:flutter/material.dart';

class BookFormScreen extends StatefulWidget {
  const BookFormScreen({Key? key}) : super(key: key);

  @override
  _BookFormScreenState createState() => _BookFormScreenState();
}

class _BookFormScreenState extends State<BookFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Book'),),
      body: Container(
        child: TextButton(onPressed: (){}, child: Text('Submit'),),
      ),
    );
  }
}
