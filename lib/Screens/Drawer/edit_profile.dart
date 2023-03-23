import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/Utils/const.dart';

import '../../Styles/theme.dart';
import '../../Styles/style.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String dropdownValue = 'Male';
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Profile'),
        elevation: .4,
        shadowColor: Styles.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check,
              color: Styles.kPrimaryColor,
            ),
          ),
          SizedBox(width: size(context).width / 35)
        ],
      ),
      body: ChangeNotifierProvider(
        create: (_) {
          return themeChangeProvider;
        },
        child: Consumer<DarkThemeProvider>(
            builder: (BuildContext context, value, Widget child) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: ListView(
              padding:
                  EdgeInsets.symmetric(horizontal: size(context).width / 20),
              children: [
                SizedBox(height: size(context).width / 17),
                CircleAvatar(
                  radius: size(context).width / 6.4,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: size(context).width / 4.7,
                        bottom: size(context).width / 19,
                      ),
                      decoration: BoxDecoration(
                        color: Styles.black,
                        shape: BoxShape.circle,
                        border: Border.all(color: Styles.subtitleTxt),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(size(context).width / 40),
                        child: Icon(
                          Icons.camera_alt,
                          size: size(context).width / 25,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size(context).width / 13),
                Text(
                  'Your Information',
                  style: TextStyle(
                    fontSize: size(context).width / 20,
                  ),
                ),
                SizedBox(height: size(context).width / 30),
                input(
                    label: 'Username',
                    darkMode: themeChange.darkTheme,
                    bl: false),
                input(
                    label: 'Email Address',
                    darkMode: themeChange.darkTheme,
                    bl: true),
                SizedBox(height: size(context).width / 50),
                Theme(
                  data: ThemeData(
                    primaryColor: Styles.kPrimaryColor,
                    colorScheme:
                        const ColorScheme.light(primary: Styles.kPrimaryColor),
                  ),
                  child: IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: themeChange.darkTheme
                                ? Styles.subtitleTxt
                                : const Color(0x18000000)
                            // color: Styles.subtitleTxt,
                            ),
                      ),
                    ),
                    initialCountryCode: 'NG',
                    onChanged: (phone) {},
                  ),
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: themeChange.darkTheme
                            ? Styles.subtitleTxt
                            : const Color(0x18000000),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        // color: Styles.subtitleTxt,
                        color: themeChange.darkTheme
                            ? Styles.subtitleTxt
                            : const Color.fromARGB(254, 229, 20, 20),
                      ),
                    ),
                  ),
                  dropdownColor:
                      themeChange.darkTheme ? Styles.black : Styles.white,
                  value: dropdownValue,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Male', 'Female', 'Rather not say', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget input({String label, bool darkMode, bl}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size(context).width / 30),
      child: TextField(
        keyboardType:
            bl == true ? TextInputType.emailAddress : TextInputType.name,
        decoration: InputDecoration(
          enabled: true,
          labelText: label,
          labelStyle: TextStyle(
            color: darkMode ? Styles.subtitleTxt : Styles.black38,
            letterSpacing: 1,
          ),
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: darkMode ? Styles.subtitleTxt : const Color(0x18000000),
          )),
        ),
      ),
    );
  }
}
