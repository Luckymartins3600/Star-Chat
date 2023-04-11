import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

class DPDescription extends StatelessWidget {
  const DPDescription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Add a display photo',
        style: TextStyle(
          fontSize: size(context).width / 18,
          fontWeight: FontWeight.w500,
          letterSpacing: 1,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Text(
          'Give people idea of what your group is about with a photo.',
          style: TextStyle(
            color: Colors.grey,
            fontSize: size(context).width / 23,
          ),
        ),
      ),
    );
  }
}
