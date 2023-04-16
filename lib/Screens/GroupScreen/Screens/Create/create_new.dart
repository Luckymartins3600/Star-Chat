import 'package:chat_app/Model/Group_Chat/messages.dart';
import 'package:chat_app/Screens/GroupScreen/Screens/Create/invite_members.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/CreateGr/create_btn.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/CreateGr/privacy_btsheet.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/CreateGr/privacy_dialog.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/error_widget.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:chat_app/widgets/appbar_underline.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:chat_app/widgets/outlined_txtf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateGroup extends StatefulWidget {
  final bool isDark;
  const CreateGroup({Key key, @required this.isDark}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  TextEditingController controller = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GroupInfo groupInfo;
  int index;
  bool errorName = false;
  bool errorprivacy = false, created = false;
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: const BackButtonCB(),
        centerTitle: true,
        systemOverlayStyle: defaultTransparentAppBar(
            bottom: widget.isDark ? Colors.black : Colors.white),
        title: const Text('Create Group'),
        bottom: appBarUnderLine(context: context, isDark: widget.isDark),
      ),
      body: Padding(
        padding: EdgeInsets.all(size(context).width / 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title('Name'),
            OutlinedTxtField(
              focusNode: focusNode,
              controller: controller,
              darkMode: widget.isDark,
              label: 'Name your group',
              margin: EdgeInsets.only(
                top: size(context).width / 35,
                bottom: size(context).width / 40,
              ),
              maxLength: 30,
              onChanged: (p0) => setState(() => disabled()),
            ),
            errorName ? const ErrorMSG(index: 1) : const SizedBox(),
            SizedBox(height: size(context).width / 33),
            title('Privacy'),
            GestureDetector(
              onTap: () => showDialog(),
              child: PrivacyWidget(
                index: index,
                isDark: widget.isDark,
              ),
            ),
            SizedBox(height: size(context).width / 45),
            errorprivacy ? const ErrorMSG(index: 2) : const SizedBox(),
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (controller.text.trim().length < 5) {
                  setState(() => errorName = true);
                }
                if (index == null) {
                  setState(() => errorprivacy = true);
                }
              },
              child: CreateBtn(
                padding: created
                    ? EdgeInsets.symmetric(
                        horizontal: size(context).width / 2.8)
                    : null,
                text: created ? 'Next' : 'Create group',
                disabled: disabled(),
                isDark: widget.isDark,
                onPressed: disabled()
                    ? null
                    : () async {
                        groupInfo = await Navigate.forward(
                          screen: AddMembersGr(
                            isDark: widget.isDark,
                            groupInfo: groupInfo ??
                                GroupInfo(
                                  name: controller.text.trim(),
                                  bio: null,
                                  profileUrl: null,
                                  public: index == 1,
                                ),
                          ),
                          context: context,
                        );
                        setState(() => created = true);
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool disabled() {
    if (controller.text.trim().length > 5) {
      setState(() => errorName = false);
    }
    if (index != null) {
      setState(() => errorprivacy = false);
    }
    if (controller.text.trim().length < 5 || index == null) {
      return true;
    } else {
      return false;
    }
  }

  Padding title(String text) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size(context).width / 18,
          letterSpacing: .7,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  showDialog() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    Future.delayed(Duration(milliseconds: focusNode.hasFocus ? 800 : 10), () {
      focusNode.hasFocus
          ? FocusScope.of(context).requestFocus(FocusNode())
          : null;
      privacySheet(
          key: scaffoldKey,
          context: context,
          isDark: widget.isDark,
          index: index,
          onTap: () {
            setState(() => index = 1);
            disabled();
            Navigator.pop(context);
          },
          onTap2: () {
            setState(() => index = 2);
            disabled();
            Navigator.pop(context);
          });
    });
  }
}
