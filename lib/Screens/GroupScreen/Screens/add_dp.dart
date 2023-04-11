import 'dart:io';

import 'package:chat_app/Screens/GroupScreen/Widgets/CreateGr/create_btn.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/CreateGr/dp_ds.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/Utils/pick_img.dart';
import 'package:chat_app/widgets/appbar_underline.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class DPScreenGr extends StatefulWidget {
  final bool isDark;
  const DPScreenGr({Key key, @required this.isDark}) : super(key: key);

  @override
  State<DPScreenGr> createState() => _DPScreenGrState();
}

class _DPScreenGrState extends State<DPScreenGr> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  CroppedFile croppedFile;
  int currentIndex;
  bool fromDemo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: const BackButtonCB(),
        systemOverlayStyle: defaultTransparentAppBar(
            bottom: widget.isDark ? Colors.black : Colors.white),
        bottom: appBarUnderLine(context: context, isDark: widget.isDark),
        actions: [
          CupertinoButton(child: const Text('Skip'), onPressed: () => {})
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: size(context).width / 20),
          const DPDescription(),
          SizedBox(height: size(context).width / 13),
          Container(
            height: size(context).width / 1.6,
            width: size(context).width / 1.8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey),
              image: fromDemo
                  ? DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('asset/images/$currentIndex.jpg'),
                    )
                  : croppedFile == null
                      ? null
                      : DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(
                            File(croppedFile.path),
                          ),
                        ),
            ),
            child: IconButton(
              onPressed: () {
                imagePicker(
                  context: context,
                  key: scaffoldKey,
                  isDark: widget.isDark,
                  cam: () => callBack(1),
                  gal: () => callBack(2),
                );
              },
              icon: Icon(
                Icons.camera_alt_rounded,
                size: size(context).width / 7.6,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 4,
              padding: EdgeInsets.only(left: size(context).width / 25),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() => fromDemo = true);
                  setState(() => currentIndex = index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  height: size(context).width / 5.5,
                  width: size(context).width / 5.5,
                  margin: EdgeInsets.symmetric(
                      horizontal: size(context).width / 40),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: currentIndex == index
                          ? Styles.kPrimaryColor
                          : Colors.white,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('asset/images/$index.jpg'),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          CreateBtn(
            padding:
                EdgeInsets.symmetric(horizontal: size(context).width / 2.5),
            disabled: fromDemo ? !fromDemo : croppedFile == null,
            isDark: widget.isDark,
            text: 'Next',
            onPressed: fromDemo
                ? () {}
                : croppedFile == null
                    ? null
                    : () {},
          ),
        ],
      ),
    );
  }

  callBack(int i) async {
    await pickImage(i, context).then(
      (value) {
        if (value != null) {
          setState(() => croppedFile = value);
          setState(() => fromDemo = false);
        }
      },
    );
  }
}
