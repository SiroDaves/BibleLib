part of '../verses_screen.dart';

class VersesList extends StatefulWidget {
  final VersesScreenState parent;
  const VersesList({super.key, required this.parent});

  @override
  State<VersesList> createState() => VersesListState();
}

class VersesListState extends State<VersesList> {
  late VersesScreenState parent;

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    ScrollController scrollController = ScrollController();

    return ListView.builder(
      controller: scrollController,
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: Sizes.xs, right: Sizes.m),
      itemCount: parent.filtered.length + 1,
      itemBuilder: (context, index) {
        if (index == parent.filtered.length) {
          if (parent.hasMoreData) {
            parent.filterVersesByBook();
            return const SkeletonLoading();
          } else {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(''),
              ),
            );
          }
        }
        final VerseExt verse = parent.filtered[index];
        return SearchVerseItem(
          verse: verse,
          height: 50,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PresentorScreen(verse: verse),
              ),
            );
          },
        );
      },
    );
  }
}
