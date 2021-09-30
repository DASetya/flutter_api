import 'package:flutter_api/data/model/book.dart';
import 'package:flutter_api/data/repository/book_repository.dart';

class BookViewModel{
  BookRepository _bookRepository = BookRepository();

  addBook(Book newBook)async{
    final newBookRegistered = await _bookRepository.addProduct(newBook);
    print(newBookRegistered);
  }
}