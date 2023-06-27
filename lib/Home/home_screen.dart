import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tapped_interview_test/services/mockup_service.dart';
import 'package:tapped_interview_test/shared/bottom_navigation.dart';

import 'package:tapped_interview_test/Models/book.dart';
import 'package:tapped_interview_test/shared/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigation(),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: ContinueBooks()),
              ...newBooksSliverList(context),
            ],
          ),
          const SearchBarModal(),
        ],
      ),
    );
  }
}

class ContinueBooks extends StatelessWidget {
  final List<Book> bookList = MockupService.getMockupBookList();

  ContinueBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 98,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: Text(
            'Continue',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 166.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bookList.length,
            itemBuilder: (context, index) {
              return BookListItemRound(book: bookList[index]);
            },
          ),
        ),
      ],
    );
  }
}

List<Widget> newBooksSliverList(BuildContext context) {
  final List<Book> bookList = MockupService.getMockupBookList();

  return [
    SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 13.0),
        child: Text(
          'New',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: bookList.length,
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                BookListItemSquare(book: bookList[index]),
                if (index != (bookList.length - 1))
                  Divider(
                    thickness: 1,
                    color: Theme.of(context).dividerColor,
                  ),
              ],
            ),
          );
        },
      ),
    )
  ];
}

class BookListItemRound extends StatelessWidget {
  final Book book;

  const BookListItemRound({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //make nav go
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 8, 11, 8),
            child: Stack(
              children: [
                ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(50),
                    child: FadeInImage(
                      fadeOutDuration: const Duration(milliseconds: 150),
                      fadeInDuration: const Duration(milliseconds: 150),
                      image: NetworkImage(book.imageUrl),
                      placeholder:
                          const AssetImage("assets/Book_Cover_Fallback.png"),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/Book_Cover_Fallback.png',
                          fit: BoxFit.fitWidth,
                        );
                      },
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(17),
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(91, 94, 166, 1),
                        ),
                        child: SvgPicture.asset(
                          'assets/Play.svg',
                          height: 25,
                          width: 22,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(book.title, style: Theme.of(context).textTheme.labelMedium),
          Text(book.author, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}

class BookListItemSquare extends StatelessWidget {
  final Book book;

  const BookListItemSquare({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //make nav go somewhere
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 11, 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 75,
                height: 100,
                child: FadeInImage(
                  fadeOutDuration: const Duration(milliseconds: 150),
                  fadeInDuration: const Duration(milliseconds: 150),
                  image: NetworkImage(book.imageUrl),
                  placeholder:
                      const AssetImage("assets/Book_Cover_Fallback.png"),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/Book_Cover_Fallback.png',
                      fit: BoxFit.fitWidth,
                    );
                  },
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  book.title,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  book.author,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(
                          'assets/Calendar.svg',
                          height: 16,
                          width: 16,
                          fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).secondaryHeaderColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat('d MMM y').format(
                          (book.release),
                        ),
                        style: Theme.of(context).textTheme.labelSmall?.apply(
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.50, color: Color(0xFFD9E5E2)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: SvgPicture.asset(
              'assets/Bell.svg',
              height: 20,
              width: 20,
              fit: BoxFit.scaleDown,
            ),
          )
        ],
      ),
    );
  }
}
