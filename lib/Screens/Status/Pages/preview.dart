import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Screens/Status/Widget/button.dart';
import 'package:chat_app/Screens/Status/Widget/comment_box.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:story/story_image.dart';
import 'package:story/story_page_view.dart';

class PreviewStatus extends StatefulWidget {
  const PreviewStatus({Key key}) : super(key: key);

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

  String url =
      'https://firebasestorage.googleapis.com/v0/b/note-b33ce.appspot.com/o/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20-%202023-03-28%20at%2020.16.40.png?alt=media&token=69aec71f-80f5-4d54-b973-76db4dc825c3';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: StoryPageView(
          itemBuilder: (context, pageIndex, storyIndex) {
            final user = sampleUsers[pageIndex];
            final story = user.stories[storyIndex];
            return Stack(
              children: [
                Positioned.fill(
                  child: StoryImage(
                    key: ValueKey(story.imageUrl),
                    imageProvider: CachedNetworkImageProvider(
                        storyIndex == 4 ? url : story.imageUrl),
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
                              CachedNetworkImageProvider(user.profleUrl)),
                      SizedBox(width: size(context).width / 30),
                      Text(
                        user.userName,
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
          gestureItemBuilder: (context, pageIndex, storyIndex) {
            return Stack(
              children: const [CloseBtn(), CommentBox()],
            );
          },
          indicatorAnimationController: indicatorAnimationController,
          initialStoryIndex: (pageIndex) {
            if (pageIndex == 0) {
              return 1;
            }
            return 0;
          },
          pageLength: sampleUsers.length,
          storyLength: (int pageIndex) {
            return sampleUsers[pageIndex].stories.length;
          },
          onPageLimitReached: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

class UserModel {
  UserModel({@required this.stories, @required this.userName, this.profleUrl});

  final List<StoryModel> stories;
  final String userName;
  final String profleUrl;
}

class StoryModel {
  StoryModel(this.imageUrl);

  final String imageUrl;
}

final sampleUsers = List.generate(
  2,
  (index) => UserModel(
    profleUrl: faker.image.image(random: true, keywords: ['person']),
    userName: faker.address.person.name(),
    stories: List.generate(
      10,
      (index) => StoryModel(
        faker.image.image(
          random: true,
          keywords: ['women', 'beautiful'],
        ),
      ),
    ),
  ),
);
