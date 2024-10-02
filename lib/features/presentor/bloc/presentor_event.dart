part of 'presentor_bloc.dart';

@freezed
sealed class PresentorEvent with _$PresentorEvent {
  const factory PresentorEvent.loadVerse(VerseExt verse) = PresentorLoadVerse;

  const factory PresentorEvent.likeVerse(VerseExt verse) = PresentorLikeVerse;

  const factory PresentorEvent.history(VerseExt verse) = PresentorSaveHistory;
}
