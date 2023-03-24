import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:widgets/buttons.dart';
import 'package:widgets/drag_handle.dart';
import 'package:widgets/image_selector.dart';

class AddTeam extends StatelessWidget {
  const AddTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: context.kTheme.cardColor,
        // borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 20),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: DragHandle(
                  color: context.kTheme.handleColor,
                ),
              ),
              const SizedBox(height: 10),
              const Text('Team Name'),
              const SizedBox(height: 10),
              TextFormField(),
              const SizedBox(height: 10),
              const Text('Team Code'),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                    helperText: 'Team Code e.g OFV for O-FIVE'),
              ),
              const SizedBox(height: 15),
              const ImageSelector(
                padding: EdgeInsets.symmetric(vertical: 65),
                title: 'Team Logo',
                subtitle: 'Select Logo',
              ),
              const SizedBox(height: 20),
              ElevatedGradientButton(
                onPressed: () {
                  // TODO: Create
                },
                gradient: LinearGradient(colors: [
                  context.kTheme.primary2,
                  context.kTheme.primary3,
                ]),
                child: const Text('Create Team'),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
