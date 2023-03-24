// ignore_for_file: use_build_context_synchronously, prefer_null_aware_operators

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Model/Group_Chat/messages.dart';
import 'package:chat_app/Screens/GroupScreen/Screens/group_info.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/ChatBubbles/typing.dart';
import 'package:chat_app/Utils/trim_text.dart';
import 'package:chat_app/func/navigate.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:siri_wave/siri_wave.dart';
import 'package:chat_app/Model/Dummy/dummy_group.dart';
import 'package:chat_app/Screens/GroupScreen/Widgets/ChatBubbles/chat_bubble.dart';
import 'package:chat_app/Screens/Messages/Widgets/uploadfile_dialog.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import '../../../Model/Chat/audio_model.dart';
import '../../../Model/Dummy/dummy_sgchat.dart';
import '../../../Model/enums.dart';
import '../../../func/scroll_bottom.dart';
import '../../Messages/Widgets/buttons.dart';

class GroupChatScreen extends StatefulWidget {
  final String img;
  final String name;
  final int index;
  final bool isDarkMode;

  const GroupChatScreen(
      {Key key, this.img, this.name, this.index, this.isDarkMode})
      : super(key: key);

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen>
    with SingleTickerProviderStateMixin {
  AnimationController bottomSheetController;
  TextEditingController messageController = TextEditingController();
  SiriWaveController siriWavecontroller = SiriWaveController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  AudioPlayer audioplayer = AudioPlayer();
  AudioPlayer musicPlayer = AudioPlayer();
  List<AudioModel> voiceNotes = [];
  String path = '', it;
  bool isRecording = false, isPlaying = false;
  double progess = .2;
  Duration duration = const Duration();
  Duration position = const Duration();
  final ScrollController scrollController = ScrollController();

  final audioRecorder = Record();

  @override
  void initState() {
    bottomSheetController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
    );

    scrollToBottom(scrollController);
    getProgress();
    init();
    super.initState();
  }

  @override
  void dispose() async {
    scrollController.dispose();
    bottomSheetController.dispose();
    audioplayer ?? await audioplayer.dispose();
    musicPlayer ?? await musicPlayer.dispose();
    audioRecorder ?? await audioRecorder.dispose();
    super.dispose();
  }

  bool morethan() {
    if (messageController.text.length > 34) {
      return true;
    } else {
      return false;
    }
  }

  getProgress() {
    if (mounted) {
      // Get Duration
      musicPlayer.onDurationChanged.listen((eventD) {
        setState(() => duration = eventD);
      });
      // Get Position
      musicPlayer.onAudioPositionChanged.listen((eventP) {
        setState(() => position = eventP);
        progess =
            ((position.inSeconds.toDouble() / duration.inSeconds.toDouble()) *
                    100)
                .roundToDouble();
      });
      musicPlayer.onPlayerCompletion.listen((event) {
        setState(() {
          progess = .2;
        });
        for (var i = 0; i < voiceNotes.length; i++) {
          voiceNotes[i].isplaying = false;
        }
      });
    }
  }

  void init() async {
    await Permission.microphone.request();
    chatMessageList.where((element) {
      voiceNotes.add(element.type != ChatMessageType.AUDIO
          ? AudioModel(
              name: '',
              isplaying: null,
              sendername: '',
              size: '',
              timeStamp: null,
              url: '',
              paused: null)
          : AudioModel(
              name: element.uuid,
              size: '',
              url: element.audioModel.url,
              timeStamp: null,
              sendername: null,
              isplaying: false,
              paused: false,
            ));

      return element.type == ChatMessageType.AUDIO;
    }).toList();
  }

