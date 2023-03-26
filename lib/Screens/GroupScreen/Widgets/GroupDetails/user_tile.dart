import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/Styles/style.dart';
import 'package:chat_app/Utils/const.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UserGRDetails extends StatelessWidget {
  final int index;
  final void Function() onTap;
  const UserGRDetails({Key key, @required this.index, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: size(context).width / 17,
        backgroundImage: CachedNetworkImageProvider(
          faker.image.image(keywords: ['person', 'headshot'], random: true),
        ),
      ),
      title: Text(
        '${faker.address.person.firstName()} ${faker.address.person.lastName()}',
      ),
      subtitle: index < 5
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(
                    MdiIcons.shieldStar,
                    size: size(context).width / 25,
                    color: Styles.kPrimaryColor,
                  ),
                ),
                Text(
                  'Admin',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade400,
                  ),
                )
              ],
            )
          : Text(
              faker.vehicle.make(),
              style: const TextStyle(color: Colors.grey),
            ),
    );
  }
}
