import 'dart:io';

import 'package:flutter/material.dart';

import '../models/ui/image_view.dart';

class ImageViewer extends StatelessWidget {
  final ImageView imageView;
  const ImageViewer({super.key, required this.imageView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: InteractiveViewer(
            clipBehavior: Clip.none,
            child: switch (imageView.type) {
              ImageType.asset => Image.asset(imageView.file, fit: BoxFit.cover),
              ImageType.network => Image.network(
                imageView.file,
                fit: BoxFit.cover,
              ),
              ImageType.file => Image.file(
                File(imageView.file),
                fit: BoxFit.cover,
              ),
            },
          ),
        ),
      ),
    );
  }
}
