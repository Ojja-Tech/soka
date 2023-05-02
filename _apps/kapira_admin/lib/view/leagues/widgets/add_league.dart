import 'dart:io';

import 'package:core/core.dart';
import 'package:core/models/image_file.dart';
import 'package:core/utils/image.ext.dart';
import 'package:flutter/material.dart';
import 'package:kapira_admin/view/leagues/models/add_league_model.dart';
import 'package:widgets/buttons.dart';
import 'package:widgets/drag_handle.dart';
import 'package:widgets/image_selector.dart';

class AddLeague extends StatefulWidget {
  const AddLeague({super.key});

  @override
  State<AddLeague> createState() => _AddLeagueState();
}

class _AddLeagueState extends State<AddLeague> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.kTheme.cardColor,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: DragHandle(
                  color: context.kTheme.handleColor,
                ),
              ),
              const SizedBox(height: 10),
              const Text('League Name'),
              const SizedBox(height: 10),
              TextFormField(
                controller: _nameCtrl,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'League name required';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              const Text('League Code'),
              const SizedBox(height: 10),
              TextFormField(
                controller: _codeCtrl,
                maxLength: 5,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'League code required';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 15),
              ImageSelector(
                padding: const EdgeInsets.symmetric(vertical: 65),
                title: 'League Logo',
                subtitle: 'Select Logo',
                onImageChanged: (image) {
                  _logo = image;
                },
              ),
              // ValueListenableBuilder<bool>(
              //   valueListenable: _isLogoValid,
              //   builder: (context, isLogoValid, child) {
              //     if (isFormValid) return const SizedBox.shrink();

              //     return child!;
              //   },
              //   child: Column(
              //     children: [
              //       const SizedBox(height: 5),
              //       Text(
              //         'League logo is required.',
              //         style: context.labelSmall,
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 20),
              ElevatedGradientButton(
                onPressed: () async {
                  // TODO: Create
                  _isLogoValid.value = _logo != null;

                  if (isFormValid) {
                    final hash = await _logo!.blurhash();

                    final form = AddLeagueModel(
                      _nameCtrl.text,
                      _codeCtrl.text,
                      ImageFile(_logo!, hash),
                    );

                    print(hash);
                  }
                },
                gradient: LinearGradient(colors: [
                  context.kTheme.primary2,
                  context.kTheme.primary3,
                ]),
                child: const Text('Create League'),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  bool get isFormValid =>
      _formKey.currentState?.validate() == true && _isLogoValid.value;

  // Setup
  late final TextEditingController _nameCtrl;
  late final TextEditingController _codeCtrl;
  late final ValueNotifier<bool> _isLogoValid;
  File? _logo;

  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _codeCtrl = TextEditingController();
    _nameCtrl = TextEditingController();
    _formKey = GlobalKey();
    _isLogoValid = ValueNotifier(false);
  }

  @override
  void dispose() {
    super.dispose();
    _codeCtrl.dispose();
    _nameCtrl.dispose();
    _isLogoValid.dispose();
  }
}
