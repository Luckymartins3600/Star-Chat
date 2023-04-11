import 'package:chat_app/Screens/Status/Widget/dialog_title.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

privacySheet({
  @required GlobalKey<ScaffoldState> key,
  @required BuildContext context,
  @required bool isDark,
  int index,
  void Function() onTap,
  void Function() onTap2,
}) {
  key.currentState.showBottomSheet(
    (context) {
      return SizedBox(
        height: size(context).width / 1.6,
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(size(context).width / 20),
              title: const Text('Choose Privacy'),
              subtitle: Text(
                'You\'ll lose this story and any changes you\'ve made to it.',
                style: TextStyle(fontSize: size(context).width / 25),
              ),
            ),
            DiscardTile(
                trailing: index == 1
                    ? CircleAvatar(
                        radius: size(context).width / 30,
                        child: Icon(
                          Icons.check,
                          size: size(context).width / 25,
                        ))
                    : const SizedBox(),
                isDark: isDark,
                title: 'Public',
                leadingIcon: Icons.public,
                onTap: onTap),
            DiscardTile(
                trailing: index == 2
                    ? CircleAvatar(
                        radius: size(context).width / 30,
                        child: Icon(
                          Icons.check,
                          size: size(context).width / 25,
                        ))
                    : const SizedBox(),
                isDark: isDark,
                title: 'Private',
                leadingIcon: Icons.privacy_tip_rounded,
                onTap: onTap2)
          ],
        ),
      );
    },
    backgroundColor: isDark ? Colors.white : null,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(size(context).width / 16),
        topRight: Radius.circular(size(context).width / 16),
      ),
    ),
  );
}
