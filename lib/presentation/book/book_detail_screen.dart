import 'package:flutter/material.dart';
import 'package:flutter_api/data/model/book.dart';

class BookDetail extends StatelessWidget {
  final Book book;
  const BookDetail({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final book = ModalRoute.of(context)!.settings.arguments as Book;
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('Detail'),),
      body: Container(
        child: Column(
          children: [
            Text('Detail'),
            Text(book.title),
            Text(book.description),
            Text(book.publisher),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('BACK')),
          ],
        ),
      ),
    )
    );;
  }
}
