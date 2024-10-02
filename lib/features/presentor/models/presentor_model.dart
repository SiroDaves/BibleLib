import 'package:flutter/material.dart';

class PresentorModel {
  String verseBook;
  String verseTitle;
  bool hasChorus;
  List<String> verseVerses;
  List<Tab> widgetTabs;
  List<Widget> widgetContent;

  PresentorModel({
    this.verseBook = '',
    this.verseTitle = '',
    this.hasChorus = false,
    this.verseVerses = const [],
    this.widgetTabs = const [],
    this.widgetContent = const [],
  });
}
