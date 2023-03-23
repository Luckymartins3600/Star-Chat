import 'dart:io';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:chat_app/Utils/const.dart';

import '../../../Styles/style.dart';
import '../../../Utils/url_file.dart';

class ViewImage extends StatefulWidget {
  final int index;
  final List<String> images;
  const ViewImage({Key key, @required this.index, @required this.images})
      : super(key: key);

  @override
  State<ViewImage> createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  PageController pageController;

  int currentindex;
  @override
  void initState() {
    currentindex = widget.index;
    pageController = PageController(initialPage: currentindex);
    super.initState();
  }

  scanfile() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Styles.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size(context).width / 30)),
      builder: (context) {
        return SizedBox(
          height: size(context).width / 1.3,
          child: Center(
            child: QrImage(
              data: widget.images[currentindex],
              version: QrVersions.auto,
              size: size(context).width / 2,
              foregroundColor: Styles.black,
              embeddedImage: const AssetImage('asset/icon/logo.png'),
              eyeStyle: const QrEyeStyle(
                  color: Styles.red, eyeShape: QrEyeShape.circle),
            ),
          ),
        );
      },
    );
  }

  download() {
    showAdaptiveActionSheet(
      context: context,
      title: const Text(
        'Select Option',
        style: TextStyle(color: Styles.subtitleTxt),
      ),
      androidBorderRadius: size(context).width / 40,

      actions: <BottomSheetAction>[
        BottomSheetAction(
          title: Text(
            'Download',
            style: TextStyle(color: Styles.kPrimaryColor.withOpacity(.8)),
          ),
          onPressed: (context) {},
        ),
        BottomSheetAction(
          title: Text(
            'Delete',
            style: TextStyle(
              color: Styles.red.withOpacity(.8),
              fontSize: size(context).width / 20,
            ),
          ),
          onPressed: (context) {},
        ),
      ],

      cancelAction: CancelAction(
        title: Text(
          'Cancel',
          style: TextStyle(
            color: Styles.subtitleTxt,
            fontSize: size(context).width / 21,
          ),
        ),
      ), // onPressed parameter is optional by default will dismiss the ActionSheet
    );
  }

  share() async {
    File file = await fileFromImageUrl(uri: widget.images[currentindex]);
    List<String> files = [file.path];
    // ignore: deprecated_member_use
    Share.shareFiles(files);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: .4,
        actions: [
          IconButton(
            onPressed: () => scanfile(),
            icon: const Icon(
              MdiIcons.qrcode,
              color: Styles.white,
            ),
          ),
          SizedBox(width: size(context).width / 70),
          IconButton(
            onPressed: () => share(),
            icon: const Icon(
              Icons.share_rounded,
              color: Styles.white,
            ),
          ),
          SizedBox(width: size(context).width / 70),
          IconButton(
            onPressed: () => download(),
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Styles.white,
            ),
          ),
          SizedBox(width: size(context).width / 40),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: PhotoViewGallery.builder(
        customSize: MediaQuery.of(context).size,
        itemCount: widget.images.length,
        pageController: pageController,
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            heroAttributes: PhotoViewHeroAttributes(
              tag: widget.index.toString(),
            ),
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: CircularProgressIndicator(color: Styles.kPrimaryColor),
              );
            },
            imageProvider: CachedNetworkImageProvider(widget.images[index]),
            minScale: PhotoViewComputedScale.contained * 1,
            maxScale: PhotoViewComputedScale.covered * 6,
            filterQuality: FilterQuality.high,
          );
        },
        loadingBuilder: (BuildContext context, ImageChunkEvent event) {
          return const Center(child: CircularProgressIndicator());
        },
        onPageChanged: (int index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }
}
