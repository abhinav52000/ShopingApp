import 'package:assignment_app/constants.dart';
import 'package:flutter/material.dart';

Widget cardforscreen1(
    {@required String? productname,
    @required String? unitprice,
    int? itemcount,
    @required int? sp,
    Function()? requiredjobhereplus,
    Function()? requiredjobhereminus,
    Function()? cardjob}) {
  return GestureDetector(
    onTap: cardjob,
    child: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      height: 280,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productname.toString(),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'Unit Price: $unitprice',
              ),
              const SizedBox(
                width: 110,
              ),
              SizedBox(
                width: 100,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'SP: $sp',
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
            ],
          ),
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Quantity: $itemcount'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myButton(
                      requiredjob: requiredjobhereminus,
                      icondata: const Text(
                        '-',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    myButton(
                      requiredjob: requiredjobhereplus,
                      icondata: const Text(
                        '+',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget myButton({Function()? requiredjob, Widget? icondata, int? itemcount}) {
  return RawMaterialButton(
    fillColor: Colors.yellow,
    onPressed: requiredjob,
    constraints: const BoxConstraints.tightFor(width: 50, height: 50),
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    child: icondata,
  );
}

Widget cardforscreen5(
    {@required String? productname,
    @required String? totalpayableprice,
    int? itemcount,
    String? colorvariant,
    String? sizevariant,
    Function()? requiredjobdelete}) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(5),
    height: 380,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            productname.toString(),
            style: kBigFontStyle,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Total Price: $totalpayableprice',
          style: kSmallFontStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Quantity: $itemcount',
          style: kSmallFontStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Color: $colorvariant',
          style: kSmallFontStyle,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Size: $sizevariant',
          style: kSmallFontStyle,
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            myButton(
              requiredjob: requiredjobdelete,
              icondata: const Icon(Icons.delete),
            ),
          ],
        ),
      ],
    ),
  );
}
