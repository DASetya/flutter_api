class Book{
  final int? id;
  final String title;
  final String description;
  final int year;
  final int pages;
  final String language;
  final String publisher;
  final int price;
  final int stock;

  Book({
    this.id,
    required this.title,
    required this.description,
    required this.year,
    required this.pages,
    required this.language,
    required this.publisher,
    required this.price,
    required this.stock
  });
}