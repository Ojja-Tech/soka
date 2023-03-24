import 'package:equatable/equatable.dart';
import 'package:core/models/player/birth.dart';

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
    this.height,
    this.weight,
    required this.injured,
    required this.photo,
  });

  /// Creates a Player from Json map
  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json['id'] as int,
        name: json['name'] as String,
        firstname: json['firstname'] as String,
        lastname: json['lastname'] as String,
        age: json['age'] as int,
        birth: Birth.fromJson(json['birth'] as Map<String, dynamic>),
        nationality: json['nationality'] as String,
        height: json['height'] as String?,
        weight: json['weight'] as String?,
        injured: json['injured'] as bool,
        photo: json['photo'] as String,
      );

  /// A description for id
  final int id;

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
  final String? height;

  /// A description for weight
  final String? weight;

  /// A description for injured
  final bool injured;

  /// A description for photo
  final String photo;

  /// Creates a copy of the current Player with property changes
  Player copyWith({
    int? id,
    String? name,
    String? firstname,
    String? lastname,
    int? age,
    Birth? birth,
    String? nationality,
    String? Function()? height,
    String? Function()? weight,
    bool? injured,
    String? photo,
  }) {
    return Player(
      id: id ?? this.id,
      name: name ?? this.name,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      age: age ?? this.age,
      birth: birth ?? this.birth,
      nationality: nationality ?? this.nationality,
      height: height != null ? height() : this.height,
      weight: weight != null ? weight() : this.weight,
      injured: injured ?? this.injured,
      photo: photo ?? this.photo,
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
      };
}
