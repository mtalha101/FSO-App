import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fso/core/constants/colors.dart';
import 'package:fso/core/widgets/textfield.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final String hintText;
  final void Function(List<File>) onImagesSelected;
  const ImagePickerWidget({
    super.key,
    required this.hintText,
    required this.onImagesSelected,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  List<File> images = [];

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        images.add(File(pickedImage.path));
        widget.onImagesSelected(images);
      });
    }
  }

  void replaceImage(int index) async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        images[index] = File(pickedImage.path);
        widget.onImagesSelected(images);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return images.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: images.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final image = images[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: InkWell(
                      onTap: () => replaceImage(index),
                      borderRadius: BorderRadius.circular(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 72.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: Image.file(
                                  image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
                              child: Text(image.uri.path.split('/').last),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerRight,
                child: Material(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                  child: InkWell(
                    onTap: pickImage,
                    borderRadius: BorderRadius.circular(10.0),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                      child: Text(
                        '➕ Add More',
                        style: TextStyle(
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : InkWell(
            onTap: pickImage,
            borderRadius: BorderRadius.circular(10.0),
            child: IgnorePointer(
              child: FSOTextField(
                hintText: widget.hintText,
              ),
            ),
          );
  }
}
