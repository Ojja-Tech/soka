import 'dart:io';

/// Holder for image file data in forms
class ImageFile {
  final File image;
  final String hash;

  const ImageFile(this.image, this.hash);
}
