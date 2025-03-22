import 'package:jewellery/consts/color_consts.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class CommonImagePicker extends StatefulWidget {
  final double size; // Size of the circular container
  final Color borderColor; // Border color of the circular container
  final Color backgroundColor; // Background color of the circular container
  final Function(File)?
      onImageSelected; // Callback for when an image is selected

  const CommonImagePicker({
    super.key,
    this.size = 150.0,
    this.borderColor = Colors.blue,
    this.backgroundColor = Colors.grey,
    this.onImageSelected,
  });

  @override
  State<CommonImagePicker> createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      if (widget.onImageSelected != null) {
        widget.onImageSelected!(_image!);
      }
    }
  }

  Future<void> _takePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      if (widget.onImageSelected != null) {
        widget.onImageSelected!(_image!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 160,
      // color: AppColorConsts.blackColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Circular image with dotted border
          DottedBorder(
            borderType: BorderType.Circle,
            color: widget.borderColor,
            strokeWidth: 2,
            dashPattern: const [8, 5], 
            child: Container(
              width: widget.size,
              height: widget.size,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.backgroundColor,
              ),
              child: _image != null
                  ? ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      child: Image.file(
                        _image!,
                        fit: BoxFit.fill,
                        width: widget.size,
                        height: widget.size,
                      ),
                    )
                  : Icon(
                      Icons.image,
                      size: widget.size *
                          0.33, // Adjust icon size relative to the container
                      color: widget.borderColor,
                    ),
            ),
          ),
          // Camera icon overlay at the bottom
          Positioned(
            bottom: 5,
            child: GestureDetector(
              onTap:
                  _pickImage, // Change this to _takePhoto if you want the camera functionality
              child: const CircleAvatar(
                radius: 18,
                backgroundColor:
                    AppColorConsts.darkBlueColor, // You can change this color
                child: Icon(
                  Icons.camera_alt,
                  color: AppColorConsts.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
