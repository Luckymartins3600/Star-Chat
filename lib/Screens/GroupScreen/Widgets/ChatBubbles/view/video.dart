import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'package:chat_app/Model/Chat/video.dart';
import 'package:chat_app/Styles/style.dart';

import '../../../../../Model/enums.dart';

class ViewVideo extends StatefulWidget {
  final bool isDarkMode;
  final VideoModel model;
  final String tag;
  const ViewVideo({Key key, this.isDarkMode, this.model, this.tag})
      : super(
          key: key,
        );

  @override
  State<ViewVideo> createState() => _ViewVideoState();
}

class _ViewVideoState extends State<ViewVideo> {
  PodPlayerController playerController;
  @override
  void initState() {
    playerController = PodPlayerController(
      playVideoFrom: widget.model.videoType == VideoType.YOUTUBE
          ? PlayVideoFrom.youtube(widget.model.url)
          : PlayVideoFrom.network(widget.model.url),
    )
      ..initialise()
      ..hideOverlay();
    super.initState();
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.model.videoType);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text(
          'The Lengendary Martins Season 2',
          style: TextStyle(
            fontSize: Styles.meduimFontSize,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Theme(
        data: widget.isDarkMode ? ThemeData.dark() : ThemeData.light(),
        child: PodVideoPlayer(
          controller: playerController,
          videoThumbnail: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(widget.model.thumbnail),
          ),
        ),
      ),
    );
  }
}
