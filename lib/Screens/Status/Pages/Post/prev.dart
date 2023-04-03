import 'package:chat_app/Screens/Status/Pages/add_strories.dart';
import 'package:chat_app/Screens/Status/Widget/dialog_title.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class PreviewSc extends StatefulWidget {
  final bool isDark;
  final Color color;
  final String msg;
  const PreviewSc(
      {Key key, @required this.color, @required this.msg, this.isDark})
      : super(key: key);

  @override
  State<PreviewSc> createState() => _PreviewScState();
}

class _PreviewScState extends State<PreviewSc> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool discard = false;
  onDiscard() {
    scaffoldKey.currentState.showBottomSheet(
      (context) {
        return SizedBox(
          height: size(context).width / 1.6,
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(size(context).width / 20),
                title: const Text('Discard Story?'),
                subtitle: const Text(
                    'You\'ll lose this story and any changes you\'ve made to it.'),
              ),
              discardTile(1),
              discardTile(2),
            ],
          ),
        );
      },
      backgroundColor: widget.isDark ? Colors.white : const Color(0xD6F7F4F4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(size(context).width / 16),
          topRight: Radius.circular(size(context).width / 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (discard) Navigator.pop(context);
    return WillPopScope(
      onWillPop: () async {
        await onDiscard();
        return false;
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: widget.color,
        appBar: AppBar(
          foregroundColor: Colors.white,
          leading: BackButtonCB(
            icon: Icons.close_rounded,
            onTap: () => onDiscard(),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: size(context).width / 18,
                  right: size(context).width / 18,
                  bottom: size(context).width / 3,
                ),
                child: Linkify(
                  text: widget.msg,
                  onOpen: (link) async {
                    if (await canLaunchUrl(
                      Uri.parse(link.url),
                    )) {
                      await launchUrl(Uri.parse(link.url));
                    } else {
                      return null;
                    }
                  },
                  linkifiers: const [UrlLinkifier()],
                  textAlign: TextAlign.center,
                  linkStyle: const TextStyle(color: Styles.kPrimaryColor),
                  style: TextStyle(
                    fontSize: size(context).width / 19,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: size(context).width / 9,
                horizontal: size(context).width / 30,
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CupertinoButton(
                  pressedOpacity: .7,
                  color: Styles.kPrimaryColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: size(context).width / 14),
                  onPressed: () {},
                  child: const Text(
                    'Share',
                    style: TextStyle(letterSpacing: .1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  discardTile(int index) => DiscardTile(
        isDark: widget.isDark,
        title: index == 1 ? 'Keep editing' : 'Discard Story',
        leadingIcon: index == 1 ? Icons.edit : Icons.delete,
        onTap: () => index == 1
            ? Navigator.pop(context)
            : Navigate.forward(
                context: context,
                removeprevious: true,
                screen: AddStrory(fromHome: false, isDark: widget.isDark),
              ),
      );
}
