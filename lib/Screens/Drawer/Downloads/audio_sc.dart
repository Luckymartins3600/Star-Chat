import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/Utils/const.dart';

import '../../../Model/Chat/audio_model.dart';
import '../../../Styles/style.dart';
import '../../Messages/Utils/format_date.dart';
import '../../../Utils/trim_text.dart';

class AudioSc extends StatefulWidget {
  const AudioSc({Key key}) : super(key: key);

  @override
  State<AudioSc> createState() => _AudioScState();
}

class _AudioScState extends State<AudioSc> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration position = const Duration();
  Duration duration = const Duration();
  @override
  void initState() {
    audioPlayer.onPlayerCompletion.listen((event) {
      position = const Duration(seconds: 0);
      for (var i = 0; i < audiofiles.length; i++) {
        setState(() {
          audiofiles[i].isplaying = false;
        });
      }
    });
    audioPlayer.onDurationChanged.listen((eventD) {
      setState(() {
        duration = eventD;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((eventP) {
      setState(() {
        position = eventP;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  onplay(String url, int index) {
    if (audiofiles[index].isplaying == true) {
      audioPlayer.pause();

      setState(() => audiofiles[index].isplaying = false);
    } else {
      for (var i = 0; i < audiofiles.length; i++) {
        audiofiles[i].isplaying = false;
      }
      setState(
        () {
          duration = const Duration();
          audiofiles[index].isplaying = true;
        },
      );

      play(url);
    }
  }

  play(url) {
    audioPlayer.setUrl(url).then(
          (value) => audioPlayer.play(
            url,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: audiofiles.length,
        itemBuilder: (context, index) {
          return tile(index: index, isplaying: audiofiles[index].isplaying);
        },
      ),
    );
  }

  Widget tile({@required int index, @required bool isplaying}) {
    return ListTile(
      onTap: () => onplay(audiofiles[index].url, index),
      contentPadding: EdgeInsets.symmetric(
          vertical: size(context).width / 170,
          horizontal: size(context).width / 50),
      leading: leadingStatus(
        isplaying: isplaying,
        context: context,
        index: index,
        value: position.inSeconds / 100,
        onPressed: () => onplay(audiofiles[index].url, index),
      ),
      title: Text(
        textLimit(text: audiofiles[index].name, max: 50, morecharacter: ''),
      ),
      subtitle: audiotileSub(index),
      trailing: Text(
        FormateDate(audiofiles[index].timeStamp).getText(),
        style: const TextStyle(color: Styles.subtitleTxt),
      ),
    );
  }

  audiotileSub(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: Row(
        children: [
          Icon(
            Icons.arrow_downward_rounded,
            color: Styles.kPrimaryColor,
            size: size(context).width / 26,
          ),
          SizedBox(width: size(context).width / 80),
          Text(
            audiofiles[index].size,
            style: TextStyle(
                color: Styles.kPrimaryColor.withOpacity(.8),
                fontSize: size(context).width / 28),
          ),
          Text(
            ' • ',
            style: TextStyle(
                color: Styles.kPrimaryColor.withOpacity(.7),
                fontSize: size(context).width / 28),
          ),
          sender(index, audiofiles[index])
        ],
      ),
    );
  }

  sender(int index, AudioModel model) {
    return index.isEven
        ? Text(
            textLimit(text: model.sendername, max: 12),
            style: TextStyle(
                color: Styles.kPrimaryColor,
                fontSize: size(context).width / 28),
          )
        : Row(
            children: [
              Text(
                'You',
                style: TextStyle(
                  color: Styles.kPrimaryColor.withOpacity(.8),
                  fontSize: size(context).width / 32,
                ),
              ),
              SizedBox(width: size(context).width / 180),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Styles.kPrimaryColor,
                size: size(context).width / 35,
              ),
              SizedBox(width: size(context).width / 130),
              Text(
                textLimit(
                  text: 'Reciver Name',
                  max: 10,
                ),
                style: TextStyle(
                  color: Styles.kPrimaryColor,
                  fontSize: size(context).width / 35,
                ),
              ),
            ],
          );
  }
}

leadingStatus(
    {bool isplaying,
    BuildContext context,
    int index,
    double value = 0.0,
    void Function() onPressed}) {
  if (isplaying == true) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Styles.kPrimaryColor,
          radius: size(context).width / 14,
          child: const Icon(Icons.pause_rounded),
        ),
        SizedBox(
          width: size(context).width / 8,
          height: size(context).width / 8,
          child: CircularProgressIndicator(
            color: Styles.white.withOpacity(.2),
            value: 1,
          ),
        ),
        SizedBox(
          width: size(context).width / 8,
          height: size(context).width / 8,
          child: CircularProgressIndicator(
            color: Styles.white.withOpacity(.4),
            value: value, // Change this value to update the progress
          ),
        ),
      ],
    );
  } else {
    return CircleAvatar(
      radius: size(context).width / 14,
      backgroundColor: Styles.kPrimaryColor,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          audiofiles[index].isplaying != true
              ? Icons.play_arrow_rounded
              : Icons.pause_rounded,
          color: Styles.white,
        ),
      ),
    );
  }
}
