import 'package:flutter/material.dart';

class card_qu extends StatelessWidget {
  String card_title;
  String cardby;
  Function deletecard;
  int index_card;

  card_qu(
      {required this.card_title,
      required this.cardby,
      required this.deletecard,
      required this.index_card});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 20, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              card_title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: GestureDetector(
                    onTap: () {
                      print(index_card);
                      deletecard(index_card);
                    },
                    child: Icon(
                      Icons.delete,
                      size: 40,
                    ),
                  ),
                ),
                Text(
                  "by: ${cardby}",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 39, 158, 255),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
        height: 150,
      ),
    );
  }
}
