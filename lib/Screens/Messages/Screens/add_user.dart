import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Model/current_user.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:chat_app/widgets/appbar_underline.dart';
import 'package:chat_app/widgets/back_button.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddUserScreen extends StatefulWidget {
  final bool isDark;
  const AddUserScreen({Key key, @required this.isDark}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  bool loading = false;
  TextEditingController searchController = TextEditingController();
  List<CurrentUserModel> users = [];
  bool searched = false, added = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonCB(),
        centerTitle: true,
        systemOverlayStyle: defaultTransparentAppBar(
            bottom: widget.isDark ? Colors.black : Colors.white),
        title: const Text('Add Contact'),
        bottom: appBarUnderLine(context: context, isDark: widget.isDark),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(size(context).width / 12),
            child: TextField(
              controller: searchController,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) => onSearch(),
              decoration: InputDecoration(
                enabled: true,
                labelText: ' Email Address',
                labelStyle: TextStyle(
                  color: widget.isDark ? Styles.subtitleTxt : Styles.black38,
                  letterSpacing: 1,
                ),
                border: outlineInputBorder(),
                enabledBorder: outlineInputBorder(),
              ),
            ),
          ),
          CupertinoButton(
            padding:
                EdgeInsets.symmetric(horizontal: size(context).width / 6.5),
            onPressed: () => onSearch(),
            color: Styles.kPrimaryColor,
            child: const Text(
              'Search',
              style: TextStyle(letterSpacing: .5),
            ),
          ),
          SizedBox(height: size(context).width / 30),
          searched
              ? users.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: size(context).width / 20),
                      itemCount: users.length,
                      itemBuilder: (context, i) {
                        CurrentUserModel details =
                            CurrentUserModel.fromMap(users[i].toMap());
                        return ListTile(
                          leading: CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(
                                  details.profilepic)),
                          trailing: IconButton(
                            onPressed: () => setState(() => added = !added),
                            icon: Icon(
                              added
                                  ? Icons.message_rounded
                                  : Icons.group_add_rounded,
                              color: widget.isDark ? Colors.white : Colors.red,
                            ),
                          ),
                          title: Text(details.username),
                          subtitle: Text(
                            details.email,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        );
                      },
                    ))
                  : Padding(
                      padding: EdgeInsets.all(size(context).width / 10),
                      child: Column(
                        children: [
                          Text('No matches for', style: style()),
                          SizedBox(height: size(context).width / 60),
                          Text('" ${searchController.text.trim()} "',
                              style: style()),
                        ],
                      ),
                    )
              : const SizedBox()
        ],
      ),
    );
  }

  onSearch() async {
    String text = searchController.text.trim().toLowerCase();
    FocusManager.instance.primaryFocus.unfocus();
    setState(() => searched = true);
    if (searchController.text.trim().isNotEmpty) {
      setState(() {
        users = emails
            .where((element) => element.email.toLowerCase() == text)
            .toList();
      });
    }

    print('Done: result: ${users.length} users}');
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(size(context).width / 40),
      borderSide: BorderSide(
        color: widget.isDark ? Styles.subtitleTxt : const Color(0x18000000),
      ),
    );
  }

  BoxDecoration decoration() {
    return BoxDecoration(
      color: Styles.kPrimaryColor,
      borderRadius: BorderRadius.circular(size(context).width / 40),
    );
  }

  List<CurrentUserModel> emails = List.generate(
    10,
    (index) => CurrentUserModel(
      email: index == 3 ? 'luckymartins360@gmail.com' : faker.internet.email(),
      profilepic: faker.image.image(),
      uid: const Uuid().v1(),
      username: faker.internet.userName(),
    ),
  );
  TextStyle style() =>
      TextStyle(color: Colors.grey.shade500, letterSpacing: .8);
}
