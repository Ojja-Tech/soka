import 'package:equatable/equatable.dart';

import '../app_image.dart';
import 'birth.dart';

/// {@template player}
/// Player description
/// {@endtemplate}
class Player extends Equatable {
  /// {@macro player}
  const Player({
    required this.id,
    required this.name,
    required this.firstname,
    required this.lastname,
    required this.age,
    required this.birth,
    required this.nationality,
    required this.height,
    required this.weight,
    required this.injured,
    required this.photo,
    required this.number,
    required this.position,
  });

  /// Creates a Player from Json map
  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json['id'] as String,
        name: json['name'] as String,
        firstname: json['firstname'] as String,
        lastname: json['lastname'] as String,
        age: json['age'] as int,
        birth: Birth.fromJson(json['birth'] as Map<String, dynamic>),
        nationality: json['nationality'] as String,
        height: json['height'] as String,
        weight: json['weight'] as String,
        injured: json['injured'] as bool,
        photo: AppImage.fromJson(json['photo'] as Map<String, dynamic>),
        number: json['number'] as int,
        position: json['position'] as String,
      );

  /// A description for id
  final String id;

  /// A description for name
  final String name;

  /// A description for firstname
  final String firstname;

  /// A description for lastname
  final String lastname;

  /// A description for age
  final int age;

  /// A description for birth
  final Birth birth;

  /// A description for nationality
  final String nationality;

  /// A description for height
  final String height;

  /// A description for weight
  final String weight;

  /// A description for injured
  final bool injured;

  /// A description for photo
  final AppImage photo;

  /// A description for number
  final int number;

  /// A description for position
  final String position;

  /// Creates a copy of the current Player with property changes
  Player copyWith({
    String? id,
    String? name,
    String? firstname,
    String? lastname,
    int? age,
    Birth? birth,
    String? nationality,
    String? height,
    String? weight,
    bool? injured,
    AppImage? photo,
    int? number,
    String? position,
  }) {
    return Player(
      id: id ?? this.id,
      name: name ?? this.name,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      age: age ?? this.age,
      birth: birth ?? this.birth,
      nationality: nationality ?? this.nationality,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      injured: injured ?? this.injured,
      photo: photo ?? this.photo,
      number: number ?? this.number,
      position: position ?? this.position,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        firstname,
        lastname,
        age,
        birth,
        nationality,
        height,
        weight,
        injured,
        photo,
        number,
        position,
      ];

  /// Creates a Json map from a Player
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'firstname': firstname,
        'lastname': lastname,
        'age': age,
        'birth': birth,
        'nationality': nationality,
        'height': height,
        'weight': weight,
        'injured': injured,
        'photo': photo,
        'number': number,
        'position': position,
      };
}
