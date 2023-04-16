import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Model/Status/status.dart';
import 'package:chat_app/Model/enums.dart';
import 'package:chat_app/Screens/Status/Pages/Post/Widget/Text/color_palette.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/Utils/trim_text.dart';
import 'package:flutter/material.dart';

class StatusRadius extends StatelessWidget {
  final int numberOfStatus, indexOfSeenStatus, index;
  final double spacing;
  final double radius;
  final double padding;
  final double strokeWidth;
  final Color seenColor, unSeenColor;
  final Widget child;

  final StoriesModel storiesModel;
  const StatusRadius({
    Key key,
    this.numberOfStatus = 10,
    this.indexOfSeenStatus = 0,
    this.spacing = 10.0,
    this.radius = 50,
    this.padding = 5,
    this.child,
    this.strokeWidth = 2,
    this.seenColor = Colors.grey,
    this.unSeenColor = Colors.grey,
    @required this.storiesModel,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: radius * 2,
          height: radius * 2,
          child: CustomPaint(
            painter: Arc(
                alreadyWatch: indexOfSeenStatus,
                numberOfArc: numberOfStatus,
                spacing: spacing,
                strokeWidth: strokeWidth,
                seenColor: seenColor,
                unSeenColor: unSeenColor),
          ),
        ),
        CircleAvatar(
          radius: radius - padding,
          backgroundColor:
              storiesModel.type == StoryType.TEXT && !storiesModel.isbgimg
                  ? bgcolors[int.parse(storiesModel.bg)]
                  : Colors.transparent,
          backgroundImage: index == 0
              ? null
              : storiesModel.type == StoryType.IMAGE || storiesModel.isbgimg
                  ? CachedNetworkImageProvider(storiesModel.bg)
                  : null,
          child: childWidget(context),
        ),
      ],
    );
  }

  childWidget(BuildContext context) {
    if (child != null) {
      return child;
    } else {
      if (storiesModel.msg != null) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textLimit(text: storiesModel.msg, max: 30, morecharacter: '..'),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: size(context).width / 54, color: Colors.white),
          ),
        );
      } else {
        return null;
      }
    }
  }
}

class StatusRadius2 extends StatelessWidget {
  final int numberOfStatus;
  final int indexOfSeenStatus;
  final double spacing;
  final double radius;
  final double padding;
  final String centerImageUrl;
  final double strokeWidth;
  final Color seenColor;
  final Color unSeenColor;
  final Widget child;
  final bool noImg;
  const StatusRadius2(
      {Key key,
      this.numberOfStatus = 10,
      this.indexOfSeenStatus = 0,
      this.spacing = 10.0,
      this.radius = 50,
      this.padding = 5,
      this.child,
      @required this.centerImageUrl,
      this.strokeWidth = 2,
      this.seenColor = Colors.grey,
      this.unSeenColor = Colors.grey,
      this.noImg})
      : assert(centerImageUrl != null, "Please provide centerImageUrl"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: radius * 2,
          height: radius * 2,
          child: CustomPaint(
            painter: Arc(
                alreadyWatch: indexOfSeenStatus,
                numberOfArc: numberOfStatus,
                spacing: spacing,
                strokeWidth: strokeWidth,
                seenColor: seenColor,
                unSeenColor: unSeenColor),
          ),
        ),
        CircleAvatar(
          radius: radius - padding,
          backgroundColor: Colors.transparent,
          backgroundImage:
              noImg == true ? null : CachedNetworkImageProvider(centerImageUrl),
          child: child,
        ),
      ],
    );
  }
}

class Arc extends CustomPainter {
  final int numberOfArc;
  final int alreadyWatch;
  final double spacing;
  final double strokeWidth;
  final Color seenColor;
  final Color unSeenColor;
  Arc({
    @required this.numberOfArc,
    @required this.alreadyWatch,
    @required this.spacing,
    @required this.strokeWidth,
    @required this.seenColor,
    @required this.unSeenColor,
  });

  double doubleToAngle(double angle) => angle * pi / 180.0;

  void drawArcWithRadius(
      Canvas canvas,
      Offset center,
      double radius,
      double angle,
      Paint seenPaint,
      Paint unSeenPaint,
      double start,
      double spacing,
      int number,
      int alreadyWatch) {
    for (var i = 0; i < number; i++) {
      canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          doubleToAngle((start + ((angle + spacing) * i))),
          doubleToAngle(angle),
          false,
          alreadyWatch - 1 >= i ? seenPaint : unSeenPaint);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2.0, size.height / 2.0);
    final double radius = size.width / 2.0;
    double angle = numberOfArc == 1 ? 360.0 : (360.0 / numberOfArc - spacing);
    var startingAngle = 270.0;

    Paint seenPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..color = seenColor;

    Paint unSeenPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..color = unSeenColor;

    drawArcWithRadius(canvas, center, radius, angle, seenPaint, unSeenPaint,
        startingAngle, spacing, numberOfArc, alreadyWatch);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
