import 'package:json_annotation/json_annotation.dart';

part 'bible_resp.g.dart';

enum ScriptDirection { LTR, RTL }

enum BibleType { TEXT }

@JsonSerializable()
class BibleResp {
  List<BibleModel>? data;

  BibleResp({
    this.data,
  });

  factory BibleResp.fromJson(Map<String, dynamic> json) => _$BibleRespFromJson(json);

  Map<String, dynamic> toJson() => _$BibleRespToJson(this);
}

@JsonSerializable()
class BibleModel {
  String? id;
  String? dblId;
  String? relatedDbl;
  String? name;
  String? nameLocal;
  String? abbreviation;
  String? abbreviationLocal;
  String? description;
  String? descriptionLocal;
  Language? language;
  List<AudioBible>? countries;
  BibleType? type;
  String? updatedAt;
  List<AudioBible>? audioBibles;

  BibleModel({
    this.id,
    this.dblId,
    this.relatedDbl,
    this.name,
    this.nameLocal,
    this.abbreviation,
    this.abbreviationLocal,
    this.description,
    this.descriptionLocal,
    this.language,
    this.countries,
    this.type,
    this.updatedAt,
    this.audioBibles,
  });
  factory BibleModel.fromJson(Map<String, dynamic> json) => _$BibleModelFromJson(json);

  Map<String, dynamic> toJson() => _$BibleModelToJson(this);
}

@JsonSerializable()
class AudioBible {
  String? id;
  String? name;
  String? nameLocal;
  String? dblId;

  AudioBible({
    this.id,
    this.name,
    this.nameLocal,
    this.dblId,
  });
  factory AudioBible.fromJson(Map<String, dynamic> json) => _$AudioBibleFromJson(json);

  Map<String, dynamic> toJson() => _$AudioBibleToJson(this);
}

@JsonSerializable()
class Language {
  String? id;
  String? name;
  String? nameLocal;
  String? script;
  ScriptDirection? scriptDirection;

  Language({
    this.id,
    this.name,
    this.nameLocal,
    this.script,
    this.scriptDirection,
  });
  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}
