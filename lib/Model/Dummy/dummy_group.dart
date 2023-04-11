import 'dart:math';
import 'package:chat_app/Model/Chat/audio.dart';
import 'package:chat_app/Model/Chat/file.dart';
import 'package:chat_app/Model/Chat/video.dart';
import 'package:chat_app/Model/enums.dart';
import 'package:faker/faker.dart';
import 'package:uuid/uuid.dart';
import '../Chat/chat.dart';
import '../Group_Chat/chat_model.dart';
import '../Group_Chat/messages.dart';
import '../current_user.dart';
import '../user_model.dart';
import 'dummy_sgchat.dart';

List<GroupRecentMessageModel> dummyGroupRecentMessages = List.generate(
  4,
  (index) {
    int id = Random().nextInt(10);

    return GroupRecentMessageModel(
      unreadMsgCount: recentMessageList[id].unreadMsgCount,
      lastMessage: GroupChatModel(
        lastChat: ChatModel(
          senderModel: CurrentUserModel(
            email: faker.internet.email(),
            profilepic: faker.image.image(random: false),
            uid: const Uuid().v1(),
            username: faker.internet.userName(),
          ),
          type: recentMessageList[id].lastChat.type,
          timeStamp: recentMessageList[id].lastChat.timeStamp,
          uuid: recentMessageList[id].lastChat.uuid,
          message: recentMessageList[id].lastChat.message,
          chatStatus: recentMessageList[id].lastChat.chatStatus,
          audioModel: recentMessageList[id].lastChat.audioModel,
          fileModel: recentMessageList[id].lastChat.fileModel,
          imgList: recentMessageList[id].lastChat.imgList,
          videoModel: recentMessageList[id].lastChat.videoModel,
        ),
      ),
    );
  },
);

