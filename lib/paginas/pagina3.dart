//import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Picker extends StatefulWidget {
  const Picker({Key? key}) : super(key: key);

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  File? image;
  File? image2;

  Future pickImage(ImageSource imageType) async {
    try {
      final image = await ImagePicker().pickImage(source: imageType);
      if (image == null) return;
      final tempImage = File(image.path);
//      comprimir(image.path);
      setState(() {
        this.image = tempImage;
      });
      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: const Color(0xFF48426D),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 70,
          ),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF48426D), width: 2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: ClipOval(
                    child:
                        // ignore: unnecessary_null_comparison
                        image != null
                            ? Image.file(
                                image!,
                                width: 170,
                                height: 170,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                width: 200,
                                height: 200,
                                color: Colors.amberAccent,
                              ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 45,
                    height: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFF48426D),
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        imagePickerOption();
                      },
                      icon: const FaIcon(
                        Icons.camera_alt_outlined,
//                        Icons.add_a_photo_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 70,
              right: 70,
            ),
            child: image != null
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 7,
                      fixedSize: const Size(160, 45),
                      primary: const Color(0xFF48426D),
                      onSurface: Colors.black,
                    ),
                    onPressed: () async {
                      File compressedFile = await comprimir(image!.path);
                      setState(() {
                        image2 = compressedFile;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.camera,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'Upload Image',
                          style: GoogleFonts.montserratAlternates(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                : const Text(''),
          ),
          image2 != null
              ? Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Image.file(
                      image!,
                      width: 170,
                      height: 170,
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                )
              : Column(
                  children: const [
                    SizedBox(
                      height: 40,
                    ),
                    Text('Nenhuma Imagem')
                  ],
                )
        ],
      ),
    );
  }
}

comprimir(file) async {
//  ImageProperties properties =
  await FlutterNativeImage.getImageProperties(file);
  File compressedFile = await FlutterNativeImage.compressImage(file,
      quality: 80, targetWidth: 250, targetHeight: 400);
//  log(compressedFile.toString());
//  log(properties.width.toString());
//  log(properties.height.toString());
//  ImageProperties properties2 =
  await FlutterNativeImage.getImageProperties(compressedFile.path);
//  log(properties2.width.toString());
//  log(properties2.height.toString());
  return compressedFile;
}
