import 'package:chat_app/Model/current_user.dart';
import 'package:chat_app/Utils/crop_image.dart';
import 'package:chat_app/Utils/status_view.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:chat_app/widgets/outlined_txtf.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:whatsapp_camera/camera/camera_whatsapp.dart';
import '../../Styles/style.dart';

class EditProfile extends StatefulWidget {
  final bool isDark;
  final CurrentUserModel userModel;
  const EditProfile({Key key, this.isDark, this.userModel}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController emailController;
  TextEditingController usernameController;

  CroppedFile pickedFile;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: widget.userModel.email);
    usernameController = TextEditingController(text: widget.userModel.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonCB(),
        centerTitle: true,
        title: const Text('Edit Profile'),
        elevation: .4,
        shadowColor: Styles.white,
        actions: [
          hasChanges()
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check,
                    color: Styles.kPrimaryColor,
                  ),
                )
              : const SizedBox(),
          SizedBox(width: size(context).width / 35)
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: size(context).width / 20),
        children: [
          SizedBox(height: size(context).width / 17),
          StatusRadius2(
            fromFile: pickedFile != null,
            centerImageUrl: img(),
            unSeenColor: Styles.kPrimaryColor,
            radius: size(context).width / 5,
            padding: 7,
            numberOfStatus: 14,
            child: GestureDetector(
              onTap: () async {
                var value = await Navigate.forward(
                  screen: const WhatsappCamera(multiple: false),
                  context: context,
                );
                pickedFile = await cropImage(value[0].path);
                setState(() {});
              },
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.all(size(context).width / 40),
                  decoration: BoxDecoration(
                    color: Styles.kPrimaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                    size: size(context).width / 17,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: size(context).width / 13),
          Center(
            child: Text(
              'Share a Little bit about yourself',
              style: TextStyle(
                  fontSize: size(context).width / 27,
                  color: Colors.grey.shade500),
            ),
          ),
          SizedBox(height: size(context).width / 30),
          OutlinedTxtField(
            maxLength: 20,
            controller: usernameController,
            darkMode: widget.isDark,
            isUsername: true,
            label: 'Username',
            onChanged: (p0) => setState(() {}),
          ),
          OutlinedTxtField(
            disabled: true,
            controller: emailController,
            darkMode: widget.isDark,
            isUsername: false,
            label: 'Email Address',
          ),
          SizedBox(height: size(context).width / 50),
        ],
      ),
    );
  }

  String img() =>
      pickedFile != null ? pickedFile.path : widget.userModel.profilepic;
  bool hasChanges() {
    if (usernameController.text.trim() != widget.userModel.username) {
      return true;
    }
    if (pickedFile != null) {
      return true;
    }
    return false;
  }
}