List<GroupChatModel> groupMessages = [
  GroupChatModel(
    groupRole: GroupRole.ADMIN,
    lastChat: ChatModel(
      senderModel: currentUserModel,
      timeStamp: DateTime.now(),
      chatStatus: ChatStatus.SEEN,
      message: "Hope you are doing good ? Oh! Nice. Same here man",
      uuid: const Uuid().v1(),
    ),
  ),
  GroupChatModel(
    lastChat: ChatModel(
      timeStamp: DateTime.now(),
      chatStatus: ChatStatus.NewMessage,
      message: "Oh! Nice. Same here man Oh! Nice. Same here man",
      senderModel: CurrentUserModel(
        email: faker.internet.email(),
        profilepic: faker.image.image(random: false),
        uid: const Uuid().v1(),
        username: faker.internet.userName(),
      ),
      uuid: const Uuid().v1(),
    ),
  ),
  GroupChatModel(
    lastChat: ChatModel(
      chatStatus: ChatStatus.NewMessage,
      timeStamp: DateTime.now(),
      message: null,
      senderModel: CurrentUserModel(
        email: faker.internet.email(),
        profilepic: faker.image.image(random: false),
        uid: const Uuid().v1(),
        username: faker.internet.userName(),
      ),
      imgList: imgs,
      type: ChatMessageType.PICTURE,
      uuid: const Uuid().v1(),
    ),
  ),
  GroupChatModel(
    groupRole: GroupRole.ADMIN,
    lastChat: ChatModel(
      message:
          'Once upon a time there was a young girl called Sarah. https://flutter.dev She was very adventurous and loved to explore the world around her. One day she decided to go on a long walk in the woods. As she was walking, she came across a strange house. She was curious and decided to go in. The door opened with a creak and Sarah stepped inside. The house was empty, but Sarah noticed something strange. On the walls were PICTUREs of different animals. She decided to take one down and it https://youtu.be/o_kjNDMQ9dY turned out to be a PICTURE of a rabbit. Just then, a voice from behind her said, “That’s my rabbit!” Sarah turned around and saw a very old man with a long white beard. He said his name was John and he had been living in the house for many years. ',
      senderModel: currentUserModel,
      uuid: const Uuid().v1(),
      timeStamp: DateTime.now(),
      chatStatus: ChatStatus.SEEN,
    ),
  ),
  GroupChatModel(
    lastChat: ChatModel(
      senderModel: CurrentUserModel(
        email: faker.internet.email(),
        profilepic: faker.image.image(random: false),
        uid: const Uuid().v1(),
        username: faker.internet.userName(),
      ),
      message: null,
      type: ChatMessageType.PICTURE,
      uuid: const Uuid().v1(),
      imgList: [
        'https://images.pexels.com/photos/1024989/pexels-photo-1024989.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
      ],
      timeStamp: DateTime.now(),
      chatStatus: ChatStatus.SENT,
    ),
  ),
  GroupChatModel(
    lastChat: ChatModel(
      message: '',
      senderModel: currentUserModel,
      type: ChatMessageType.AUDIO,
      audioModel: ChatAudioModel(
        url:
            'https://cdn.trendybeatz.com/AUDIO/Kizz-Daniel-RTID-Rich-Till-I-Die-(TrendyBeatz.com).mp3',
        duration: '00:04:39',
      ),
      uuid: const Uuid().v1(),
      timeStamp: DateTime.now(),
      chatStatus: ChatStatus.SENT,
    ),
  ),
  GroupChatModel(
    lastChat: ChatModel(
      message: '',
      senderModel: CurrentUserModel(
        email: faker.internet.email(),
        profilepic: faker.image.image(random: false),
        uid: const Uuid().v1(),
        username: faker.internet.userName(),
      ),
      type: ChatMessageType.AUDIO,
      audioModel: ChatAudioModel(
        url:
            'https://cdn.trendybeatz.com/AUDIO/Kizz-Daniel-RTID-Rich-Till-I-Die-(TrendyBeatz.com).mp3',
        duration: '00:04:39',
      ),
      uuid: const Uuid().v1(),
      timeStamp: DateTime.now(),
      chatStatus: ChatStatus.SENT,
    ),
  ),
  GroupChatModel(
    groupRole: GroupRole.ADMIN,
    lastChat: ChatModel(
      message: '',
      senderModel: CurrentUserModel(
        email: faker.internet.email(),
        profilepic: faker.image.image(random: false),
        uid: const Uuid().v1(),
        username: faker.internet.userName(),
      ),
      type: ChatMessageType.VIDEO,
      videoModel: VideoModel(
        videoType: VideoType.YOUTUBE,
        url: 'https://youtu.be/JqcncLPi9zw',
        thumbnail: 'https://img.youtube.com/vi/JqcncLPi9zw/0.jpg',
      ),
      uuid: const Uuid().v1(),
      timeStamp: DateTime.now(),
      chatStatus: ChatStatus.SEEN,
    ),
  ),
  GroupChatModel(
    lastChat: ChatModel(
      message: '',
      senderModel: currentUserModel,
      type: ChatMessageType.VIDEO,
      videoModel: VideoModel(
        videoType: VideoType.YOUTUBE,
        url: 'https://youtu.be/ISOM-t2-hKQ',
        thumbnail: 'https://img.youtube.com/vi/ISOM-t2-hKQ/0.jpg',
      ),
      uuid: const Uuid().v1(),
      timeStamp: DateTime.now(),
      chatStatus: ChatStatus.DILIVERED,
    ),
  ),
  GroupChatModel(
    groupRole: GroupRole.ADMIN,
    lastChat: ChatModel(
      message: '',
      senderModel: currentUserModel,
      type: ChatMessageType.FILE,
      fileModel: FileModel(
        fileName: 'Dating Format.txt',
        fileSize: '13 MB',
        fileType: FileType.TXT,
        url:
            'https://firebasestorage.googleapis.com/v0/b/testing-5b157.appspot.com/o/Untitled.rtf?alt=media&token=a4ed7c08-1015-4cc9-917f-314acb6abd9d',
      ),
      uuid: const Uuid().v1(),
      timeStamp: DateTime.now(),
      chatStatus: ChatStatus.SENT,
    ),
  ),
  GroupChatModel(
    groupRole: GroupRole.ADMIN,
    lastChat: ChatModel(
      message: '',
      senderModel: CurrentUserModel(
        email: faker.internet.email(),
        profilepic: faker.image.image(random: false),
        uid: const Uuid().v1(),
        username: faker.internet.userName(),
      ),
      type: ChatMessageType.FILE,
      fileModel: FileModel(
        fileName: 'Star Chat Source Code.zip',
        fileSize: '1.6 GB',
        fileType: FileType.ZIP,
        url:
            'https://firebasestorage.googleapis.com/v0/b/testing-5b157.appspot.com/o/1677825616891.jpeg.zip?alt=media&token=25e09f92-2d80-4df8-9e13-1af708d8ab26',
      ),
      uuid: const Uuid().v1(),
      timeStamp: DateTime.now(),
      chatStatus: ChatStatus.NewMessage,
    ),
  ),
];
