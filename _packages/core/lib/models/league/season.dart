import 'package:equatable/equatable.dart';

/// {@template season}
/// Season description
/// {@endtemplate}
class Season extends Equatable {
  /// {@macro season}
  const Season({
    required this.year,
    required this.start,
    required this.end,
    required this.current,
  });

  /// Creates a Season from Json map
  factory Season.fromJson(Map<String, dynamic> json) => Season(
        year: json['year'] as int,
        start: json['start'] as String,
        end: json['end'] as String,
        current: json['current'] as bool,
      );

  /// A description for year
  final int year;

  /// A description for start
  final String start;

  /// A description for end
  final String end;

  /// A description for current
  final bool current;

  /// Creates a copy of the current Season with property changes
  Season copyWith({
    int? year,
    String? start,
    String? end,
    bool? current,
  }) {
    return Season(
      year: year ?? this.year,
      start: start ?? this.start,
      end: end ?? this.end,
      current: current ?? this.current,
    );
  }

  @override
  List<Object?> get props => [
        year,
        start,
        end,
        current,
      ];

  /// Creates a Json map from a Season
  Map<String, dynamic> toJson() => <String, dynamic>{
        'year': year,
        'start': start,
        'end': end,
        'current': current,
      };
}
