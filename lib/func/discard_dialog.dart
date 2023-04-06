import 'package:chat_app/Screens/Status/Pages/add_strories.dart';
import 'package:chat_app/Screens/Status/Widget/dialog_title.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:flutter/material.dart';

onDiscard(
    GlobalKey<ScaffoldState> scaffoldKey, BuildContext context, bool isDark) {
  scaffoldKey.currentState.showBottomSheet(
    (context) {
      return SizedBox(
        height: size(context).width / 1.6,
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(size(context).width / 20),
              title: const Text('Discard Story?'),
              subtitle: Text(
                'You\'ll lose this story and any changes you\'ve made to it.',
                style: TextStyle(fontSize: size(context).width / 25),
              ),
            ),
            DiscardTile(
                isDark: isDark,
                title: 'Keep editing',
                leadingIcon: Icons.edit,
                onTap: () => Navigator.pop(context)),
            DiscardTile(
              isDark: isDark,
              title: 'Discard Story',
              leadingIcon: Icons.delete,
              onTap: () => Navigate.forward(
                context: context,
                removeprevious: true,
                screen: AddStrory(fromHome: false, isDark: isDark),
              ),
            ),
          ],
        ),
      );
    },
    backgroundColor: isDark ? Colors.white : const Color(0xD6F7F4F4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(size(context).width / 16),
        topRight: Radius.circular(size(context).width / 16),
      ),
    ),
  );
}
