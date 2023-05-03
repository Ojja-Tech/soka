import 'dart:io';

import 'package:assets/assets.dart';
import 'package:core/core.dart';
import 'package:core/utils/file.ext.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelector extends FormField<File> {
  final String? title;
  final String subtitle;
  final EdgeInsets padding;
  final double borderRadius;
  final Color? color;
  final Function(File?)? onImageChanged;

  ImageSelector({
    super.key,
    this.title,
    required this.subtitle,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.borderRadius = 12,
    this.color,
    this.onImageChanged,
    FormFieldSetter<File>? onSaved,
    FormFieldValidator<File>? validator,
    File? initialValue,
    bool enabled = true,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    String? restorationId,
  }) : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            enabled: enabled,
            autovalidateMode: autovalidateMode,
            restorationId: restorationId,
            builder: (FormFieldState<File> field) {
              void onChangeHandler(File? value) {
                field.didChange(value);
                onImageChanged?.call(value);
              }

              final _uiSettings = [
                AndroidUiSettings(
                  toolbarTitle: title,
                  toolbarColor: field.context.kTheme.primary0,
                  toolbarWidgetColor: Colors.white,
                  initAspectRatio: CropAspectRatioPreset.square,
                  lockAspectRatio: true,
                ),
                IOSUiSettings(
                  title: title,
                  aspectRatioPickerButtonHidden: true,
                  aspectRatioLockEnabled: true,
                  resetAspectRatioEnabled: false,
                ),
              ];

              if (field.value != null) {
                return Stack(
                  children: [
                    DottedBorder(
                      color: color ?? field.context.kTheme.primary3,
                      strokeWidth: 2,
                      dashPattern: const [6, 6],
                      borderType: BorderType.RRect,
                      radius: Radius.circular(borderRadius),
                      child: AspectRatio(
                        aspectRatio: 1.6,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(borderRadius),
                          child: Image.file(
                            field.value!,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: FloatingActionButton.small(
                          onPressed: () {
                            onChangeHandler(null);
                          },
                          child: const Icon(KapiraIcon.cross),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8, bottom: 5),
                          child: Chip(
                            label: Text(field.value!.toReadableSize(2)),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DottedBorder(
                    color: color ?? field.context.kTheme.primary3,
                    strokeWidth: 2,
                    dashPattern: const [6, 6],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(borderRadius),
                    padding: padding,
                    child: Center(
                      child: Column(
                        children: [
                          if (title != null) ...[
                            Text(title),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                          ElevatedButton(
                            onPressed: () async {
                              final XFile? systemImage = await _picker
                                  .pickImage(source: ImageSource.gallery);

                              CroppedFile? croppedFile =
                                  await _cropper.cropImage(
                                sourcePath: systemImage!.path,
                                compressFormat: ImageCompressFormat.png,
                                aspectRatio:
                                    const CropAspectRatio(ratioX: 1, ratioY: 1),
                                aspectRatioPresets: [
                                  CropAspectRatioPreset.square,
                                ],
                                uiSettings: _uiSettings,
                              );

                              if (croppedFile != null) {
                                onChangeHandler(File(croppedFile.path));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: field.context.kTheme.primary3,
                              foregroundColor: field.context.kTheme.secondary0,
                            ),
                            child: Text(subtitle),
                          )
                        ],
                      ),
                    ),
                  ),
                  if (field.hasError) ...[
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        field.errorText ?? "Error",
                        style: field.context.bodySmall
                            ?.copyWith(color: field.context.scheme.error),
                      ),
                    )
                  ]
                ],
              );
            });
}

final ImagePicker _picker = ImagePicker();
final _cropper = ImageCropper();
