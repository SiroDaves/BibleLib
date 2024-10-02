import 'package:flutter/material.dart';
//import 'package:textstyle_extensions/textstyle_extensions.dart';
//import 'package:timeago/timeago.dart' as timeago;

import '../../../core/theme/theme_styles.dart';
import '../../data/models/basic_model.dart';
import '../../data/models/book.dart';
//import '../../theme/theme_colors.dart';
//import '../../theme/theme_styles.dart';
//import '../../theme/theme_fonts.dart';
import '../../../core/theme/theme_colors.dart';
import '../../utils/app_util.dart';

var locale = 'en';

class BookItem extends StatelessWidget {
  final Selectable<Book> item;
  final Function()? onPressed;

  const BookItem({
    Key? key,
    required this.item,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          bottom: Sizes.xs, left: Sizes.xs, right: Sizes.xs),
      child: Card(
        color: item.isSelected
            ? ThemeColors.bgColorPrimary(context)
            : ThemeColors.bgColorBW(context),
        elevation: 5,
        child: Center(
          child: ListTile(
            onTap: onPressed,
            leading: Padding(
              padding: const EdgeInsets.all(Sizes.m),
              child: Icon(
                item.isSelected
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: item.isSelected
                    ? Colors.white
                    : ThemeColors.bgColorWB(context),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.xs),
              child: Text(
                refineTitle(item.data.title!),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: item.isSelected
                      ? Colors.white
                      : ThemeColors.bgColorWB(context),
                ),
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(bottom: Sizes.xs),
              child: Text(
                "${item.data.verses!} ${item.data.subTitle} verses",
                style: TextStyle(
                  fontSize: 18,
                  color: item.isSelected
                      ? Colors.white
                      : ThemeColors.bgColorWB(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*class ListedItem extends StatelessWidget {
  final Listed listed;
  final double height;
  final bool isSelected;
  final Function()? onPressed;

  const ListedItem({
    Key? key,
    required this.listed,
    required this.height,
    this.isSelected = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateValue = DateTime.parse(listed.updatedAt!);
    final String lastUpdate = timeago.format(dateValue);

    return Padding(
      padding: const EdgeInsets.only(right: 5, bottom: 5, top: 5),
      child: RawMaterialButton(
        fillColor: isSelected ? ThemeColors.primary : Colors.white,
        highlightColor: Colors.white.withOpacity(.1),
        focusElevation: 0,
        hoverColor: isSelected ? ThemeColors.primary : ThemeColors.accent,
        hoverElevation: 1,
        highlightElevation: 0,
        padding: const EdgeInsets.all(5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        onPressed: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              listed.title!,
              maxLines: 1,
              style: TextStyle(
                fontSize: height * 0.0261,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(color: ThemeColors.accent, height: height * 0.0049),
            const SizedBox(height: 5),
            listed.description!.isNotEmpty
                ? Text(
                    listed.description!,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: height * 0.015,
                    ),
                  )
                : const SizedBox.shrink(),
            Row(
              children: <Widget>[
                const Spacer(),
                TagView(
                  tagText:
                      '${listed.verse!} verse${listed.verse! == 1 ? '' : 's'}',
                  height: height,
                ),
                TagView(tagText: 'Updated $lastUpdate', height: height),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}*/

// ignore: must_be_immutable

// ignore: must_be_immutable
/*class DraftItem extends StatelessWidget {
  final Draft draft;
  final double height;
  final Function()? onPressed;

  DraftItem({
    Key? key,
    required this.draft,
    required this.height,
    this.onPressed,
  }) : super(key: key);

  bool hasChorus = false;
  String chorusText = '', versesText = '';

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    final verses = draft.content!.split("##");

    if (draft.content!.contains("CHORUS")) {
      hasChorus = true;
      chorusText = tr.hasChorus;
      versesText = '${verses.length - 1} ${tr.verses}';
    } else {
      versesText = '${verses.length} ${tr.verses}';
    }

    versesText = verses.length == 1 ? versesText : '${versesText}s';

    return Hero(
      tag: 'DraftIndex_${draft.id}',
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          elevation: 2,
          margin: EdgeInsets.only(bottom: height * 0.0049),
          child: Padding(
            padding: EdgeInsets.all(height * 0.0049),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  draft.title!,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: height * 0.0261,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(color: ThemeColors.accent, height: height * 0.0049),
                Text(
                  refineContent(verses[0]),
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: height * 0.0228,
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    TagView(tagText: versesText, height: height),
                    hasChorus
                        ? TagView(tagText: chorusText, height: height)
                        : const SizedBox.shrink(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
