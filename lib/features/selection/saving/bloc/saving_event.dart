part of 'saving_bloc.dart';

@freezed
sealed class SavingEvent with _$SavingEvent {
  const factory SavingEvent.fetch() = SavingVersesFetch;

  const factory SavingEvent.save() = SavingSubmitData;
}
