import 'package:equatable/equatable.dart';
import 'package:core/models/league/season.dart';

/// {@template league}
/// League description
/// {@endtemplate}
class League extends Equatable {
  /// {@macro league}
  const League({
    required this.id,
    required this.name,
    required this.logo,
    required this.seasons,
  });

  /// Creates a League from Json map
  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json['id'] as int,
        name: json['name'] as String,
        logo: json['logo'] as String,
        seasons: (json['seasons'] as List<dynamic>)
            .map((dynamic e) => Season.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  /// A description for id
  final int id;

  /// A description for name
  final String name;

  /// A description for logo
  final String logo;

  /// A description for seasons
  final List<Season> seasons;

  /// Creates a copy of the current League with property changes
  League copyWith({
    int? id,
    String? name,
    String? logo,
    List<Season>? seasons,
  }) {
    return League(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      seasons: seasons ?? this.seasons,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        logo,
        seasons,
      ];

  /// Creates a Json map from a League
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'logo': logo,
        'seasons': seasons,
      };
}
