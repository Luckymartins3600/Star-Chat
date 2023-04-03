import 'package:flutter/material.dart';

class DiscardTile extends StatelessWidget {
  const DiscardTile({
    Key key,
    @required this.isDark,
    @required this.title,
    @required this.onTap,
    @required this.leadingIcon,
  }) : super(key: key);

  final bool isDark;
  final String title;
  final IconData leadingIcon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        foregroundColor: Colors.white,
        child: Icon(leadingIcon),
      ),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      onTap: onTap,
    );
  }
}
