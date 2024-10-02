part of 'presentor_bloc.dart';

enum Status {
  // Generic statuses
  /// No action has been taken so far.
  initial,

  /// An action is being processed.
  inProgress,

  /// A process has been completed successfully.
  success,

  /// A process has failed.
  failure,

  /// A process has been canceled.
  canceled,

  /// Verse loaded successfully.
  loaded,

  /// Done liking verse.
  liked,

  /// Done unliking verse.
  unliked,
}

final class PresentorState extends Equatable {
  const PresentorState({
    this.status = Status.initial,
    this.verseBook = '',
    this.verseTitle = '...',
    this.hasChorus = false,
    this.verseVerses = const <String>[],
    this.widgetTabs = const <Tab>[],
    this.widgetContent = const <Widget>[],
    this.feedback = '',
  });

  final Status status;
  final String verseBook;
  final String verseTitle;
  final bool hasChorus;
  final List<String> verseVerses;
  final List<Tab> widgetTabs;
  final List<Widget> widgetContent;
  final String feedback;

  PresentorState copyWith({
    Status? status,
    String? verseBook,
    String? verseTitle,
    bool? hasChorus,
    List<String>? verseVerses,
    List<Tab>? widgetTabs,
    List<Widget>? widgetContent,
    String? feedback,
  }) {
    return PresentorState(
      status: status ?? this.status,
      verseBook: verseBook ?? this.verseBook,
      verseTitle: verseTitle ?? this.verseTitle,
      hasChorus: hasChorus ?? this.hasChorus,
      verseVerses: verseVerses ?? this.verseVerses,
      widgetTabs: widgetTabs ?? this.widgetTabs,
      widgetContent: widgetContent ?? this.widgetContent,
      feedback: feedback ?? this.feedback,
    );
  }

  @override
  List<Object> get props => [
        status,
        verseBook,
        verseTitle,
        hasChorus,
        verseVerses,
        widgetTabs,
        widgetContent,
        feedback
      ];
}
