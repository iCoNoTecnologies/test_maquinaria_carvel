import 'dart:convert';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Wand {
  @JsonProperty(name: 'wood')
  final String? wood;

  @JsonProperty(name: 'core')
  final String? core;

  @JsonProperty(name: 'length')
  final dynamic length; // puede venir como num o null

  Wand({this.wood, this.core, this.length});

  factory Wand.fromJson(dynamic json) {
    if (json == null) return Wand();
    return Wand(
      wood: json['wood'] as String?,
      core: json['core'] as String?,
      length: json['length'],
    );
  }

  Map<String, dynamic> toJson() => {
    'wood': wood,
    'core': core,
    'length': length,
  };
}

@jsonSerializable
class CharacterModel {
  @JsonProperty(name: 'id')
  final String? id;

  @JsonProperty(name: 'name')
  final String? name;

  @JsonProperty(name: 'alternate_names')
  final List<String>? alternateNames;

  @JsonProperty(name: 'species')
  final String? species;

  @JsonProperty(name: 'gender')
  final String? gender;

  @JsonProperty(name: 'house')
  final String? house;

  @JsonProperty(name: 'dateOfBirth')
  final String? dateOfBirth;

  @JsonProperty(name: 'yearOfBirth')
  final int? yearOfBirth;

  @JsonProperty(name: 'wizard')
  final bool? wizard;

  @JsonProperty(name: 'ancestry')
  final String? ancestry;

  @JsonProperty(name: 'eyeColour')
  final String? eyeColour;

  @JsonProperty(name: 'hairColour')
  final String? hairColour;

  @JsonProperty(name: 'wand')
  final Wand? wand;

  @JsonProperty(name: 'patronus')
  final String? patronus;

  @JsonProperty(name: 'hogwartsStudent')
  final bool? hogwartsStudent;

  @JsonProperty(name: 'hogwartsStaff')
  final bool? hogwartsStaff;

  @JsonProperty(name: 'actor')
  final String? actor;

  @JsonProperty(name: 'alive')
  final bool? alive;

  @JsonProperty(name: 'image')
  final String? image;

  CharacterModel({
    this.id,
    this.name,
    this.alternateNames,
    this.species,
    this.gender,
    this.house,
    this.dateOfBirth,
    this.yearOfBirth,
    this.wizard,
    this.ancestry,
    this.eyeColour,
    this.hairColour,
    this.wand,
    this.patronus,
    this.hogwartsStudent,
    this.hogwartsStaff,
    this.actor,
    this.alive,
    this.image,
  });

  // factory manual para garantizar compatibilidad
  factory CharacterModel.fromJson(dynamic json) {
    return CharacterModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      alternateNames: (json['alternate_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      species: json['species'] as String?,
      gender: json['gender'] as String?,
      house: json['house'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      yearOfBirth: json['yearOfBirth'] is int
          ? json['yearOfBirth'] as int?
          : (json['yearOfBirth'] != null
          ? int.tryParse(json['yearOfBirth'].toString())
          : null),
      wizard: json['wizard'] as bool?,
      ancestry: json['ancestry'] as String?,
      eyeColour: json['eyeColour'] as String?,
      hairColour: json['hairColour'] as String?,
      wand: Wand.fromJson(json['wand']),
      patronus: json['patronus'] as String?,
      hogwartsStudent: json['hogwartsStudent'] as bool?,
      hogwartsStaff: json['hogwartsStaff'] as bool?,
      actor: json['actor'] as String?,
      alive: json['alive'] as bool?,
      image: json['image'] as String?,
    );
  }

  static List<CharacterModel> decodeList(String jsonStr) =>
      (json.decode(jsonStr) as List<dynamic>)
          .map((e) => CharacterModel.fromJson(e))
          .toList();

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'alternate_names': alternateNames,
    'species': species,
    'gender': gender,
    'house': house,
    'dateOfBirth': dateOfBirth,
    'yearOfBirth': yearOfBirth,
    'wizard': wizard,
    'ancestry': ancestry,
    'eyeColour': eyeColour,
    'hairColour': hairColour,
    'wand': wand?.toJson(),
    'patronus': patronus,
    'hogwartsStudent': hogwartsStudent,
    'hogwartsStaff': hogwartsStaff,
    'actor': actor,
    'alive': alive,
    'image': image,
  };
}
