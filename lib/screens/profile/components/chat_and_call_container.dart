import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ride_share/utils/constants/colors.dart';


class ChatAndCallContainer extends StatelessWidget {
  const ChatAndCallContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 200,
      child: Container(
        width: MediaQuery.of(context).size.width * .6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).colorScheme.secondaryContainer,
          shape: BoxShape.rectangle
        ),
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .2,
            right: MediaQuery.of(context).size.width * .2,
            top: MediaQuery.of(context).size.height * .09),
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(LineIcons.comments, color: kIconSecondaryColor),
                  SizedBox(width: 8.0),
                  Text('Chat', style: Theme.of(context).textTheme.labelMedium,),
                ],
              ),
            ),
            VerticalDivider(
              // color: kIconSecondaryColor,
              // thickness: 2.0,
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(LineIcons.phone, color: kIconSecondaryColor),
                  SizedBox(width: 8.0),
                  Text('Call', style: Theme.of(context).textTheme.labelMedium,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
