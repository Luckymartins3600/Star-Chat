import 'package:chat_app/Model/Group_Chat/messages.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/CreateGr/create_btn.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/CreateGr/dp_ds.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/widgets/appbar_underline.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:chat_app/widgets/outlined_txtf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GrDescription extends StatefulWidget {
  final bool isDark;
  final GroupInfo groupInfo;

  const GrDescription(
      {Key key, @required this.isDark, @required this.groupInfo})
      : super(key: key);

  @override
  State<GrDescription> createState() => _GrDescriptionState();
}

class _GrDescriptionState extends State<GrDescription> {
  TextEditingController controller = TextEditingController();
  onBack() {
    Navigator.pop(
      context,
      GroupInfo(
        name: widget.groupInfo.name,
        bio: controller.text.trim(),
        profileUrl: widget.groupInfo.profileUrl,
        public: widget.groupInfo.public,
        pathfromfile: widget.groupInfo.pathfromfile,
      ),
    );
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() async {
    if (widget.groupInfo.bio != null) {
      setState(() => controller.text = widget.groupInfo.bio);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await onBack(),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButtonCB(
            onTap: () async {
              FocusManager.instance.primaryFocus.unfocus();
              Future.delayed(
                const Duration(milliseconds: 120),
                () async => await onBack(),
              );
            },
          ),
          systemOverlayStyle: defaultTransparentAppBar(
              bottom: widget.isDark ? Colors.black : Colors.white),
          bottom: appBarUnderLine(context: context, isDark: widget.isDark),
          actions: [
            CupertinoButton(child: const Text('Skip'), onPressed: () => {})
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size(context).width / 18),
              const DPDescription(
                tittle: 'Add a description',
                description:
                    'Describe your group so people know what it\'s all about.',
              ),
              Padding(
                padding: EdgeInsets.all(size(context).width / 28),
                child: OutlinedTxtField(
                  controller: controller,
                  darkMode: widget.isDark,
                  maxLength: 140,
                  maxline: 4,
                  label: 'About your group',
                  onChanged: (p0) => setState(() => disabled()),
                ),
              ),
              SizedBox(height: size(context).width / 10),
              CreateBtn(
                padding:
                    EdgeInsets.symmetric(horizontal: size(context).width / 2.7),
                disabled: disabled(),
                isDark: widget.isDark,
                text: 'Done',
                onPressed: disabled()
                    ? null
                    : () {
                        widget.groupInfo.bio = controller.text.trim();
                        print(widget.groupInfo.toMap());
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool disabled() {
    if (controller.text.trim().isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
