import 'package:chat_app/Model/Status/status.dart';
import 'package:chat_app/Screens/Status/Pages/add_strories.dart';
import 'package:chat_app/Screens/Status/Pages/preview.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../../../Styles/style.dart';
import '../../../Utils/const.dart';
import '../../../Utils/status_view.dart';

class StatusWidget extends StatelessWidget {
  final bool isFirst, darkMode;
  final List<StatusModel> status;
  final int index;
  const StatusWidget({
    Key key,
    @required this.isFirst,
    @required this.darkMode,
    @required this.status,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StoriesModel storiesModel =
        StoriesModel.fromMap(status[index].stories[0].toMap());
    return GestureDetector(
      onTap: () => Navigate.forward(
        context: context,
        screen: isFirst
            ? AddStrory(isDark: darkMode, fromHome: true)
            : PreviewStatus(status: status, index: index),
        type: PageTransitionType.bottomToTop,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size(context).width / 45),
        child: StatusRadius(
          storiesModel: storiesModel,
          index: index,
          radius:
              isFirst ? size(context).width / 13.6 : size(context).width / 13.4,
          spacing: 15,
          strokeWidth: 1.6,
          indexOfSeenStatus: 5,
          numberOfStatus: isFirst ? 20 : status[index].stories.length,
          padding: 3,
          child: isFirst
              ? Icon(
                  Icons.add,
                  color: darkMode ? Styles.white : const Color(0x80000000),
                )
              : null,
        ),
      ),
    );
  }
}
