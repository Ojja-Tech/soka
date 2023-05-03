import 'package:equatable/equatable.dart';

import '../app_image.dart';

/// {@template team}
/// Team description
/// {@endtemplate}
class Team extends Equatable {
  /// {@macro team}
  const Team({
    required this.id,
    required this.name,
    required this.code,
    required this.logo,
  });

  /// Creates a Team from Json map
  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json['id'] as String,
        name: json['name'] as String,
        code: json['code'] as String,
        logo: AppImage.fromJson(json['logo'] as Map<String, dynamic>),
      );

  /// A description for id
  final String id;

  /// A description for name
  final String name;

  /// A description for code
  final String code;

  /// A description for logo
  final AppImage logo;

  /// Creates a copy of the current Team with property changes
  Team copyWith({
    String? id,
    String? name,
    String? code,
    AppImage? logo,
  }) {
    return Team(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      logo: logo ?? this.logo,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        code,
        logo,
      ];

  /// Creates a Json map from a Team
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'code': code,
        'logo': logo,
      };
}
