import 'dart:io';
import 'dart:math';

extension FileX on File {
  String toReadableSize(int decimals) {
    final bytes = lengthSync();
    if (bytes == 0) {
      return "0 B";
    }

    const k = 1024;
    final dm = decimals < 0 ? 0 : decimals;
    const sizes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

    final i = (log(bytes) / log(k)).floor();
    final unit = sizes[i];
    return '${(bytes / pow(k, i)).toStringAsFixed(
      ['B', 'KB'].contains(unit) ? 0 : dm,
    )} $unit';
  }
}
