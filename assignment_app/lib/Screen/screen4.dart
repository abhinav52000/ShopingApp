import 'package:assignment_app/main.dart';
import 'package:assignment_app/transaction.dart';
import 'package:flutter/material.dart';

class Screen4 extends StatefulWidget {
  const Screen4({Key? key, this.content, this.index}) : super(key: key);

  final dynamic content;
  final int? index;

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  bool visibleforcolor = true;
  List<bool> checksizevar = [];

  @override
  void initState() {
    checksizevar.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (checksizevar.isEmpty) {
      checksizevar = List.filled(
          widget
              .content['product_list'][widget.index]['product_variants'].length,
          false);
    }
    return Scaffold(
      body: ListView.builder(
        itemCount: widget
            .content['product_list'][widget.index]['product_variants'].length,
        itemBuilder: ((itemBuilder, index) {
          visibleforcolor = (widget.content['product_list'][widget.index]
                      ['product_variants'][index]['variant_type'] ==
                  'size')
              ? true
              : false;
          SalesData salesData = box.get(widget.index);
          return Visibility(
            visible: visibleforcolor,
            child: Container(
              height: 75,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.content['product_list'][widget.index]
                        ['product_variants'][index]['variant_value'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Checkbox(
                    value: checksizevar[index],
                    onChanged: ((value) {
                      setState(() {
                        if (value == true) {
                          salesData.sizevariant = widget.content['product_list']
                                  [widget.index]['product_variants'][index]
                              ['variant_value'];
                          salesData.save();
                        }
                        checksizevar = List.filled(
                            widget
                                .content['product_list'][widget.index]
                                    ['product_variants']
                                .length,
                            false);
                        checksizevar[index] = value!;
                      });
                    }),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
