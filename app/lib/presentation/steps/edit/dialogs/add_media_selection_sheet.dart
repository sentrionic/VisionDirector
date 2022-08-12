import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vision_director/application/steps/edit_step/edit_step_cubit.dart';
import 'package:vision_director/domain/core/constants.dart';
import 'package:vision_director/presentation/common/utils/media_utils.dart';
import 'package:vision_director/presentation/common/widgets/info_label.dart';
import 'package:vision_director/presentation/common/widgets/modal_button.dart';
import 'package:vision_director/presentation/common/widgets/spaced_divider.dart';

/// Displays a BottomSheet where the user can select a file.
class AddMediaSelectionSheet extends StatelessWidget {
  final EditStepCubit cubit;
  const AddMediaSelectionSheet({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            controller: ModalScrollController.of(context),
            child: Column(
              children: [
                const Text(
                  "Select Media",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SpacedDivider(),
                const InfoLabel(label: "From Gallery"),
                ModalButton(
                  label: "Image",
                  icon: Icons.image,
                  onClick: () {
                    Navigator.of(context).pop();
                    _pickImage(ImageSource.gallery, cubit);
                  },
                ),
                ModalButton(
                  label: "Video",
                  icon: Icons.video_collection_rounded,
                  onClick: () {
                    Navigator.of(context).pop();
                    _pickVideo(ImageSource.gallery, cubit);
                  },
                ),
                const SpacedDivider(),
                const InfoLabel(label: "From Camera"),
                ModalButton(
                  label: "Image",
                  icon: Icons.image,
                  onClick: () {
                    Navigator.of(context).pop();
                    _pickImage(ImageSource.camera, cubit);
                  },
                ),
                ModalButton(
                  label: "Video",
                  icon: Icons.video_collection_rounded,
                  onClick: () {
                    Navigator.of(context).pop();
                    _pickVideo(ImageSource.camera, cubit);
                  },
                ),
                const SpacedDivider(),
                const InfoLabel(label: "From Assets"),
                ModalAssetButton(
                  label: "Black Image",
                  color: Colors.black,
                  onClick: () {
                    Navigator.of(context).pop();
                    _pickAssetFile("black.png", cubit);
                  },
                ),
                ModalAssetButton(
                  label: "White Image",
                  color: Colors.white,
                  onClick: () {
                    Navigator.of(context).pop();
                    _pickAssetFile("white.png", cubit);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Opens the [ImagePicker] and sets the selected video in the state.
  Future<void> _pickVideo(ImageSource source, EditStepCubit cubit) async {
    final pickedFile = await ImagePicker().pickVideo(source: source);
    if (pickedFile != null) {
      final media = File(pickedFile.path);
      final duration = await getVideoDuration(media.path);

      // Set the selected file in the state
      cubit.changeMedia(
        media,
        Duration(seconds: duration.round()),
        "video",
      );

      // Generate a thumbnail and set it in the state
      final thumbnail = await getThumbnail(media.path);
      cubit.changeThumbnail(thumbnail);

      // If it's a camera recording, save it for reuse.
      if (source == ImageSource.camera) {
        GallerySaver.saveVideo(media.path);
      }

      // Confirm the aspect ratio
      if (!await checkIfVideoIsLandscape(media)) {
        cubit.changeIsPortrait(isPortrait: true);
      }
    }
  }

  /// Opens the [ImagePicker] and sets the selected image in the state.
  Future<void> _pickImage(ImageSource source, EditStepCubit cubit) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      final media = File(pickedFile.path);

      // Set the selected file in the state
      cubit.changeMedia(
        media,
        const Duration(seconds: Guidelines.defaultDuration),
        "image",
      );

      // If it's a camera recording, save it for reuse.
      if (source == ImageSource.camera) {
        GallerySaver.saveImage(media.path);
      }

      // Confirm the aspect ratio
      if (!await checkIfImageIsLandscape(media)) {
        cubit.changeIsPortrait(isPortrait: true);
      }
    }
  }

  /// Fetches the selected asset from the asset bundle and sets it in the state.
  Future<void> _pickAssetFile(String asset, EditStepCubit cubit) async {
    // Get the asset
    final bytes = await rootBundle.load("assets/resources/$asset");
    final buffer = bytes.buffer;

    // Copy the asset
    final directory = (await getApplicationDocumentsDirectory()).path;
    final file = await File("$directory/$asset").writeAsBytes(
      buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes),
    );

    // Set the selected file in the state
    cubit.changeMedia(
      file,
      const Duration(seconds: Guidelines.defaultDuration),
      "image",
    );
  }
}
