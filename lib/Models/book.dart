import 'package:tapped_interview_test/services/mockup_service.dart';

class Book {
  String title;
  String author;
  String imageUrl;
  DateTime release;

  Book({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.release,
  });

  // not needed right now
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      author: json['author'],
      imageUrl: json['imageUrl'],
      release: json['release'],
    );
  }

  factory Book.fromJsonMockup(Map<String, dynamic> json) {
    return Book(
      title: json['name'],
      author: json['country'],
      imageUrl: 'https://picsum.photos/seed/${json['alpha_two_code']}/685/1000',
      release: MockupService.getRandomDate(),
    );
  }
}
