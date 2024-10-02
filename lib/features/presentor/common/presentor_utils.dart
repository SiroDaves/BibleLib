import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../../../common/utils/app_util.dart';
import '../../../common/utils/constants/app_constants.dart';
import '../../../common/widgets/general/toast.dart';
import '../../../common/widgets/presentor/presentor.dart';
import '../../../common/data/models/exts/verseext.dart';
import '../bloc/presentor_bloc.dart';
import '../models/presentor_model.dart';

Future<PresentorModel> loadVerse(VerseExt verse) async {
  PresentorModel? presentor;
  try {
    var hasChorus = false;
    List<Tab> widgetTabs = [];
    List<Widget> widgetContent = [];
    var verseInfos = [], verseTexts = [];

    var verseBook = refineTitle(verse.versebook);
    var verseTitle = verseItemTitle(verse.verseNo, verse.title);

    var verseVerses = verse.content.split("##");
    final int verseCount = verseVerses.length;

    if (verse.content.contains("CHORUS")) {
      hasChorus = true;
    }

    if (hasChorus) {
      final String chorus = verseVerses[1].toString().replaceAll("CHORUS#", "");

      verseInfos.add("1");
      verseInfos.add("C");
      verseTexts.add(verseVerses[0]);
      verseTexts.add(chorus);

      for (int i = 2; i < verseCount; i++) {
        verseInfos.add(i.toString());
        verseInfos.add("C");
        verseTexts.add(verseVerses[i]);
        verseTexts.add(chorus);
      }
    } else {
      for (int i = 0; i < verseCount; i++) {
        verseInfos.add((i + 1).toString());
        verseTexts.add(verseVerses[i]);
      }
    }

    // Generate presentor slides
    for (final verse in verseInfos) {
      widgetTabs.add(
        Tab(
          child: PresentorInfo(
            info: verse,
            fontSize: 0.5 * .75,
          ),
        ),
      );
    }
    for (final verse in verseTexts) {
      widgetContent.add(PresentorText(
        lyrics: verse,
        /*onDoubleTap: () => Share.share(
          '${verse.replaceAll("#", "\n")}\n\n${verseTitle},\n${verseBook}',
          subject: l10n.shareVerse,
        ),*/
        //onLongPress: () => copyVerse(verse),
      ));
    }
    presentor = PresentorModel(
      hasChorus: hasChorus,
      verseBook: verseBook,
      verseTitle: verseTitle,
      verseVerses: verseVerses,
      widgetTabs: widgetTabs,
      widgetContent: widgetContent,
    );
  } catch (e) {
    //
  }
  return presentor!;
}

String getVerseContent(VerseExt verse) {
  var verseBook = refineTitle(verse.versebook);
  var verseTitle = verseItemTitle(verse.verseNo, verse.title);
  var verseContent = verse.content.replaceAll("#", "\n");
  return '$verseTitle - $verseBook\n\n$verseContent';
}

Future<void> shareVerse(VerseExt verse) async {
  try {
    Share.share(
      getVerseContent(verse) + AppConstants.fromApp,
      subject: 'Share the verse: ${verse.title}',
    );
  } catch (e) {
    logger('Error during sharing verse: $e');
  }
}

Future<void> copyVerse(VerseExt verse) async {
  try {
    await Clipboard.setData(ClipboardData(
      text: getVerseContent(verse) + AppConstants.fromApp,
    ));
    showToast(
      text: '${verse.title} copied!',
      state: ToastStates.success,
    );
  } catch (e) {
    logger('Error during copying verse: $e');
  }
}

Future<void> copyView(PresentorState state, String lyrics) async {
  try {
    await Clipboard.setData(
      ClipboardData(
        text:
            '${lyrics.replaceAll("#", "\n")}\n\n${state.verseTitle},\n${state.verseBook}',
      ),
    );
    showToast(
      text: 'Verse copied',
      state: ToastStates.success,
    );
  } catch (e) {
    logger('Error during copying verse: $e');
  }
}
