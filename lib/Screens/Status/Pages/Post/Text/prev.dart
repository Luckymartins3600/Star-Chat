import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/func/discard_dialog.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class PreviewSc extends StatefulWidget {
  final bool isDark;
  final Color bgcolor;
  final String msg;
  final TextStyle style;
  final TextAlign textAlign;
  const PreviewSc({
    Key key,
    @required this.bgcolor,
    @required this.style,
    @required this.msg,
    @required this.textAlign,
    this.isDark,
  }) : super(key: key);

  @override
  State<PreviewSc> createState() => _PreviewScState();
}

class _PreviewScState extends State<PreviewSc> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print(widget.textAlign);

    return WillPopScope(
      onWillPop: () async {
        await onDiscard(scaffoldKey, context, widget.isDark);
        return false;
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: widget.bgcolor,
        appBar: AppBar(
          foregroundColor: Colors.white,
          leading: BackButtonCB(
            icon: Icons.close_rounded,
            onTap: () => onDiscard(scaffoldKey, context, widget.isDark),
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
                  textAlign: widget.textAlign,
                  linkStyle: const TextStyle(color: Styles.kPrimaryColor),
                  style: widget.style,
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
}