  FocusNode focusNode = FocusNode();
  inforScreen() {
    return Navigate.forward(
      context: context,
      screen: GroupInfoScreen(
        isDark: widget.isDarkMode,
        groupInfo: GroupInfo(
          name: widget.name,
          profileUrl: widget.img,
          uid: widget.index.toString(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowIndicator();
        return false;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            leading: const BackButtonCB(),
            systemOverlayStyle: defaultTransparentAppBar(
              bottom:
                  widget.isDarkMode ? const Color(0xFF000000) : Styles.white,
            ),
            leadingWidth: size(context).width / 10,
            actions: [
              IconButton(
                onPressed: () => inforScreen(),
                icon: const Icon(
                  MdiIcons.information,
                  color: Styles.kPrimaryColor,
                ),
              ),
              SizedBox(width: size(context).width / 40),
            ],
            title: ListTile(
horizontalTitleGap: 94,
              tileColor: Colors.red,
              onTap: () => inforScreen(),
              leading: CircleAvatar(
                radius: size(context).width / 19,
                backgroundColor: Styles.kPrimaryColor,
                backgroundImage: CachedNetworkImageProvider(widget.img),
              ),
              title: Text(textLimit(text: widget.name, max: 14)),
              subtitle: Text(
                'You, Martins and 7 Others',
                style: TextStyle(
                  fontSize: size(context).width / 35,
                  color: widget.isDarkMode ? Colors.white70 : Colors.grey,
                ),
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
          body: Column(
            mainAxisAlignment: widget.index.isEven
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.end,
            children: [
              const SizedBox(),
              widget.index.isEven
                  ? Padding(
                      padding: EdgeInsets.only(
                          top:
                              focusNode.hasFocus ? size(context).width / 3 : 0),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        height: size(context).width / 2,
                        child: Column(
                          children: [
                            Icon(
                              CupertinoIcons.chat_bubble_2,
                              size: size(context).width / 6,
                            ),
                            SizedBox(height: Styles.smallFontSize),
                            Text(
                              'No messages yet.',
                              style: TextStyle(
                                fontSize: Styles.fontSize,
                                fontWeight: FontWeight.w100,
                                color: Theme.of(context)
                                    .appBarTheme
                                    .foregroundColor
                                    .withOpacity(.9),
                              ),
                            ),
                            const Spacer(flex: 2),
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      flex: 9,
                      child:
                          NotificationListener<OverscrollIndicatorNotification>(
                        onNotification: (overscroll) {
                          overscroll.disallowIndicator();
                          return false;
                        },
                        child: ListView.builder(
                          controller: scrollController,
                          padding: EdgeInsetsDirectional.only(
                            top: size(context).width / 20,
                            bottom: size(context).width / 10,
                          ),
                          itemCount: groupMessages.length + 1,
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          itemBuilder: (context, index) {
                            if (index == groupMessages.length) {
                              return TypingWidget(
                                messageModel: groupMessages[index - 1],
                                isDarkMode: widget.isDarkMode,
                              );
                            }
                            return GroupChatBubble(
                              reciverTyping: true,
                              duration: duration,
                              position: position,
                              progess: progess,
                              isplaying: false,
                              paused: true,
                              chatMessage: groupMessages[index],
                              darkMode: widget.isDarkMode,
                              audioPlayer: musicPlayer,
                              onTap: () =>
                                  onplayMusic(voiceNotes[index].url, index),
                            );
                          },
                        ),
                      ),
                    ),
              SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: size(context).width / 50,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: widget.isDarkMode
                            ? const Color(0xD2141313)
                            : const Color(0x379E9E9E),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      button(
                        icon: Icon(
                          Icons.add,
                          color: const Color(0xE4FFFFFF),
                          size: size(context).width / 17,
                        ),
                        context: context,
                        onTap: () => uploadDialog(widget.isDarkMode, context),
                      ),
                      const Spacer(flex: 5),
                      Expanded(
                        flex: 455,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: size(context).width / 50,
                          ),
                          decoration: BoxDecoration(
                            color: widget.isDarkMode
                                ? const Color(0xFFE6E6E6).withOpacity(0.1)
                                : const Color(0xFFE6E6E6).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(
                              !morethan()
                                  ? size(context).width / 10
                                  : size(context).width / 30,
                            ),
                          ),
                          child: Center(
                            child: TextField(
                              focusNode: focusNode,
                              controller: messageController,
                              maxLines: 2,
                              minLines: 1,
                              readOnly: isRecording,
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                hintText:
                                    isRecording ? 'Recording' : 'Type here',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: widget.isDarkMode
                                      ? const Color(0x70FFFAFA)
                                      : const Color(0xFF8A8A8A),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: size(context).width / 30,
                                  vertical: size(context).width / 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 5),
                      button(
                          context: context,
                          icon: Icon(
                            messageController.text.trim() == ''
                                ? Icons.mic
                                : Icons.send_rounded,
                            color: const Color(0xE4FFFFFF),
                            size: size(context).width / 17,
                          ),
                          padding: EdgeInsets.only(
                            left: messageController.text.trim() != ''
                                ? size(context).width / 90
                                : 0,
                          ),
                          onTap: () async {
                            await startRecording();
                            int vindex = Random().nextInt(100);
                            if (messageController.text.trim() == '') {
                              scaffoldKey.currentState.showBottomSheet(
                                (context) {
                                  return StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter updateState) {
                                    return Container(
                                      height: size(context).width / 1.2,
                                      width: size(context).width,
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        border: Border.all(
                                            color: Styles.kPrimaryColor,
                                            width: .4),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                              size(context).width / 14),
                                          topRight: Radius.circular(
                                              size(context).width / 14),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Spacer(flex: 2),
                                          Text(
                                            'Voice Note $vindex',
                                            style: TextStyle(
                                              fontSize:
                                                  size(context).width / 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            height: size(context).width / 5,
                                            width: size(context).width,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SiriWave(
                                                  controller:
                                                      siriWavecontroller,
                                                  options: SiriWaveOptions(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    height:
                                                        size(context).width / 5,
                                                    width: size(context).width /
                                                        1.3,
                                                  ),
                                                  style: SiriWaveStyle.ios_7,
                                                )
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              !isRecording
                                                  ? IconButton(
                                                      onPressed: () async {
                                                        audioplayer.state ==
                                                                PlayerState
                                                                    .PLAYING
                                                            ? await audioplayer
                                                                .stop()
                                                            : null;
                                                        updateState(() {
                                                          audioplayer.state =
                                                              PlayerState
                                                                  .COMPLETED;
                                                          path = '';
                                                          isRecording = false;
                                                          isPlaying = false;
                                                        });

                                                        bottomSheetController
                                                            .reverse();
                                                      },
                                                      icon: Icon(
                                                        Icons.delete_rounded,
                                                        size: size(context)
                                                                .width /
                                                            11,
                                                      ),
                                                    )
                                                  : const SizedBox(),
                                              GestureDetector(
                                                onTap: () async {
                                                  if (isRecording) {
                                                    await stopRecording(
                                                        updateState);
                                                  } else {
                                                    playAndPause(updateState);
                                                  }
                                                  updateState(() {});
                                                },
                                                child: Container(
                                                  height:
                                                      size(context).width / 5.4,
                                                  width:
                                                      size(context).width / 5.4,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    border: Border.all(
                                                      color:
                                                          Styles.kPrimaryColor,
                                                      width: 4,
                                                    ),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    isRecording
                                                        ? Icons.stop_rounded
                                                        : isPlaying
                                                            ? Icons
                                                                .pause_rounded
                                                            : Icons
                                                                .play_arrow_rounded,
                                                    size:
                                                        size(context).width / 8,
                                                    color: Styles.kPrimaryColor,
                                                  ),
                                                ),
                                              ),
                                              !isRecording
                                                  ? IconButton(
                                                      onPressed: () {
                                                        updateState(() {});
                                                      },
                                                      icon: Icon(
                                                        Icons.send_rounded,
                                                        size: size(context)
                                                                .width /
                                                            11,
                                                      ),
                                                    )
                                                  : const SizedBox(),
                                            ],
                                          ),
                                          const Spacer(flex: 2),
                                        ],
                                      ),
                                    );
                                  });
                                },
                                transitionAnimationController:
                                    bottomSheetController,
                                // enableDrag: false,
                                backgroundColor: Colors.transparent,
                              );
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future startRecording() async {
    path = '';
    if (isRecording) {
      return;
    }
    try {
      if (await audioRecorder.hasPermission()) {
        audioRecorder.start();
        isRecording = await audioRecorder.isRecording();

        setState(() {
          isRecording = isRecording;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future stopRecording(StateSetter updateState) async {
    path = await audioRecorder.stop();
    final file = File(path);
    print(file);
    setState(() {
      isRecording = false;
      isPlaying = true;
    });
    playAndPause(updateState);
  }

  playAndPause(StateSetter updateState) async {
    if (audioplayer.state == PlayerState.COMPLETED ||
        audioplayer.state == PlayerState.STOPPED) {
      await audioplayer.setUrl(path, isLocal: true);
      setState(() {
        isPlaying = true;
      });
      audioplayer.play(path);
    } else if (audioplayer.state == PlayerState.PAUSED) {
      setState(() {
        isPlaying = true;
      });
      audioplayer.resume();
    } else {
      audioplayer.pause();
      setState(() {
        isPlaying = false;
      });
    }
  }

  onplayMusic(String url, int index) {
    if (voiceNotes[index].isplaying == true) {
      musicPlayer.pause();
      setState(() {
        voiceNotes[index].isplaying = false;
        voiceNotes[index].paused = true;
      });
    } else if (isPlaying == false && voiceNotes[index].paused) {
      musicPlayer.resume();
      setState(() {
        voiceNotes[index].isplaying = !false;
        voiceNotes[index].paused = !true;
      });
    } else {
      for (var i = 0; i < voiceNotes.length; i++) {
        voiceNotes[i].isplaying = false;
      }
      setState(
        () {
          voiceNotes[index].isplaying = true;
        },
      );
      musicPlayer.play(url);
    }
  }
}
