

import 'package:flutter/material.dart';

enum ImageType{
    camera(icon: Icons.camera_alt, text: "Camera"),
    gallery (icon: Icons.photo_library, text: "Gallery");

    final IconData icon;
    final String text;

    const ImageType({
        required this.icon,
        required this.text,
    });
}