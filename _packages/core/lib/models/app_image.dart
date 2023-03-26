import 'package:equatable/equatable.dart';

/// {@template app_image}
/// AppImage description
/// {@endtemplate}
class AppImage extends Equatable {
  /// {@macro app_image}
  const AppImage({
    required this.image,
    required this.hash,
  });

  /// Creates a AppImage from Json map
  factory AppImage.fromJson(Map<String, dynamic> json) => AppImage(
        image: json['image'] as String,
        hash: json['hash'] as String,
      );

  /// A description for image
  final String image;

  /// A description for hash
  final String hash;

  /// Creates a copy of the current AppImage with property changes
  AppImage copyWith({
    String? image,
    String? hash,
  }) {
    return AppImage(
      image: image ?? this.image,
      hash: hash ?? this.hash,
    );
  }

  @override
  List<Object?> get props => [
        image,
        hash,
      ];

  /// Creates a Json map from a AppImage
  Map<String, dynamic> toJson() => <String, dynamic>{
        'image': image,
        'hash': hash,
      };
}
