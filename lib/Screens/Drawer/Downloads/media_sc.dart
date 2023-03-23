import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Screens/Drawer/Downloads/view_img.dart';

import '../../../Utils/const.dart';

class MediaSc extends StatefulWidget {
  const MediaSc({Key key}) : super(key: key);

  @override
  State<MediaSc> createState() => _MediaScState();
}

class _MediaScState extends State<MediaSc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: images.length,
        padding: EdgeInsets.symmetric(
          horizontal: size(context).width / 60,
          vertical: size(context).width / 60,
        ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: size(context).width / 3,
          childAspectRatio: 3 / 2.6,
          crossAxisSpacing: size(context).width / 70,
          mainAxisSpacing: size(context).width / 50,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewImage(
                  index: index,
                  images: images,
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size(context).width / 70),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    images[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
