import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:chat_app/Screens/Messages/Widgets/chat_Bubbles/view/single_image.dart';

import '../../../../../Styles/style.dart';
import '../../../../../Utils/const.dart';
import '../../../../../func/navigate.dart';

class ViewMultipleImage extends StatefulWidget {
  final bool isDarkMode;
  final List<String> images;
  const ViewMultipleImage(
      {Key key, @required this.isDarkMode, @required this.images})
      : super(key: key);

  @override
  State<ViewMultipleImage> createState() => _ViewMultipleImageState();
}

class _ViewMultipleImageState extends State<ViewMultipleImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: kToolbarHeight,
          child: Column(
            children: [
              const Spacer(flex: 4),
              Text(
                'Lucky Flamze',
                style: TextStyle(
                  fontSize: Styles.meduimFontSize,
                ),
              ),
              const Spacer(),
              Text(
                '${widget.images.length} Photos',
                style: TextStyle(fontSize: Styles.smallFontSize),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: widget.isDarkMode ? Styles.subtitleTxt : Styles.black38,
            height: size(context).width / 2000,
          ),
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigate.forward(
              context: context,
              screen: ViewSingleImage(
                isDarkMode: widget.isDarkMode,
                url: widget.images[index],
              ),
              type: PageTransitionType.fade,
            ),
            child: Hero(
              tag: 'Random$index',
              transitionOnUserGestures: true,
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: Styles.smallFontSize - 7,
                ),
                height: size(context).width * 1.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(widget.images[index]),
                  ),
                ),
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DefaultTextStyle(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        child: Text(
                          DateFormat.jm().format(DateTime.now()),
                        ),
                      ),
                      SizedBox(width: Styles.smallFontSize - 5),
                      Icon(
                        MdiIcons.checkAll,
                        size: Styles.meduimFontSize + 2,
                        color: Styles.kPrimaryColor,
                        // color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
