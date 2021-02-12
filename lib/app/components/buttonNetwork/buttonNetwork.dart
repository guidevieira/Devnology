import 'package:flutter/material.dart';

class ButtonNetwork extends StatelessWidget {
  const ButtonNetwork({
    Key key,
    @required this.fontColor,
    this.img,
    this.title,
  }) : super(key: key);

  final Color fontColor;
  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () => {/*actions*/},
        child: Ink(
          color: fontColor,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Image.network(img, height: 30),
                SizedBox(width: 60),
                Text(
                  title,
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
