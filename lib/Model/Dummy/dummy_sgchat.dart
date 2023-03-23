import 'package:faker/faker.dart';
import 'package:uuid/uuid.dart';

import '../Chat/audio.dart';
import '../Chat/audio_model.dart';
import '../Chat/chat.dart';
import '../Chat/file.dart';
import '../Chat/message.dart';
import '../Chat/video.dart';
import '../current_user.dart';
import '../enums.dart';
import '../user_model.dart';

List<String> imgs = [
  'https://images.pexels.com/photos/914929/pexels-photo-914929.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/1371360/pexels-photo-1371360.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/1770310/pexels-photo-1770310.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/338504/pexels-photo-338504.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
];
List<String> imgs2 = [
  'https://images.pexels.com/photos/1268855/pexels-photo-1268855.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/60217/pexels-photo-60217.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/307008/pexels-photo-307008.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/208701/pexels-photo-208701.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/1010657/pexels-photo-1010657.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
];

List<String> imgs3 = [
  'https://images.pexels.com/photos/60217/pexels-photo-60217.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/1268855/pexels-photo-1268855.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/60217/pexels-photo-60217.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/208701/pexels-photo-208701.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/307008/pexels-photo-307008.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/208701/pexels-photo-208701.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/1010657/pexels-photo-1010657.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/307008/pexels-photo-307008.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/1010657/pexels-photo-1010657.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
  'https://images.pexels.com/photos/1268855/pexels-photo-1268855.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
];

