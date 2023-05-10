import 'package:chat_app/types/image_type.dart';
import 'package:flutter/material.dart';

class SelectorTypeImage extends StatelessWidget {
  const SelectorTypeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: ImageType.values.map((value) {
        return ListTile(
          leading: Icon(value.icon),
          title: Text(value.text),
          onTap: () {
            Navigator.pop(context, value);
          },
        );
      }).toList(),
    );
  }
}
