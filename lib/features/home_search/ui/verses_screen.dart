import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/theme_colors.dart';
import '../../../core/theme/theme_styles.dart';
import '../../../common/widgets/list_items/search_book_item.dart';
import '../../../common/widgets/list_items/search_verse_item.dart';
import '../../../common/widgets/progress/skeleton.dart';
import '../../../common/data/models/book.dart';
import '../../../common/data/models/exts/verseext.dart';
import '../../home/bloc/home_bloc.dart';
import '../../presentor/ui/presentor_screen.dart';
import '../../home_search/ui/verses_search.dart';

part 'widgets/books_list.dart';
part 'widgets/fab_widget.dart';
part '../../home_search/ui/widgets/verse_list.dart';

class VersesScreen extends StatefulWidget {
  const VersesScreen({super.key});

  @override
  State<VersesScreen> createState() => VersesScreenState();
}

class VersesScreenState extends State<VersesScreen> {
  late HomeBloc bloc;

  int setBook = 0, setVerse = 0;
  int pageSize = 20, currentPage = 0;
  bool hasMoreData = true;
  List<VerseExt> filtered = [];

  final ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    bloc = context.read<HomeBloc>();
    _scrollController.addListener(() {
      if (_scrollController.offset > 200) {
        if (!_showBackToTopButton) {
          setState(() => _showBackToTopButton = true);
        }
      } else {
        if (_showBackToTopButton) {
          setState(() => _showBackToTopButton = false);
        }
      }
    });
  }

  /// filter verses based on the selected book
  void filterVersesByBook() {
    if (!hasMoreData) return;

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        final nextPageItems = bloc.state.verses
            .where((verse) => verse.book == bloc.state.books[setBook].bookId)
            .skip(currentPage * pageSize)
            .take(pageSize)
            .toList();
        if (nextPageItems.isEmpty) {
          hasMoreData = false;
        } else {
          filtered.addAll(nextPageItems);
          currentPage++;
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.status == Status.loaded) {
          setState(() {
            setBook = 0;
            filterVersesByBook();
          });
        }
      },
      builder: (context, state) {
        if (state.status == Status.inProgress) {
          return const SkeletonLoading();
        }
        return Scaffold(
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                BooksList(parent: this),
                VersesList(parent: this),
              ],
            ),
          ),
          floatingActionButton: FabWidget(parent: this),
        );
      },
    );
  }
}
