import 'package:chat_app/Screens/Status/Pages/Post/text.dart';
import 'package:chat_app/Screens/Status/Widget/story_container.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:chat_app/widgets/appbar_underline.dart';
import 'package:flutter/material.dart';

class AddStrory extends StatefulWidget {
  final bool isDark;

  const AddStrory({Key key, @required this.isDark}) : super(key: key);

  @override
  State<AddStrory> createState() => _AddStroryState();
}

class _AddStroryState extends State<AddStrory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Strory'),
        bottom: appBarUnderLine(context: context, isDark: widget.isDark),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: StoryContainer(
                onTap: () => Navigate.forward(
                  context: context,
                  screen: TextStatus(isDark: widget.isDark),
                ),
                index: 1,
              )),
              const Expanded(child: StoryContainer(index: 2)),
              const Expanded(child: StoryContainer(index: 3)),
            ],
          ),
        ],
      ),
    );
  }
}
