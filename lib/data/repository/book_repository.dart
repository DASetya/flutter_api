import 'package:flutter_api/data/api/api_helper.dart';
import 'package:flutter_api/data/model/book.dart';
import 'package:flutter_api/data/model/book_response.dart';

class BookRepository{
  ApiHelper _apiHelper;

  BookRepository(this._apiHelper);

  Future<Book> addProduct(Book newBook) async{
    final response = await _apiHelper.postData('/book', newBook.toMap());
    return Book.fromMap(response);
  }

  Future<List<dynamic>> getProduct()async{
    final response = await _apiHelper.getData('/book');
    return BookResponse.fromList(response).books;
  }
  
  Future<List<dynamic>> deleteProduct(id)async{
    final response = await _apiHelper.deleteData('/book/$id');
    return BookResponse.fromList(response).books;
  }
  
}