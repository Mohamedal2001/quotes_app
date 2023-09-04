import 'package:flutter/material.dart';
import 'package:quotes_app/model/questo_model.dart';
import 'package:quotes_app/widget/cardqu.dart';

class one_page extends StatefulWidget {
  one_page({
    super.key,
  });

  @override
  State<one_page> createState() => _one_pageState();
}

class _one_pageState extends State<one_page> {
  final cont = TextEditingController();
  final cont2 = TextEditingController();
  deletecard(index_card) {
    setState(() {
      list_of_quo.remove(list_of_quo[index_card]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: double.infinity,
                  color: Color.fromARGB(255, 12, 53, 106),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: cont,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 5))),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          controller: cont2,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 5))),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.5,
                          child: GestureDetector(
                            onTap: () {
                              list_of_quo.add(
                                  Questo_model(by: cont2.text, qu: cont.text));
                              cont.clear();
                              cont2.clear();

                              Navigator.pop(context);
                              setState(() {});
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              height: 70,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        backgroundColor: Color.fromARGB(255, 12, 53, 106),
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 53, 106),
        title: Text(
          "qoute App",
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: Color.fromARGB(255, 213, 255, 208),
        child: Column(
          children: [
            Container(
              height: 700,
              child: ListView.builder(
                itemCount: list_of_quo.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: card_qu(
                      card_title: list_of_quo[index].qu,
                      cardby: list_of_quo[index].by,
                      deletecard: deletecard,
                      index_card: index,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
