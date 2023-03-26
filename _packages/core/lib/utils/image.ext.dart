import 'dart:io';
import 'dart:isolate';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:image/image.dart' as img;

extension ImageX on File {
  Future<String> blurhash() async {
    final filePath = path;

    return Isolate.run(() async {
      File file = File(filePath);

      final data = file.readAsBytesSync();
      final image = img.decodeImage(data);
      final blurHash = BlurHash.encode(image!, numCompX: 4, numCompY: 3);
      return blurHash.hash;
    });
  }
}
