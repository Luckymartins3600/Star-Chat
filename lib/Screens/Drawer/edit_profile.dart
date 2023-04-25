import 'dart:io';

import 'package:chat_app/Model/current_user.dart';
import 'package:chat_app/Utils/crop_image.dart';
import 'package:chat_app/Utils/status_view.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:chat_app/widgets/outlined_txtf.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:intl/intl.dart';
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
  TextEditingController dateController;
  TextEditingController bioController;
  DateTime selectedDate;
  CroppedFile pickedFile;
  bool saved = false;
  @override
  void initState() {
    super.initState();
    selectedDate = widget.userModel.birthday.toDate();
    dateController = TextEditingController(
        text: DateFormat('d -MMMM- y').format(selectedDate));
    emailController = TextEditingController(text: widget.userModel.email);
    bioController = TextEditingController(text: widget.userModel.bio);
    usernameController = TextEditingController(text: widget.userModel.username);
  }

  @override
  Widget build(BuildContext context) {
    final width = size(context).width;
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
                  onPressed: () => onSave(),
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

          Padding(
            padding: EdgeInsets.all(width / 30),
            child: Column(
              children: [
                OutlinedTxtField(
                  underlined: true,
                  maxLength: 20,
                  controller: usernameController,
                  darkMode: widget.isDark,
                  isUsername: true,
                  label: 'USERNAME',
                  onChanged: (p0) => setState(() {}),
                  contentPadding: EdgeInsets.only(bottom: width / 45),
                ),
                OutlinedTxtField(
                  underlined: true,
                  disabled: true,
                  controller: emailController,
                  darkMode: widget.isDark,
                  isUsername: false,
                  label: 'EMAIL ADDRESS',
                  contentPadding: EdgeInsets.only(bottom: width / 70),
                ),
                SizedBox(height: size(context).width / 70),
                OutlinedTxtField(
                  controller: bioController,
                  // underlined: true,
                  disabled: false,
                  maxline: 3,
                  maxLength: 106,
                  darkMode: widget.isDark,
                  borderRadius: BorderRadius.circular(5),
                  isUsername: false,
                  label: 'ABOUT ME',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: width / 25,
                    horizontal: width / 40,
                  ),
                ),
                SizedBox(height: size(context).width / 60),
                OutlinedTxtField(
                  controller: dateController,
                  disabled: true,
                  maxline: 3,
                  maxLength: 106,
                  darkMode: widget.isDark,
                  isUsername: false,
                  label: 'BIRTHDATE',
                  borderRadius: BorderRadius.circular(5),
                  style: const TextStyle(letterSpacing: 1.6),
                  suffixIcon: GestureDetector(
                    onTap: () => showDate(),
                    child: const Icon(Icons.calendar_today_rounded),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: width / 25, horizontal: width / 40),
                ),
              ],
            ),
          ),

          // SizedBox(height: size(context).width / 50),
        ],
      ),
    );
  }

  showDate() async {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      dateController = TextEditingController(
          text: DateFormat('d-MMMM-y').format(selectedDate));
      setState(() {});
    }
  }

  String img() =>
      pickedFile != null ? pickedFile.path : widget.userModel.profilepic;
  bool hasChanges() {
    if (saved) {
      return false;
    } else {
      if (usernameController.text.trim() != widget.userModel.username ||
          bioController.text.trim() != widget.userModel.bio ||
          pickedFile != null ||
          selectedDate != widget.userModel.birthday.toDate()) {
        return true;
      }
      return false;
    }
  }

  onSave() async {
    setState(() => saved = true);
    String img;
    if (pickedFile != null) {
      img =
          await getimageUrl(File(pickedFile.path), widget.userModel.uid, 'DP');
    }
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.userModel.uid)
        .update({
      'firstName': getFirstWords(usernameController.text.trim(), 1),
      'username': usernameController.text.trim(),
      'email': emailController.text.trim(),
      'birthday': selectedDate,
      'bio': bioController.text.trim(),
      'profilepic': pickedFile != null ? img : widget.userModel.profilepic
    }).then((value) => Navigator.pop(context));
  }

  String getFirstWords(String sentence, int wordCounts) {
    return sentence.split(" ").sublist(0, wordCounts).join(" ");
  }
}

Future<String> getimageUrl(File file, String id, String forwhat) async {
  try {
    var ref =
        FirebaseStorage.instance.ref().child('DP').child('${forwhat}_$id');
    await ref.putFile(file);
    String url = await ref.getDownloadURL();
    return url;
  } catch (e) {
    return null;
  }
}
