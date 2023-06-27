import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:tapped_interview_test/Models/book.dart';

class MockupService {
  static DateTime getRandomDate() {
    final Random gen = Random();
    const int range = 15 * 365; //15 years
    return DateTime.now().subtract(Duration(days: gen.nextInt(range)));
  }

  static List<Book> getMockupBookList() {
    return <Book>[
      Book(
        title: 'Harry Potter',
        author: 'J. K. Rowling',
        imageUrl: 'https://picsum.photos/seed/harry/685/1000',
        release: getRandomDate(),
      ),
      Book(
        title: 'The Bible',
        author: 'God',
        imageUrl: 'https://picsum.photos/seed/bible/685/1000',
        release: getRandomDate(),
      ),
      Book(
        title: 'Flutter Development',
        author: 'Stefan Schaller',
        imageUrl: 'https://picsum.photos/seed/schaller/685/1000',
        release: getRandomDate(),
      ),
      Book(
        title: 'A good book title',
        author: 'somebody',
        imageUrl: 'https://picsum.photos/seed/good/685/1000',
        release: getRandomDate(),
      ),
      Book(
        title: 'A good book title 2',
        author: 'somebody',
        imageUrl: 'https://picsum.photos/seed/good2/685/1000',
        release: getRandomDate(),
      ),
    ];
  }

  // used 'university-domains-list' to mock up book search
  // https://github.com/Hipo/university-domains-list
  static Future<List<Book>> mockupSearch(String query) async {
    final response = await http.get(
      Uri.parse(
        'http://universities.hipolabs.com/search?name=$query&limit=5',
      ),
    );
    if (response.statusCode == 200) {
      return json
          .decode(response.body)
          .map<Book>((dynamic bookJson) => Book.fromJsonMockup(bookJson))
          .toList();
    } else {
      throw Exception('Failed to load mockup books');
    }
  }
}