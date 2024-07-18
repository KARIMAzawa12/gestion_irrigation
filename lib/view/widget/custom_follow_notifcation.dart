import '../../constans/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'custom_button.dart';

class CustomFollowNotifcation extends StatefulWidget {
  const CustomFollowNotifcation({Key? key}) : super(key: key);

  @override
  State<CustomFollowNotifcation> createState() =>
      _CustomFollowNotifcationState();
}

class _CustomFollowNotifcationState extends State<CustomFollowNotifcation> {
  bool follow = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: const AssetImage("assets/images/Avatar.png"),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Dean Winchester",
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: mainText),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "New following you  .  h1",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: SecondaryText),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: follow == false ? 50 : 30),
            child: CustomButton(
              height: 40,
              color: follow == false ? primary : form,
              textColor: follow == false ? Colors.white : mainText,
              onTap: () {
                setState(() {
                  follow = !follow;
                });
              },
              text: "Follow",
            ),
          ),
        ),
      ],
    );
  }
}
