import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardHistory extends StatelessWidget {
  const CardHistory({Key key, this.item, this.deleteHistory}) : super(key: key);

  final Function deleteHistory;
  final item;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset("${item['flag_from']}"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(
                      "${item['flag_to']}",
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => {deleteHistory(item['id'])},
                child: Icon(
                  Icons.delete,
                  size: 16,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "${item['currency_from']} ",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "/",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    " ${item['currency_to']}",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Text(
                "${item['date']}",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${item['value_from']} ",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              Icon(Icons.arrow_forward),
              Text(
                " ${item['value_to']}",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
