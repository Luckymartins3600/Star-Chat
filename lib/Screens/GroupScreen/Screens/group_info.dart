import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Model/Group_Chat/messages.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/GroupDetails/buttons.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/GroupDetails/group_info.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
                    child: ListView.builder(
                      itemCount: 8 + 1,
                      itemBuilder: (context, index) {
                        if (index == 8) {
                          return Column(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('View All'),
                              ),
                            ],
                          );
                        }
                        return ListTile(
                          leading: CircleAvatar(
                            radius: size(context).width / 17,
                            backgroundImage: CachedNetworkImageProvider(
                              faker.image.image(
                                  keywords: ['person', 'headshot'],
                                  random: true),
                            ),
                          ),
                          title: Text(
                            '${faker.address.person.firstName()} ${faker.address.person.lastName()}',
                          ),
                          subtitle: index < 5
                              ? Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Icon(
                                        MdiIcons.shieldStar,
                                        size: size(context).width / 25,
                                        color: Styles.kPrimaryColor,
                                      ),
                                    ),
                                    Text(
                                      'Admin',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade400,
                                      ),
                                    )
                                  ],
                                )
                              : Text(
                                  faker.vehicle.make(),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                        );
                      },
                    ),
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
