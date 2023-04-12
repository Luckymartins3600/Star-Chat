import 'package:chat_app/Screens/GroupScreen/Widgets/GroupDetails/user_profile.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/GroupDetails/user_tile.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class GrMembers extends StatefulWidget {
  final bool isDark;
  const GrMembers({Key key, @required this.isDark}) : super(key: key);

  @override
  State<GrMembers> createState() => _GrMembersState();
}

class _GrMembersState extends State<GrMembers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonCB(),
        centerTitle: true,
        title: const Text('Members'),
        actions: [
          Icon(OMIcons.groupAdd, size: size(context).width / 16),
          SizedBox(width: size(context).width / 20),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size(context).width / 20,
                vertical: size(context).width / 30,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: ' Search for members',
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: size(context).width / 30),
                    child: Icon(
                      CupertinoIcons.search,
                      color: Colors.grey,
                      size: size(context).width / 16,
                    ),
                  ),
                  enabledBorder: outlineBorder(null),
                  border: outlineBorder(null),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: size(context).width / 24),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 81,
              itemBuilder: (context, index) {
                return UserGRDetails(
                  index: index,
                  onTap: () => Navigate.forward(
                    context: context,
                    screen: GrUserProfile(isDark: widget.isDark),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder outlineBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(size(context).width / 10),
      borderSide: BorderSide(
        width: 1.2,
        color: color ?? Colors.grey.shade600.withOpacity(.5),
      ),
    );
  }
}
