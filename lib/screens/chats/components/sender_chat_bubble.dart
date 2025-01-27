import 'package:flutter/material.dart';
import 'package:ride_share/utils/constants/colors.dart';

class SenderChatBubble extends StatelessWidget {
  const SenderChatBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * .04,
          maxWidth: MediaQuery.of(context).size.width * .6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
            topLeft: Radius.circular(8.0),
          ),
          color: kPrimaryColor,
        ),
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt, repellendus eaque provident soluta quibusdam quae. Earum autem molestias repellendus harum distinctio voluptatum architecto impedit commodi reiciendis. Ab hic quae vitae.',
          style: TextStyle(
            color: kTextLightColor,
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
