import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Model/Status/status.dart';
import 'package:chat_app/Screens/GroupScreen/Screens/add_dp.dart';
import 'package:chat_app/Screens/Messages/Widgets/search_bar.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/Utils/trim_text.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:chat_app/widgets/appbar_underline.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMembersGr extends StatefulWidget {
  final bool isDark;
  const AddMembersGr({Key key, @required this.isDark}) : super(key: key);

  @override
  State<AddMembersGr> createState() => _AddMembersGrState();
}

class _AddMembersGrState extends State<AddMembersGr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonCB(),
        systemOverlayStyle: defaultTransparentAppBar(
            bottom: widget.isDark ? Colors.black : Colors.white),
        title: const Text('Invite members'),
        bottom: appBarUnderLine(context: context, isDark: widget.isDark),
        actions: [
          CupertinoButton(
              child: const Text('Next'),
              onPressed: () => Navigate.forward(
                  screen: DPScreenGr(isDark: widget.isDark), context: context)),
        ],
      ),
      body: Column(
        children: [
          SearchWidget(isDarkMode: widget.isDark),
          Expanded(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: size(context).width / 60),
            itemCount: status.length,
            itemBuilder: (context, index) {
              StatusModel model = StatusModel.fromMap(status[index].toMap());
              return ListTile(
                trailing: CupertinoButton.filled(
                  padding: EdgeInsets.symmetric(
                      horizontal: size(context).width / 14),
                  child: const Text(
                    'Invite',
                    style: TextStyle(letterSpacing: .5),
                  ),
                  onPressed: () {},
                ),
                contentPadding: EdgeInsets.only(top: size(context).width / 20),
                title: Text(textLimit(text: model.userModel.username, max: 18)),
                leading: CircleAvatar(
                  radius: size(context).width / 15,
                  backgroundImage:
                      CachedNetworkImageProvider(model.userModel.profilepic),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
