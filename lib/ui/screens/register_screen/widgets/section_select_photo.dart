
import 'dart:io';

import 'package:chat_app/types/image_type.dart';
import 'package:chat_app/ui/screens/register_screen/widgets/menu_select_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:image_picker/image_picker.dart';

import '../view_model/register_state.dart';

class SectionPhotoProfile extends ConsumerWidget {
  const SectionPhotoProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageProfile =
        ref.watch(registerViewModel.select((value) => value.imageProfile));
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: imageProfile == null
              ? const Image(
                  image: Svg('assets/images/profile.svg'),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )
              : Image.file(
                  imageProfile,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () => selectImage(context, ref),
          child: const Text('Change Photo'),
        ),
      ],
    );
  }

  Future<void> selectImage(BuildContext context, WidgetRef ref) async {
    final option = await showModalBottomSheet<ImageType>(
      context: context,
      builder: (_) => const SelectorTypeImage(),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(5))),
    );
    if (option == null) return;

    ImagePicker picker = ImagePicker();

    XFile? image;

    if (option == ImageType.camera) {
      image = await picker.pickImage(source: ImageSource.camera, maxWidth:  500, maxHeight: 500);
    } else {
      image = await picker.pickImage(source: ImageSource.gallery, maxWidth: 500, maxHeight: 500);
    }

    if (image != null) {
      ref.read(registerViewModel.notifier).onImageChanged(File(image.path));
    }
  }
}
