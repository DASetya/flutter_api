import 'package:flutter_api/data/api/api_helper.dart';
import 'package:flutter_api/data/model/book.dart';

class BookRepository{
  final ApiHelper _apiHelper = ApiHelper.INSTANCE;

  Future<Book> addProduct(Book newBook) async{
    final response = await _apiHelper.postData('/book', newBook.toMap());
    return Book.fromMap(response);
  }
}