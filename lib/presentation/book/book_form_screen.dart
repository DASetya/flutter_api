import 'package:flutter/material.dart';
import 'package:flutter_api/data/model/book.dart';
import 'package:flutter_api/data/repository/book_repository.dart';
import 'package:flutter_api/presentation/book/book_view_model.dart';
import 'package:flutter_api/widget/text_field_widget.dart';
import 'package:form_field_validator/form_field_validator.dart';

class BookFormScreen extends StatefulWidget {
  BookViewModel bookViewModel = BookViewModel();

  @override
  _BookFormScreenState createState() => _BookFormScreenState();
}

class _BookFormScreenState extends State<BookFormScreen> {

  BookRepository _bookRepository = BookRepository();
  TextEditingController bookTitle = new TextEditingController();
  TextEditingController bookDescription = new TextEditingController();
  TextEditingController bookYear = new TextEditingController();
  TextEditingController bookPages = new TextEditingController();
  TextEditingController bookLanguage = new TextEditingController();
  TextEditingController bookPublisher = new TextEditingController();
  TextEditingController bookPrice = new TextEditingController();
  TextEditingController bookStock = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Book'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                  key: _formKey,
                  child: Expanded(
                    child: Column(
                      children: [
                        TextFieldWidget(
                          con: bookTitle,
                          hint: 'Enter Book Title',
                          validate: MultiValidator([
                            RequiredValidator(errorText: "Please enter title"),
                          ]),
                        ),
                        TextFieldWidget(
                          con: bookDescription,
                          hint: 'Enter Book Description',
                          validate: MultiValidator([
                            RequiredValidator(errorText: "Please enter description"),
                          ]),
                        ),
                        TextFieldWidget(
                          con: bookYear,
                          hint: 'Enter Book Year',
                          validate: MultiValidator([
                            RequiredValidator(errorText: "Please enter year"),
                          ]),
                        ),
                        TextFieldWidget(
                          con: bookPages,
                          hint: 'Enter Book Pages',
                          validate: MultiValidator([
                            RequiredValidator(errorText: "Please enter page"),
                          ]),
                        ),
                        TextFieldWidget(
                          con: bookLanguage,
                          hint: 'Enter Book Language',
                          validate: MultiValidator([
                            RequiredValidator(errorText: "Please enter language"),
                          ]),
                        ),
                        TextFieldWidget(
                          con: bookPublisher,
                          hint: 'Enter Book Publisher',
                          validate: MultiValidator([
                            RequiredValidator(errorText: "Please enter publisher"),
                          ]),
                        ),
                        TextFieldWidget(
                          con: bookPrice,
                          hint: 'Rp.-',
                          validate: MultiValidator([
                            RequiredValidator(errorText: "Please enter price"),
                          ]),
                        ),
                        TextFieldWidget(
                          con: bookStock,
                          hint: 'Enter Book Stock',
                          validate: MultiValidator([
                            RequiredValidator(errorText: "Please enter stock"),
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    //_bookRepository.addProduct(new Book(title: bookTitle.text, description: bookDescription.text, year: bookYear, pages: pages, language: bookLanguage.text, publisher: bookPublisher.text, price: price, stock: stock))
                                    widget.bookViewModel.addBook(Book(
                                      title: bookTitle.text,
                                      description: bookDescription.text,
                                      year: int.parse(bookYear.text),
                                      pages: int.parse(bookPages.text),
                                      language: bookLanguage.text,
                                      publisher: bookPublisher.text,
                                      price: int.parse(bookPrice.text),
                                      stock: int.parse(bookStock.text),
                                    ));
                                  });
                                  Navigator.pop(context);
                                }
                              },
                              child: Text('Submit Asli')),
                        ),
                      ],
                    ),
                  )),
            ),
            // TextButton(
            //   onPressed: () {
            //     setState(() {
            //       widget.bookViewModel.addBook(Book(
            //         title: 'Kancil',
            //         description: 'description',
            //         year: 2008,
            //         pages: 50,
            //         language: 'English',
            //         publisher: 'Gramedia',
            //         price: 50000,
            //         stock: 20,
            //       ));
            //     });
            //   },
            //   child: Text('Submit Dummy'),
            // ),
          ],
        ),
      ),
    );
  }
}
