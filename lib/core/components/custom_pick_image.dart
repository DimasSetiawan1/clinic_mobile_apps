import 'dart:io';
import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomPickImage extends StatefulWidget {
  final void Function(XFile? file) onChanged;
  const CustomPickImage({super.key, required this.onChanged});

  @override
  State<CustomPickImage> createState() => _CustomPickImageState();
}

class _CustomPickImageState extends State<CustomPickImage> {
  XFile? _imageFile;
  String? _selectedImagePath;
  Future<void> _pickedImage() async {
    final ImagePicker picker = ImagePicker();

    final image = await picker.pickImage(
      source: ImageSource.gallery,
      preferredCameraDevice: CameraDevice.front,
    );

    if (image == null) {
      widget.onChanged(null);
    }

    setState(() {
      _imageFile = image;
      _selectedImagePath = image?.path;
      widget.onChanged(_imageFile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _pickedImage,
          child: Center(
            child: Container(
              width: context.deviceWidth,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: _selectedImagePath != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        File(_selectedImagePath!),
                        fit: BoxFit.cover,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload, size: 50, color: Colors.grey),
                        SizedBox(height: 10),
                        Text('Drag and drop or tap to select image',
                            textAlign: TextAlign.center, style: TextStyle()),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
