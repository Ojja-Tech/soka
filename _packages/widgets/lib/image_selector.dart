import 'dart:io';

import 'package:assets/assets.dart';
import 'package:core/core.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelector extends StatefulWidget {
  final String? title;
  final String subtitle;
  final EdgeInsets padding;
  final Radius borderRadius;
  final Color? color;
  final Function(File?)? onImageChanged;

  const ImageSelector({
    super.key,
    this.title,
    required this.subtitle,
    this.padding = const EdgeInsets.all(8),
    this.borderRadius = const Radius.circular(12),
    this.color,
    this.onImageChanged,
  });

  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final _cropper = ImageCropper();
  late final List<PlatformUiSettings> _uiSettings;

  @override
  void initState() {
    super.initState();
    _uiSettings = [
      AndroidUiSettings(
        toolbarTitle: widget.title,
        toolbarColor: context.kTheme.primary0,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: true,
      ),
      IOSUiSettings(
        title: widget.title,
        aspectRatioPickerButtonHidden: true,
        aspectRatioLockEnabled: true,
        resetAspectRatioEnabled: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (_image != null) {
      return Stack(
        children: [
          DottedBorder(
            color: widget.color ?? context.kTheme.primary3,
            strokeWidth: 2,
            dashPattern: const [6, 6],
            borderType: BorderType.RRect,
            radius: widget.borderRadius,
            child: AspectRatio(
              aspectRatio: 1.6,
              child: Image.file(
                _image!,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton.small(
                onPressed: () {
                  setState(() {
                    _image = null;
                    widget.onImageChanged?.call(null);
                  });
                },
                child: const Icon(KapiraIcon.cross),
              ),
            ),
          )
        ],
      );
    }
    return DottedBorder(
      color: widget.color ?? context.kTheme.primary3,
      strokeWidth: 2,
      dashPattern: const [6, 6],
      borderType: BorderType.RRect,
      radius: widget.borderRadius,
      padding: widget.padding,
      child: Center(
        child: Column(
          children: [
            if (widget.title != null) ...[
              Text(widget.title!),
              const SizedBox(
                height: 15,
              )
            ],
            ElevatedButton(
              onPressed: () async {
                final XFile? systemImage =
                    await _picker.pickImage(source: ImageSource.gallery);

                CroppedFile? croppedFile = await _cropper.cropImage(
                  sourcePath: systemImage!.path,
                  compressFormat: ImageCompressFormat.png,
                  aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
                  aspectRatioPresets: [
                    CropAspectRatioPreset.square,
                  ],
                  uiSettings: _uiSettings,
                );

                if (croppedFile != null) {
                  setState(() {
                    _image = File(croppedFile.path);
                    widget.onImageChanged?.call(_image!);
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: context.kTheme.primary3,
                foregroundColor: context.kTheme.secondary0,
              ),
              child: Text(widget.subtitle),
            )
          ],
        ),
      ),
    );
  }
}
