import 'package:flutter_api/data/model/book.dart';
import 'package:flutter_api/data/repository/book_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'api_helper_mock.dart';

void main(){
  group('Book Repository Test', (){

    test('When Book Repository Add Book then Return Book', ()async{
      final dummyBook = Book(
          id: 1,
          title: 'title',
          description: 'description',
          year: 2020,
          pages: 50,
          language: 'language',
          publisher: 'publisher',
          price: 50000,
          stock: 20);

      final _apiHelper = ApiHelperMock();
      when(_apiHelper.postData('/book', dummyBook.toMap()))
      .thenAnswer((_) async => Future<dynamic>.value(dummyBook.toMap()));

      final bookRepository = BookRepository(_apiHelper);

      final bookResult = bookRepository.addProduct(dummyBook);

      expect(bookResult, isA<Future<Book>>());
      expect((await bookResult).id, dummyBook.id);
      expect((await bookResult).title, dummyBook.title);
    });
    
    test('When Book Repository Get Book then Return List of Book', () {
      final dummyBooks = [
        Book(
            id: 1,
            title: 'title',
            description: 'description',
            year: 2020,
            pages: 50,
            language: 'language',
            publisher: 'publisher',
            price: 50000,
            stock: 20).toMap(),
        Book(
            id: 2,
            title: 'title',
            description: 'description',
            year: 2020,
            pages: 50,
            language: 'language',
            publisher: 'publisher',
            price: 50000,
            stock: 20).toMap(),
        Book(
            id: 3,
            title: 'title',
            description: 'description',
            year: 2020,
            pages: 50,
            language: 'language',
            publisher: 'publisher',
            price: 50000,
            stock: 20).toMap(),
      ];
    });


  });
}