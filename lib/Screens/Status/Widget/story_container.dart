import 'package:chat_app/Styles/gradient_colors.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';

class StoryContainer extends StatelessWidget {
  final void Function() onTap;
  const StoryContainer({
    Key key,
    @required this.index,
    this.onTap,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(size(context).width / 20),
        height: size(context).width / 2.2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: addStoryColors[index - 1],
            transform: const GradientRotation(26),
          ),
          borderRadius: BorderRadius.circular(size(context).width / 40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: size(context).width / 13,
              child: Icon(
                icons[index - 1],
                size: size(context).width / 12,
              ),
            ),
            SizedBox(height: size(context).width / 40),
            Text(
              titles[index - 1],
              style: TextStyle(
                  color: Colors.white, fontSize: size(context).width / 23),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> titles = ['Text', 'Music', 'Photo'];
List<IconData> icons = [
  Icons.abc_rounded,
  Icons.music_note_rounded,
  Icons.photo
];
