import 'package:flutter/material.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({Key? key}) : super(key: key);

  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text('Book List'),
            FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/add-book');
                },
                child: Text('+', style: TextStyle(fontSize: 34),),
            )
          ],
        ),
      ),
    );
  }
}
