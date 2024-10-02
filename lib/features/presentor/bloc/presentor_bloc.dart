import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../common/utils/date_util.dart';
import '../../../common/data/models/history.dart';
import '../../../common/data/models/verse.dart';
import '../../../common/data/models/exts/verseext.dart';
import '../../../common/repository/database_repository.dart';
import '../../../core/di/injectable.dart';
import '../common/presentor_utils.dart';

part 'presentor_event.dart';
part 'presentor_state.dart';

part 'presentor_bloc.freezed.dart';

@injectable
class PresentorBloc extends Bloc<PresentorEvent, PresentorState> {
  PresentorBloc() : super(const PresentorState()) {
    on<PresentorLoadVerse>(_onLoadVerse);
    on<PresentorLikeVerse>(_onLikeVerse);
    on<PresentorSaveHistory>(_onSaveHistory);
  }

  final _dbRepo = getIt<DatabaseRepository>();

  Future<void> _onLoadVerse(
    PresentorLoadVerse event,
    Emitter<PresentorState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));
    var presentor = await loadVerse(event.verse);
    emit(state.copyWith(
      status: Status.loaded,
      verseBook: presentor.verseBook,
      verseTitle: presentor.verseTitle,
      hasChorus: presentor.hasChorus,
      verseVerses: presentor.verseVerses,
      widgetTabs: presentor.widgetTabs,
      widgetContent: presentor.widgetContent,
    ));
  }

  Future<void> _onLikeVerse(
    PresentorLikeVerse event,
    Emitter<PresentorState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));
    Verse? verse = await _dbRepo.findVerseById(event.verse.rid);
    event.verse.liked = !event.verse.liked;
    await _dbRepo.updateVerse(verse!);

    emit(
      state.copyWith(status: event.verse.liked ? Status.liked : Status.unliked),
    );
  }

  Future<void> _onSaveHistory(
    PresentorSaveHistory event,
    Emitter<PresentorState> emit,
  ) async {
    await _dbRepo.saveHistory(
      History(verse: event.verse.rid, created: getCurrentDate()),
    );

    emit(state.copyWith(status: Status.loaded));
  }
}
