import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SendMessageWidget extends StatelessWidget {
  const SendMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: textInputField(context),
          ),
        )
      ],
    );
  }

  TextFormField textInputField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        filled: true,
        hintText: 'Message ...',
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        suffixIcon: IconButton(
          tooltip: 'Send message',
          onPressed: () {},
          icon: Icon(LineIcons.arrowCircleUp),
        ),
      ),
    );
  }
}
