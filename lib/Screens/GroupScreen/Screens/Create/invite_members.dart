import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Model/Group_Chat/messages.dart';
import 'package:chat_app/Model/Status/status.dart';
import 'package:chat_app/Screens/GroupScreen/Screens/Create/add_dp.dart';
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
  final GroupInfo groupInfo;
  const AddMembersGr({Key key, @required this.isDark, this.groupInfo})
      : super(key: key);

  @override
  State<AddMembersGr> createState() => _AddMembersGrState();
}

class _AddMembersGrState extends State<AddMembersGr> {
  GroupInfo groupInfo;
  @override
  void initState() {
    groupInfo = widget.groupInfo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await onBack(),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButtonCB(onTap: () async => await onBack()),
          systemOverlayStyle: defaultTransparentAppBar(
              bottom: widget.isDark ? Colors.black : Colors.white),
          title: const Text('Invite members'),
          bottom: appBarUnderLine(context: context, isDark: widget.isDark),
          actions: [
            CupertinoButton(
              child: const Text('Next'),
              onPressed: () async {
                groupInfo = await Navigate.forward(
                    screen: DPScreenGr(
                      isDark: widget.isDark,
                      groupInfo: groupInfo,
                    ),
                    context: context);

                setState(() {});
              },
            ),
          ],
        ),
        body: Column(
          children: [
            SearchWidget(isDarkMode: widget.isDark),
            Expanded(
                child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding:
                  EdgeInsets.symmetric(horizontal: size(context).width / 60),
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
                  contentPadding:
                      EdgeInsets.only(top: size(context).width / 20),
                  title:
                      Text(textLimit(text: model.userModel.username, max: 18)),
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
      ),
    );
  }

  onBack() {
    Navigator.pop(
      context,
      GroupInfo(
        name: groupInfo.name,
        bio: groupInfo.bio,
        profileUrl: groupInfo.profileUrl,
        public: groupInfo.public,
        pathfromfile: groupInfo.pathfromfile,
      ),
    );
  }
}