List<ChatModel> chatMessageList = [
  ChatModel(
    timeStamp: DateTime.now(),
    chatStatus: ChatStatus.SEEN,
    message: "Hi John",
    senderModel: currentUserModel,
    uuid: const Uuid().v1(),
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    message: "Hope you are doin good",
    senderModel: currentUserModel,
    uuid: const Uuid().v1(),
    chatStatus: ChatStatus.SEEN,
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    message: "Hello Jane, I'm good what about you",
    senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    uuid: const Uuid().v1(),
    chatStatus: ChatStatus.SEEN,
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    message: "I'm fine, Working from home",
    senderModel: currentUserModel,
    uuid: const Uuid().v1(),
    chatStatus: ChatStatus.SEEN,
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    message: "Oh! Nice. Same here man",
    senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    uuid: const Uuid().v1(),
    chatStatus: ChatStatus.SEEN,
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    message: "Alright!",
    senderModel: currentUserModel,
    uuid: const Uuid().v1(),
    chatStatus: ChatStatus.SEEN,
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    message: "Are you on vacation?",
    senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    uuid: const Uuid().v1(),
    chatStatus: ChatStatus.SEEN,
  ),
  ChatModel(
    message:
        "Yes , sorry i did'nt told you i was trying to have a private time luckymartins360@gmail.com",
    senderModel: currentUserModel,
    timeStamp: DateTime.now(),
    uuid: const Uuid().v1(),
    chatStatus: ChatStatus.SEEN,
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    message: "No Problem i understand. can i get a pic #hey ?",
    senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    uuid: const Uuid().v1(),
    chatStatus: ChatStatus.SEEN,
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    message: "https://flutter.dev Okay",
    senderModel: currentUserModel,
    uuid: const Uuid().v1(),
    chatStatus: ChatStatus.SEEN,
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    message: null,
    senderModel: currentUserModel,
    imgList: imgs,
    type: ChatMessageType.PICTURE,
    uuid: const Uuid().v1(),
    chatStatus: ChatStatus.SEEN,
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    message: null,
    senderModel: currentUserModel,
    imgList: imgs2,
    type: ChatMessageType.PICTURE,
    uuid: const Uuid().v1(),
    chatStatus: ChatStatus.SEEN,
  ),

  ChatModel(
    timeStamp: DateTime.now(),
    message: "wow Nice! https://flutter.dev",
    senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    uuid: const Uuid().v1(),
    chatStatus: ChatStatus.SEEN,
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    message: '❤️✌️',
    senderModel: currentUserModel,
    uuid: const Uuid().v1(),
    chatStatus: ChatStatus.SEEN,
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    message: '',
    senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    type: ChatMessageType.PICTURE,
    uuid: const Uuid().v1(),
    imgList: [
      'https://images.pexels.com/photos/1024989/pexels-photo-1024989.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
    ],
    chatStatus: ChatStatus.SEEN,
  ),
  ChatModel(
    message:
        'Once upon a time there was a young girl called Sarah. https://flutter.dev She was very adventurous and loved to explore the world around her. One day she decided to go on a long walk in the woods. As she was walking, she came across a strange house. She was curious and decided to go in. The door opened with a creak and Sarah stepped inside. The house was empty, but Sarah noticed something strange. On the walls were PICTUREs of different animals. She decided to take one down and it https://youtu.be/o_kjNDMQ9dY turned out to be a PICTURE of a rabbit. Just then, a voice from behind her said, “That’s my rabbit!” Sarah turned around and saw a very old man with a long white beard. He said his name was John and he had been living in the house for many years. ',
    senderModel: currentUserModel,
    timeStamp: DateTime.now(),
    uuid: const Uuid().v1(),
    chatStatus: ChatStatus.SEEN,
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    message: '',
    senderModel: currentUserModel,
    type: ChatMessageType.AUDIO,
    audioModel: ChatAudioModel(
      url:
          'https://cdn.trendybeatz.com/AUDIO/Kizz-Daniel-RTID-Rich-Till-I-Die-(TrendyBeatz.com).mp3',
      duration: '00:04:39',
    ),
    uuid: const Uuid().v1(),
    chatStatus: ChatStatus.SEEN,
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    chatStatus: ChatStatus.SEEN,
    message: '',
    senderModel: currentUserModel,
    type: ChatMessageType.AUDIO,
    audioModel: ChatAudioModel(
      url:
          'https://cdn.trendybeatz.com/audio/Kizz-Daniel-RTID-Rich-Till-I-Die-(TrendyBeatz.com).mp3',
      duration: '00:04:39',
    ),
    uuid: const Uuid().v1(),
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    chatStatus: ChatStatus.SEEN,
    message:
        'https://cdn.trendybeatz.com/audio/Kizz-Daniel-RTID-Rich-Till-I-Die-(TrendyBeatz.com).mp3',
    senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    type: ChatMessageType.AUDIO,
    audioModel: ChatAudioModel(
      url: audiofiles[2].url,
      duration: '00:04:39',
    ),
    uuid: const Uuid().v1(),
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    chatStatus: ChatStatus.SEEN,
    message:
        'https://cdn.trendybeatz.com/audio/Kizz-Daniel-RTID-Rich-Till-I-Die-(TrendyBeatz.com).mp3',
    senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    type: ChatMessageType.AUDIO,
    audioModel: ChatAudioModel(
      url: audiofiles[2].url,
      duration: '00:04:39',
    ),
    uuid: const Uuid().v1(),
  ),

  // Video
  ChatModel(
    timeStamp: DateTime.now(),
    chatStatus: ChatStatus.SEEN,
    message: '',
    senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    type: ChatMessageType.VIDEO,
    videoModel: VideoModel(
      videoType: VideoType.YOUTUBE,
      url: 'https://youtu.be/JqcncLPi9zw',
      thumbnail: 'https://img.youtube.com/vi/JqcncLPi9zw/0.jpg',
    ),
    uuid: const Uuid().v1(),
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    chatStatus: ChatStatus.SEEN,
    message: '',
    senderModel: currentUserModel,
    type: ChatMessageType.VIDEO,
    videoModel: VideoModel(
      videoType: VideoType.YOUTUBE,
      url: 'https://youtu.be/ISOM-t2-hKQ',
      thumbnail: 'https://img.youtube.com/vi/ISOM-t2-hKQ/0.jpg',
    ),
    uuid: const Uuid().v1(),
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    chatStatus: ChatStatus.SEEN,
    message: '',
    senderModel: currentUserModel,
    type: ChatMessageType.VIDEO,
    videoModel: VideoModel(
      videoType: VideoType.YOUTUBE,
      url: 'https://youtu.be/ZMfC1hpeTa8',
      thumbnail: 'https://img.youtube.com/vi/ZMfC1hpeTa8/0.jpg',
    ),
    uuid: const Uuid().v1(),
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    chatStatus: ChatStatus.SEEN,
    message: '',
    senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    type: ChatMessageType.VIDEO,
    videoModel: VideoModel(
      videoType: VideoType.NETWORK,
      url:
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
      thumbnail:
          'https://images.pexels.com/photos/1114690/pexels-photo-1114690.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
    uuid: const Uuid().v1(),
  ),

  //  File

  ChatModel(
    timeStamp: DateTime.now(),
    chatStatus: ChatStatus.SEEN,
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
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    chatStatus: ChatStatus.SEEN,
    message: '',
    senderModel: currentUserModel,
    type: ChatMessageType.FILE,
    fileModel: FileModel(
      fileName: 'Star Chat Source Code.zip',
      fileSize: '1.6 GB',
      fileType: FileType.ZIP,
      url:
          'https://firebasestorage.googleapis.com/v0/b/testing-5b157.appspot.com/o/1677825616891.jpeg.zip?alt=media&token=25e09f92-2d80-4df8-9e13-1af708d8ab26',
    ),
    uuid: const Uuid().v1(),
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    chatStatus: ChatStatus.SEEN,
    message:
        'https://firebasestorage.googleapis.com/v0/b/testing-5b157.appspot.com/o/Untitled.rtf?alt=media&token=a4ed7c08-1015-4cc9-917f-314acb6abd9d',
    senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    type: ChatMessageType.FILE,
    fileModel: FileModel(
      fileName: 'Star Chat.apk',
      fileSize: '15 MB',
      fileType: FileType.APK,
      url:
          'https://firebasestorage.googleapis.com/v0/b/testing-5b157.appspot.com/o/VidStream.apk?alt=media&token=50d2a8b5-e51d-4c57-a311-2d8a08fbf122',
    ),
    uuid: const Uuid().v1(),
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    chatStatus: ChatStatus.SEEN,
    message: '',
    senderModel: currentUserModel,
    type: ChatMessageType.FILE,
    fileModel: FileModel(
      fileName: 'ChatGTP.pdf',
      fileSize: '13 MB',
      fileType: FileType.PDF,
      url: '',
    ),
    uuid: const Uuid().v1(),
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    chatStatus: ChatStatus.SEEN,
    message: '',
    senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    type: ChatMessageType.FILE,
    fileModel: FileModel(
      fileName: 'Flamze.xlsX',
      fileSize: '17 MB',
      fileType: FileType.XLS,
      url:
          'https://firebasestorage.googleapis.com/v0/b/testing-5b157.appspot.com/o/file_example_XLSX_50.xlsx?alt=media&token=9066edc0-c4ca-4107-a99f-27c92debbd6c',
    ),
    uuid: const Uuid().v1(),
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    chatStatus: ChatStatus.SEEN,
    message: '',
    senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    type: ChatMessageType.FILE,
    fileModel: FileModel(
      fileName: 'Flamze NotePad.pdf',
      fileSize: '107 MB',
      fileType: FileType.PDF,
      url:
          'https://firebasestorage.googleapis.com/v0/b/testing-5b157.appspot.com/o/dummy.pdf?alt=media&token=32c2d89b-0852-4a87-9805-62a227335031',
    ),
    uuid: const Uuid().v1(),
  ),
  ChatModel(
    timeStamp: DateTime.now(),
    chatStatus: ChatStatus.SEEN,
    message: '',
    senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
    type: ChatMessageType.FILE,
    fileModel: FileModel(
      fileName: 'Examination',
      fileSize: '137 MB',
      fileType: FileType.UNKNOWN,
      url:
          'https://firebasestorage.googleapis.com/v0/b/testing-5b157.appspot.com/o/Untitled.rtf?alt=media&token=a4ed7c08-1015-4cc9-917f-314acb6abd9d',
    ),
    uuid: const Uuid().v1(),
  ),
];

List<MessageModel> recentMessageList = [
  MessageModel(
    unreadMsgCount: 0,
    lastChat: ChatModel(
      timeStamp: DateTime.now(),
      chatStatus: ChatStatus.SEEN,
      message: "Hope you are doing good ? Oh! Nice. Same here man",
      senderModel: currentUserModel,
      uuid: const Uuid().v1(),
    ),
  ),
  MessageModel(
    unreadMsgCount: 4,
    lastChat: ChatModel(
      timeStamp: DateTime.now(),
      chatStatus: ChatStatus.NewMessage,
      message: "Oh! Nice. Same here man Oh! Nice. Same here man",
      senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
      uuid: const Uuid().v1(),
    ),
  ),
  MessageModel(
    unreadMsgCount: 1,
    lastChat: ChatModel(
      chatStatus: ChatStatus.NewMessage,
      timeStamp: DateTime.now(),
      message: null,
      senderModel: currentUserModel,
      imgList: imgs,
      type: ChatMessageType.PICTURE,
      uuid: const Uuid().v1(),
    ),
  ),
  MessageModel(
    unreadMsgCount: 0,
    lastChat: ChatModel(
      message:
          'Once upon a time there was a young girl called Sarah. https://flutter.dev She was very adventurous and loved to explore the world around her. One day she decided to go on a long walk in the woods. As she was walking, she came across a strange house. She was curious and decided to go in. The door opened with a creak and Sarah stepped inside. The house was empty, but Sarah noticed something strange. On the walls were PICTUREs of different animals. She decided to take one down and it https://youtu.be/o_kjNDMQ9dY turned out to be a PICTURE of a rabbit. Just then, a voice from behind her said, “That’s my rabbit!” Sarah turned around and saw a very old man with a long white beard. He said his name was John and he had been living in the house for many years. ',
      senderModel: currentUserModel,
      uuid: const Uuid().v1(),
      timeStamp: DateTime.now(),
      chatStatus: ChatStatus.SEEN,
    ),
  ),
  MessageModel(
    unreadMsgCount: 0,
    lastChat: ChatModel(
      message: null,
      senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
    ),
      type: ChatMessageType.PICTURE,
      uuid: const Uuid().v1(),
      imgList: [
        'https://images.pexels.com/photos/1024989/pexels-photo-1024989.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
      ],
      timeStamp: DateTime.now(),
      chatStatus: ChatStatus.SENT,
    ),
  ),
  MessageModel(
    unreadMsgCount: 0,
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
  MessageModel(
    unreadMsgCount: 0,
    lastChat: ChatModel(
      message: '',
      senderModel: CurrentUserModel(
      uid: const Uuid().v1(),
      email: faker.internet.email(),
      profilepic: faker.image.image(),
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
  MessageModel(
    unreadMsgCount: 0,
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
  MessageModel(
    unreadMsgCount: 0,
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
  MessageModel(
    unreadMsgCount: 10,
    lastChat: ChatModel(
      message: '',
      senderModel: currentUserModel,
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
