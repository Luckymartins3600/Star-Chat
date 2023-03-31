// ignore_for_file: constant_identifier_names

enum ChatMessageType { TEXT, AUDIO, PICTURE, VIDEO, FILE, STATUS_REPLY }

enum FileType { APK, TXT, ZIP, PDF, XLS, UNKNOWN }

enum VideoType { NETWORK, YOUTUBE }

enum MessageStatus {
  TYPING,
  SENDINGFILE,
  SENDINGVIDEO,
  SENDINGAUDIO,
  SENDINGIMAGE,
  NONE,
}

enum ChatStatus { SENT, SEEN, DILIVERED, NewMessage }

enum GroupRole { ADMIN, STANDARD, EDITOR, MANAGER }

enum StoryType { IMAGE, TEXT }
