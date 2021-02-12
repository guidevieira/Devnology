import 'package:flutter/material.dart';

class Or extends StatelessWidget {
  const Or({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Text("OR"),
        ),
        Expanded(
          child: Divider(
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
