// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:chat_app/Screens/Status/Pages/Post/Text/text.dart';
import 'package:chat_app/Screens/Status/Pages/Post/video/details.dart';
import 'package:chat_app/Screens/Status/Widget/dialog_title.dart';
import 'package:chat_app/Screens/Status/Widget/story_container.dart';
import 'package:chat_app/Screens/nav.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:chat_app/widgets/appbar_underline.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddStrory extends StatefulWidget {
  final bool isDark;
  final bool fromHome;
  const AddStrory({Key key, @required this.isDark, @required this.fromHome})
      : super(key: key);
  @override
  State<AddStrory> createState() => _AddStroryState();
}

class _AddStroryState extends State<AddStrory> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> pickedImages = [];
  cropImage(String path) async {
    CroppedFile cropedFile =
        await ImageCropper.platform.cropImage(sourcePath: path);
    if (cropedFile != null) {
      Navigate.forward(
          context: context, screen: PhotoDetails(path: cropedFile.path,isDark: widget.isDark,));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: BackButtonCB(
            onTap: !widget.fromHome
                ? () => Navigate.forward(
                    context: context, screen: const NavScreen())
                : null),
        centerTitle: true,
        systemOverlayStyle: defaultTransparentAppBar(
            bottom: widget.isDark ? Colors.black : Colors.white),
        title: const Text('Add Strory'),
        bottom: appBarUnderLine(context: context, isDark: widget.isDark),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: StoryContainer(
                onTap: () => Navigate.forward(
                  context: context,
                  screen: TextStatus(isDark: widget.isDark),
                ),
                index: 1,
              )),
              Expanded(
                  child: StoryContainer(
                index: 2,
                onTap: () => {},
              )),
              Expanded(
                  child: StoryContainer(index: 3, onTap: () => chooseLibrary()))
            ],
          ),
          Expanded(
            flex: 75,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: pickedImages.length,
              padding: EdgeInsets.symmetric(
                vertical: size(context).width / 20,
                horizontal: size(context).width / 40,
              ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: size(context).width / 2,
                childAspectRatio: 2 / 2.8,
                crossAxisSpacing: size(context).width / 35,
                mainAxisSpacing: size(context).width / 35,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: .3,
                      color: Colors.white,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(
                        File(pickedImages[index]),
                      ),
                    ),
                    borderRadius: BorderRadius.circular(
                      size(context).width / 30,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  pickImage(int index) async {
    Navigator.pop(context);
    XFile file;
    final ImagePicker picker = ImagePicker();
    file = await picker.pickImage(
      source: index == 1 ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 100,
    );
    if (file != null) {
      cropImage(file.path);
    }
  }

  chooseLibrary() {
    scaffoldKey.currentState.showBottomSheet(
      (context) {
        return SizedBox(
          height: size(context).width / (Platform.isAndroid ? 1.7 : 1.8),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.only(
                  top: size(context).width / 30,
                  left: size(context).width / 20,
                ),
                title: Stack(
                  children: [
                    Center(
                      child: Text(
                        'Options',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: size(context).width / 20,
                          letterSpacing: .5,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: size(context).width / 20),
                      child: const Align(
                        alignment: Alignment.topRight,
                        child: BackButtonCB(icon: Icons.close_rounded),
                      ),
                    ),
                  ],
                ),
              ),
              tile(1),
              tile(2),
            ],
          ),
        );
      },
      backgroundColor: widget.isDark ? Colors.white : const Color(0xD6F7F4F4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(size(context).width / 16),
          topRight: Radius.circular(size(context).width / 16),
        ),
      ),
    );
  }

  tile(int index) => DiscardTile(
        isDark: widget.isDark,
        title: index == 1 ? 'Camera' : 'Gallery',
        leadingIcon:
            index == 1 ? Icons.camera_alt : Icons.photo_library_rounded,
        onTap: () => index == 1 ? pickImage(1) : pickImage(2),
      );
}
