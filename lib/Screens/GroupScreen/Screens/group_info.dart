import 'package:chat_app/Model/Group_Chat/messages.dart';
import 'package:chat_app/Screens/GroupScreen/Screens/view_all_members.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/GroupDetails/buttons.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/GroupDetails/grid_files.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/GroupDetails/group_info.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/GroupDetails/user_profile.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/GroupDetails/user_tile.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:flutter/material.dart';

class GroupInfoScreen extends StatefulWidget {
  final bool isDark;
  final GroupInfo groupInfo;
  const GroupInfoScreen(
      {Key key, @required this.isDark, @required this.groupInfo})
      : super(key: key);

  @override
  State<GroupInfoScreen> createState() => _GroupInfoScreenState();
}

class _GroupInfoScreenState extends State<GroupInfoScreen> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonCB(),
      ),
      body: Column(
        children: [
          SizedBox(
            width: size(context).width,
            child: GroupDetais(
              groupInfo: widget.groupInfo,
              isDark: widget.isDark,
            ),
          ),
          Expanded(
            flex: 30,
            child: SizedBox(
              width: size(context).width,
              child: Column(
                children: [
                  TileButtons(
                    isDark: widget.isDark,
                    currentIndex: currentIndex,
                    first: () => onToggle(true),
                    second: () => onToggle(false),
                  ),
                  Expanded(
                    child: currentIndex == 1
                        ? ListView.builder(
                            itemCount: 8 + 1,
                            itemBuilder: (context, index) {
                              if (index == 8) {
                                return Column(
                                  children: [
                                    TextButton(
                                      onPressed: () => Navigate.forward(
                                          context: context,
                                          screen:
                                              GrMembers(isDark: widget.isDark)),
                                      child: const Text('View All'),
                                    ),
                                  ],
                                );
                              }
                              return UserGRDetails(
                                index: index,
                                onTap: () => Navigate.forward(
                                  context: context,
                                  screen: GrUserProfile(isDark: widget.isDark),
                                ),
                              );
                            },
                          )
                        : GridFiles(isDark: widget.isDark),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  onToggle(bool first) {
    if (first) {
      setState(() => currentIndex = 1);
    } else {
      setState(() => currentIndex = 2);
    }
  }
}
