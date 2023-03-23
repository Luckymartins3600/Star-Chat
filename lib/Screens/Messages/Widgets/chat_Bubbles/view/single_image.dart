import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../Styles/style.dart';

class ViewSingleImage extends StatefulWidget {
  final bool isDarkMode;
  final String url;
  final String tag;
  const ViewSingleImage({Key key, this.isDarkMode, this.url, this.tag})
      : super(key: key);

  @override
  State<ViewSingleImage> createState() => _ViewSingleImageState();
}

class _ViewSingleImageState extends State<ViewSingleImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: kToolbarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 4),
              Text(
                'Lucky Flamze',
                style: TextStyle(
                  fontSize: Styles.meduimFontSize,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${DateFormat.yMMMd().format(DateTime.now())}  ${DateFormat.jm().format(DateTime.now())}",
                    style: TextStyle(
                      fontSize: Styles.smallFontSize,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            height: size(context).width / 2000,
            color: widget.isDarkMode ? Styles.subtitleTxt : Styles.black38,
          ),
        ),
      ),
      body: Hero(
        tag: widget.tag,
        child: PhotoView(
          loadingBuilder: (context, event) {
            return const Center(
              child: SpinKitFadingCircle(
                color: Styles.kPrimaryColor,
              ),
            );
          },
          customSize: Size(size(context).width, size(context).width * 2.14),
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          initialScale: PhotoViewComputedScale.covered * .9,
          minScale: PhotoViewComputedScale.contained * 1,
          maxScale: PhotoViewComputedScale.covered * 5,
          imageProvider: CachedNetworkImageProvider(widget.url),
        ),
      ),
    );
  }
}
