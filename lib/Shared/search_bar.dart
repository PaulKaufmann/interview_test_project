import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tapped_interview_test/Models/book.dart';
import 'package:tapped_interview_test/services/mockup_service.dart';

class SearchBarModal extends StatefulWidget {
  const SearchBarModal({Key? key}) : super(key: key);

  @override
  State<SearchBarModal> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchBarModal> {
  final TextEditingController _controller = TextEditingController();
  final _focusNode = FocusNode();
  List<Book> _selectedBooks = [];
  bool _overlayVisible = false;
  Timer? _searchTimer;

  @override
  void initState() {
    super.initState();
    _controller.addListener(searchListener);
  }

  @override
  void dispose() {
    _controller.removeListener(searchListener);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void searchListener() {
    if (_controller.text.isEmpty) {
      if (_overlayVisible) {
        closeSearchModal();
      }
    } else {
      _overlayVisible = true;
      _searchTimer?.cancel();
      _searchTimer = Timer(const Duration(milliseconds: 350), () {
        search(_controller.text);
      });
    }
  }

  Future<void> search(String query) async {
    final List<Book> newSelectedBooks = await MockupService.mockupSearch(query);
    setState(() {
      _selectedBooks = newSelectedBooks;
    });
  }

  void closeSearchModal() {
    _searchTimer?.cancel();
    _focusNode.unfocus();

    //if using only setState here in some instances the overlay would not close
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(() {
        _overlayVisible = false;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () async {
            closeSearchModal();
          },
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: 10,
                offset: const Offset(0, 4),
                spreadRadius: 0,
              )
            ],
            color: Theme.of(context).dialogBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SearchBar(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        side: BorderSide.none,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).dialogBackgroundColor,
                    ),
                    onTap: () {
                      searchListener();
                    },
                    focusNode: _focusNode,
                    textStyle: MaterialStateProperty.all(
                      Theme.of(context).textTheme.labelMedium,
                    ),
                    hintText: "Search",
                    hintStyle: MaterialStateProperty.all(
                      Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.apply(color: const Color(0xFF99ABA5)),
                    ),
                    controller: _controller,
                    elevation: MaterialStateProperty.all(0.0),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 15),
                    ),
                    trailing: const [
                      Icon(
                        Icons.search,
                        color: Color(0xFF99ABA5),
                      )
                    ],
                  ),
                  Visibility(
                    visible: _overlayVisible,
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      child: _selectedBooks.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Keine Bücher gefunden',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            )
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              children: _selectedBooks.map((currentBook) {
                                return SearchListItem(book: currentBook);
                              }).toList(),
                            ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SearchListItem extends StatelessWidget {
  final Book book;

  const SearchListItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          //make nav go somewhere
        },
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(11, 8, 11, 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 53.6,
                      height: 78,
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
                    ],
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1,
              color: Theme.of(context).dividerColor,
            )
          ],
        ),
      ),
    );
  }
}
