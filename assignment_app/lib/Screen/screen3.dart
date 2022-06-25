import 'package:assignment_app/main.dart';
import 'package:assignment_app/transaction.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key, this.content, this.index}) : super(key: key);

  final dynamic content;
  final int? index;

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  bool visibleforcolor = true;
  List<bool> checkcolorvar = [];

  @override
  void initState() {
    checkcolorvar.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (checkcolorvar.isEmpty) {
      checkcolorvar = List.filled(
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
                  'color')
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
                    value: checkcolorvar[index],
                    onChanged: ((value) {
                      setState(() {
                        if (value == true) {
                          salesData.colorvariant =
                              widget.content['product_list'][widget.index]
                                  ['product_variants'][index]['variant_value'];
                          salesData.save();
                        }
                        checkcolorvar = List.filled(
                            widget
                                .content['product_list'][widget.index]
                                    ['product_variants']
                                .length,
                            false);
                        checkcolorvar[index] = value!;
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
