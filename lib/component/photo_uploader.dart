import 'dart:convert';
import 'dart:io';

import 'package:biyer_juti/theme/border_radius.dart';
import 'package:biyer_juti/theme/padding.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

import '../theme/colors.dart';
import '../util/page_navigation.dart';

class PhotoUploader {
  static Future popup({required BuildContext context, required VoidCallback onCamera, required VoidCallback onGallery}) async {
    return await showModalBottomSheet(
        context: context,
        builder: (context) => Material(
            child: Padding(
                padding: ThemePadding.py4,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  ListTile(
                      leading: Padding(padding: ThemePadding.px4, child: Icon(Icons.camera_alt_outlined, color: ThemeColor.primary)),
                      title: const Text("Take photo from Camera"),
                      onTap: () {
                        if (kDebugMode) print("Camera Selected");
                        routeBack(context);
                        onCamera.call();
                      },
                      visualDensity: VisualDensity.compact),
                  ListTile(
                      leading: Padding(padding: ThemePadding.px4, child: Icon(Icons.image_outlined, color: ThemeColor.primary)),
                      title: const Text("Upload photo from Gallery"),
                      onTap: () {
                        if (kDebugMode) print("Gallery Selected");
                        routeBack(context);
                        onGallery.call();
                      },
                      visualDensity: VisualDensity.compact)
                ]))));
  }

  static Future<File> getImageFile({bool fromCamera = false, Size resize = const Size(1200, 1200)}) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = fromCamera ? await picker.pickImage(source: ImageSource.camera) : await picker.pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    return file;
  }

  static Future<String> getImageBase64({bool fromCamera = false, Size resize = const Size(1200, 1200)}) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = fromCamera ? await picker.pickImage(source: ImageSource.camera) : await picker.pickImage(source: ImageSource.gallery);
    File image0 = File(image!.path);
    var result = await FlutterImageCompress.compressWithFile(image0.absolute.path, minWidth: resize.width.toInt(), minHeight: resize.height.toInt());
    String base64img = base64Encode(List<int>.from(result!));
    return base64img;
  }

  static Stack file({required VoidCallback onTap, VoidCallback? onDelete, XFile? imageFile, String? existingImageUrl, double size = 100}) =>
      Stack(fit: StackFit.loose, alignment: Alignment.bottomRight, children: [
        Padding(
            padding: const EdgeInsets.all(8.0).copyWith(top: 0),
            child: Material(
                color: ThemeColor.light,
                borderRadius: ThemeBorderRadius.r4,
                child: InkWell(
                    onTap: imageFile == null ? onTap : onDelete,
                    borderRadius: ThemeBorderRadius.r4,
                    child: AnimatedContainer(
                        width: size,
                        height: size,
                        duration: const Duration(milliseconds: 500),
                        padding: (imageFile == null) ? ThemePadding.p3 : EdgeInsets.zero,
                        decoration: BoxDecoration(borderRadius: ThemeBorderRadius.r4),
                        child: (imageFile == null)
                            ? DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(ThemeBorderRadius.value * 2),
                                dashPattern: const [3, 6],
                                color: ThemeColor.grey,
                                strokeWidth: 1,
                                child: Container(height: size * .8, width: size * .8, alignment: Alignment.center, child: Icon(FeatherIcons.camera, color: ThemeColor.grey, size: 32)))
                            : Container(
                                decoration: BoxDecoration(borderRadius: ThemeBorderRadius.r4),
                                child: ClipRRect(borderRadius: ThemeBorderRadius.r4, child: Image.file(File(imageFile.path), fit: BoxFit.cover))))))),
        CircleAvatar(radius: 16, backgroundColor: ThemeColor.primary, child: Icon(imageFile == null ? FeatherIcons.upload : FeatherIcons.trash2, size: 14, color: Colors.white))
      ]);

  static Stack base64({required VoidCallback onTap, VoidCallback? onDelete, String? base64img, double size = 100}) => Stack(fit: StackFit.loose, alignment: Alignment.bottomRight, children: [
        Padding(
            padding: const EdgeInsets.all(8.0).copyWith(top: 0),
            child: Material(
                color: ThemeColor.light,
                borderRadius: ThemeBorderRadius.r4,
                child: InkWell(
                    onTap: base64img == null ? onTap : onDelete,
                    borderRadius: ThemeBorderRadius.r4,
                    child: AnimatedContainer(
                        width: size,
                        height: size,
                        duration: const Duration(milliseconds: 500),
                        padding: (base64img == null) ? ThemePadding.p3 : EdgeInsets.zero,
                        decoration: BoxDecoration(borderRadius: ThemeBorderRadius.r4),
                        child: (base64img == null)
                            ? DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(ThemeBorderRadius.value * 2),
                                dashPattern: const [3, 6],
                                color: ThemeColor.grey,
                                strokeWidth: 1,
                                child: Container(height: size * .8, width: size * .8, alignment: Alignment.center, child: Icon(FeatherIcons.camera, color: ThemeColor.grey, size: 32)))
                            : Container(
                                decoration: BoxDecoration(borderRadius: ThemeBorderRadius.r4),
                                child: ClipRRect(borderRadius: ThemeBorderRadius.r4, child: Image.memory(base64Decode(base64img), fit: BoxFit.cover))))))),
        CircleAvatar(radius: 16, backgroundColor: ThemeColor.primary, child: Icon(base64img == null ? FeatherIcons.upload : FeatherIcons.trash2, size: 14, color: Colors.white))
      ]);
}
