import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Model/Status/status.dart';
import 'package:chat_app/Model/current_user.dart';
import 'package:chat_app/Model/enums.dart';
import 'package:chat_app/Screens/Status/Widget/button.dart';
import 'package:chat_app/Screens/Status/Widget/comment_box.dart';
import 'package:chat_app/Styles/string_color.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:story/story_image.dart';
import 'package:story/story_page_view.dart';
import 'package:url_launcher/url_launcher.dart';

class PreviewStatus extends StatefulWidget {
  final List<StatusModel> status;
  const PreviewStatus({Key key, @required this.status}) : super(key: key);

  @override
  State<PreviewStatus> createState() => _PreviewStatusState();
}

class _PreviewStatusState extends State<PreviewStatus> {
  ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.resume);
  }

  @override
  void dispose() {
    indicatorAnimationController.dispose();
    super.dispose();
  }

  bool liked;
  CurrentUserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: StoryPageView(
          showShadow: true,
          itemBuilder: (context, statisIndex, storyIndex) {
            userModel = widget.status[statisIndex].userModel;
            final story = widget.status[statisIndex].stories[storyIndex];

            return Stack(
              children: [
                Positioned.fill(
                  child: story.type == StoryType.TEXT && !story.isbgimg
                      ? Container(color: stringColor(int.parse(story.bg)))
                      : StoryImage(
                          key: ValueKey(story),
                          imageProvider: CachedNetworkImageProvider(story.bg),
                          fit: BoxFit.cover,
                        ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size(context).width / 8.7,
                    horizontal: size(context).width / 45,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundImage:
                              CachedNetworkImageProvider(userModel.profilepic)),
                      SizedBox(width: size(context).width / 30),
                      Text(
                        userModel.username,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          gestureItemBuilder: (context, statisIndex, storyIndex) {
            final story = widget.status[statisIndex].stories[storyIndex];

            return Stack(
              children: [
                story.type == StoryType.TEXT
                    ? Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: size(context).width / 2.3,
                              horizontal: size(context).width / 20),
                          child: Linkify(
                            text: story.msg,
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
                            linkStyle:
                                const TextStyle(color: Styles.kPrimaryColor),
                            style:
                                TextStyle(fontSize: size(context).width / 16),
                          ),
                        ),
                      )
                    : const SizedBox(),
                const CloseBtn(),
                CommentBox(
                  liked: liked,
                  senderName: userModel.username,
                  likedFunc: () => setState(() => liked = true),
                  heartedFunc: () => setState(() => liked = false),
                ),
              ],
            );
          },
          indicatorAnimationController: indicatorAnimationController,
          initialStoryIndex: (pageIndex) {
            // if (pageIndex == 0) {
            //   return 1;
            // }
            return 0;
          },
          pageLength: widget.status.length,
          storyLength: (int pageIndex) {
            return widget.status[pageIndex].stories.length;
          },
          onPageLimitReached: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
