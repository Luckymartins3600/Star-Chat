import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:chat_app/widgets/ViewFiles/img_list.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class GridFiles extends StatefulWidget {
  final bool isDark;
  const GridFiles({Key key, @required this.isDark}) : super(key: key);

  @override
  State<GridFiles> createState() => _GridFilesState();
}

class _GridFilesState extends State<GridFiles> {
  List<String> img = [];

  @override
  void initState() {
    addRandomImage();
    super.initState();
  }

  addRandomImage() {
    for (var i = 0; i < 30; i++) {
      img.add(faker.image.image(
        keywords: ['superman'],
        random: true,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: img.length,
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
          onTap: () => Navigate.forward(
              context: context,
              screen: ViewListImage(index: index, images: img)),
          child: Container(
            decoration: BoxDecoration(
              color: widget.isDark
                  ? Colors.grey.shade300.withOpacity(.7)
                  : Colors.grey.shade200,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(img[index]),
              ),
              borderRadius: BorderRadius.circular(
                size(context).width / 90,
              ),
            ),
            child: index.isEven
                ? null
                : Stack(
                    children: [
                      Center(
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: size(context).width / 14,
                          color: Colors.white,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.all(size(context).width / 100),
                          child: const Text(
                            '10:23',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
