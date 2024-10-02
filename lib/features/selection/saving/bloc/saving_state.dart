part of 'saving_bloc.dart';

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

  // status specific with this bloc
  /// Verses data fetched successfully.
  versesFetched,

  /// Verses data is being saved.
  versesSaving,

  /// Verses data saved successfully.
  versesSaved,
}

final class SavingState extends Equatable {
  const SavingState({
    this.status = Status.initial,
    this.verses = const [],
    this.progress = 0,
    this.feedback = '',
    this.isValid = false,
  });

  final Status status;
  final List<Verse> verses;
  final int progress;
  final String feedback;
  final bool isValid;

  SavingState copyWith({
    Status? status,
    List<Verse>? verses,
    int? progress,
    String? feedback,
    bool? isValid,
  }) {
    return SavingState(
      status: status ?? this.status,
      verses: verses ?? this.verses,
      progress: progress ?? this.progress,
      feedback: feedback ?? this.feedback,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, progress, verses, feedback];
}
