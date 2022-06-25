import 'dart:convert';
import 'package:assignment_app/Screen/screen2.dart';
import 'package:assignment_app/fetchdata.dart';
import 'package:assignment_app/main.dart';
import 'package:assignment_app/reusablecard.dart';
import 'package:assignment_app/transaction.dart';
import 'package:flutter/material.dart';

int currentcard = -1;
late SalesData salesDatatitle;

class Screeen1 extends StatefulWidget {
  const Screeen1({Key? key}) : super(key: key);

  @override
  State<Screeen1> createState() => _Screeen1State();
}

class _Screeen1State extends State<Screeen1> {
  dynamic response1, content;
  List<int> itemcountperproduct = [];

  @override
  void initState() {
    achaadaat();
    itemcountperproduct.clear();
    super.initState();
  }

  // @override
  // void initState() {
  //   achaadaat();
  //   print(response);
  //   super.initState();
  // }

  achaadaat() async {
    response1 = await getdata();
    content = jsonDecode(response1.toString());
    do {
      achaadaat();
      if (itemcountperproduct.isEmpty) {
        itemcountperproduct = List.filled(content['product_list'].length, 0);
      }
      setState(() {});
    } while (content == null);
  }

  @override
  Widget build(BuildContext context) {
    try {
      if (content == null) {
        return const Center(child: CircularProgressIndicator());
      }

      return Scaffold(
        appBar: AppBar(
          leading: null,
          title: (currentcard == -1)
              ? const Text('Shoping App')
              : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const Text('Current Status:  '),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.shopping_cart_sharp),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                          'Quantity: ${salesDatatitle.quantity}\nTotal: ${salesDatatitle.quantity * double.parse(salesDatatitle.unitprice)}')
                    ],
                  ),
                ),
        ),
        body: ListView.builder(
          itemCount: content['product_list'].length,
          itemBuilder: (context, index) {
            if (box.get(index) == null) {
              box.put(
                index,
                SalesData(
                    quantity: itemcountperproduct[index],
                    productname: content['product_list'][index]['name'],
                    unitprice: content['product_list'][index]['unitprice']),
              );
            }
            return cardforscreen1(
              productname: content['product_list'][index]['name'],
              unitprice: content['product_list'][index]['unitprice'],
              sp: content['product_list'][index]['sp'],
              itemcount: itemcountperproduct[index],
              requiredjobhereminus: (() {
                setState(() {
                  (itemcountperproduct[index] > 0)
                      ? --itemcountperproduct[index]
                      : itemcountperproduct[index];
                  currentcard = index;
                  SalesData salesData = box.get(index);
                  salesData.quantity = itemcountperproduct[index];
                  salesData.save;
                  salesDatatitle = box.get(index);
                });
              }),
              requiredjobhereplus: (() {
                setState(() {
                  ++itemcountperproduct[index];
                  currentcard = index;
                  SalesData salesData = box.get(index);
                  salesData.quantity = itemcountperproduct[index];
                  salesData.save;
                  salesDatatitle = box.get(index);
                });
              }),
              cardjob: (() {
                setState(() {
                  currentcard = index;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Screen2(
                      content: content,
                      index: currentcard,
                    );
                  }));
                });
                salesDatatitle = box.get(index);
              }),
            );
          },
        ),
      );
    } catch (e) {
      return Text(e.toString());
    }
  }
}
