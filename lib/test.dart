import 'package:flutter/material.dart';
import 'package:text_editor/text_editor.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> fonts = [
    'Numans',
    'OpenSans',
    'Billabong',
    'GrandHotel',
    'Oswald',
    'Quicksand',
    'BeautifulPeople',
    'BeautyMountains',
    'BiteChocolate',
    'BlackberryJam',
    'BunchBlossoms',
    'CinderelaRegular',
    'Countryside',
    'Halimun',
    'LemonJelly',
    'QuiteMagicalRegular',
    'Tomatoes',
    'TropicalAsianDemoRegular',
    'VeganStyle',
  ];

  TextStyle _textStyle = const TextStyle(
    fontSize: 50,
    color: Colors.white,
    fontFamily: 'Billabong',
  );
  String _text = 'Sample Text';
  TextAlign _textAlign = TextAlign.center;

  void _tapHandler(text, textStyle, textAlign) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {

        return SafeArea(
          child: Container(
            color: Colors.black.withOpacity(0.4),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                top: false,
                child: TextEditor(
                  fonts: fonts,
                  text: text,
                  textStyle: textStyle,
                  textAlingment: textAlign,
                  minFontSize: 10,
                  // paletteColors: [
                  //   Colors.black,
                  //   Colors.white,
                  //   Colors.blue,
                  //   Colors.red,
                  //   Colors.green,
                  //   Colors.yellow,
                  //   Colors.pink,
                  //   Colors.cyanAccent,
                  // ],
                  // decoration: EditorDecoration(
                  //   textBackground: TextBackgroundDecoration(
                  //     disable: Text('Disable'),
                  //     enable: Text('Enable'),
                  //   ),
                  //   doneButton: Icon(Icons.close, color: Colors.white),
                  //   fontFamily: Icon(Icons.title, color: Colors.white),
                  //   colorPalette: Icon(Icons.palette, color: Colors.white),
                  //   alignment: AlignmentDecoration(
                  //     left: Text(
                  //       'left',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //     center: Text(
                  //       'center',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //     right: Text(
                  //       'right',
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                  onEditCompleted: (style, align, text) {
                    setState(() {
                      _text = text;
                      _textStyle = style;
                      _textAlign = align;
                    });
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar() ,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        // top: false,
        child: Center(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  'https://github.com/mehdizarepour/instagram-text-editor/blob/master/example/assets/story.png?raw=true',
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () => _tapHandler(_text, _textStyle, _textAlign),
                  child: Text(
                    _text,
                    style: _textStyle,
                    textAlign: _textAlign,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
