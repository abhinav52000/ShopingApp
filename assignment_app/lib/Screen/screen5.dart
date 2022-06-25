import 'package:assignment_app/Screen/screen1.dart';
import 'package:assignment_app/main.dart';
import 'package:assignment_app/reusablecard.dart';
import 'package:assignment_app/transaction.dart';
import 'package:flutter/material.dart';

class Screen5 extends StatefulWidget {
  const Screen5({Key? key}) : super(key: key);

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Your Cart'),
            const SizedBox(
              width: 120,
            ),
            myButton(
              requiredjob: (() {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const Screeen1();
                  }),
                );
              }),
              icondata: const Text(
                '+',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            myButton(
                requiredjob: (() {
                  Navigator.pop(context);
                }),
                icondata: Column(
                  children: const [
                    Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    Text(
                      'Edit last Entry',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 10),
                    )
                  ],
                )),
          ],
        ),
        leadingWidth: 10,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: selecteditembox.length + 200,
        itemBuilder: ((context, index) {
          try {
            SelectedProduct selectedProduct = selecteditembox.get(index);

            return cardforscreen5(
              productname: selectedProduct.productname,
              itemcount: selectedProduct.quantity,
              colorvariant: selectedProduct.colorvariant,
              sizevariant: selectedProduct.sizevariant,
              totalpayableprice:
                  '${selectedProduct.quantity * double.parse(selectedProduct.unitprice)}',
              requiredjobdelete: (() {
                setState(() {
                  selecteditembox.delete(index);
                });
              }),
            );
          } catch (e) {
            selecteditembox.delete(index);
            return const SizedBox(
              height: 0.0001,
            );
          }
        }),
      ),
    );
  }
}
