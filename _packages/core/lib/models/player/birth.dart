import 'package:equatable/equatable.dart';

/// {@template birth}
/// Birth description
/// {@endtemplate}
class Birth extends Equatable {
  /// {@macro birth}
  const Birth({
    required this.date,
    this.place,
    required this.country,
  });

  /// Creates a Birth from Json map
  factory Birth.fromJson(Map<String, dynamic> json) => Birth(
        date: json['date'] as String,
        place: json['place'] as String?,
        country: json['country'] as String,
      );

  /// A description for date
  final String date;

  /// A description for place
  final String? place;

  /// A description for country
  final String country;

  /// Creates a copy of the current Birth with property changes
  Birth copyWith({
    String? date,
    String? Function()? place,
    String? country,
  }) {
    return Birth(
      date: date ?? this.date,
      place: place != null ? place() : this.place,
      country: country ?? this.country,
    );
  }

  @override
  List<Object?> get props => [
        date,
        place,
        country,
      ];

  /// Creates a Json map from a Birth
  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': date,
        'place': place,
        'country': country,
      };
}
