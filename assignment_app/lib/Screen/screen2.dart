import 'package:assignment_app/Screen/screen3.dart';
import 'package:assignment_app/Screen/screen4.dart';
import 'package:assignment_app/Screen/screen5.dart';
import 'package:assignment_app/constants.dart';
import 'package:assignment_app/main.dart';
import 'package:assignment_app/transaction.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key, this.content, this.index}) : super(key: key);

  final dynamic content;
  final int? index;

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    final SalesData salesData = box.get(int.parse(widget.index.toString()));
    return GestureDetector(
      onTap: (() {
        setState(() {});
      }),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Product Details'),
        ),
        body: Container(
          height: 420,
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(salesData.productname,
                    textAlign: TextAlign.center, style: kBigFontStyle),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Quantity: ${salesData.quantity}\nTotal price: ${salesData.quantity * int.parse(salesData.unitprice)}',
                style: kSmallFontStyle,
              ),
              (widget.content['product_list'][widget.index]['product_variants']
                      .isEmpty)
                  ? const SizedBox(
                      width: 1,
                    )
                  : Text(
                      'Selected Color: ${salesData.colorvariant}\nSelected Size: ${salesData.sizevariant}',
                      style: kSmallFontStyle,
                    ),
              const SizedBox(
                height: 30,
              ),
              (widget.content['product_list'][widget.index]['product_variants']
                      .isEmpty)
                  ? const Text('Single Color')
                  : Center(
                      child: RawMaterialButton(
                        onPressed: (() {
                          setState(() {
                            setState(() {
                              if (salesData.colorvariant != '') {
                                Alert(
                                    context: context,
                                    title: 'You already Selected a Variant',
                                    desc:
                                        'You already selected item Color as ${salesData.colorvariant}',
                                    closeFunction: (() {
                                      Navigator.pop(context);
                                    }),
                                    buttons: [
                                      DialogButton(
                                        onPressed: (() {
                                          Navigator.pop(context);
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                                return Screen3(
                                                  content: widget.content,
                                                  index: widget.index,
                                                );
                                              }),
                                            );
                                          });
                                        }),
                                        child: const Text('Confirm To Change'),
                                      )
                                    ]).show();
                              } else {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return Screen3(
                                        content: widget.content,
                                        index: widget.index,
                                      );
                                    }),
                                  );
                                });
                              }
                            });
                          });
                        }),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: Colors.lightBlueAccent,
                        child: const Text('Select Color'),
                      ),
                    ),
              const SizedBox(
                height: 10,
              ),
              (widget.content['product_list'][widget.index]['product_variants']
                      .isEmpty)
                  ? const Text('Single Size')
                  : Center(
                      child: RawMaterialButton(
                        onPressed: (() {
                          setState(() {
                            if (salesData.sizevariant != '') {
                              Alert(
                                  context: context,
                                  title: 'You already Selected a Variant',
                                  desc:
                                      'You already selected item size as ${salesData.sizevariant}',
                                  closeFunction: (() {
                                    Navigator.pop(context);
                                  }),
                                  buttons: [
                                    DialogButton(
                                      onPressed: (() {
                                        Navigator.pop(context);
                                        setState(() {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                              return Screen4(
                                                content: widget.content,
                                                index: widget.index,
                                              );
                                            }),
                                          );
                                        });
                                      }),
                                      child: const Text('Confirm To Change'),
                                    )
                                  ]).show();
                            } else {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return Screen4(
                                      content: widget.content,
                                      index: widget.index,
                                    );
                                  }),
                                );
                              });
                            }
                          });
                        }),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: Colors.lightBlueAccent,
                        child: const Text('Select Size'),
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: RawMaterialButton(
                  onPressed: (() {
                    if (salesData.quantity == 0) {
                      Alert(
                          context: context,
                          title: 'Quantity Is Zero',
                          desc:
                              'Atleast 1 quantity is must to proceed for checkout',
                          closeFunction: (() {
                            Navigator.pop(context);
                          }),
                          buttons: [
                            DialogButton(
                              onPressed: (() {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              }),
                              child: const Text('Close'),
                            )
                          ]).show();
                    } else {
                      selecteditembox.add(SelectedProduct(
                          quantity: salesData.quantity,
                          productname: salesData.productname,
                          unitprice: salesData.unitprice,
                          colorvariant: (salesData.colorvariant == '')
                              ? 'No Color Available'
                              : salesData.colorvariant,
                          sizevariant: (salesData.sizevariant == '')
                              ? 'No Size Available'
                              : salesData.sizevariant));

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const Screen5();
                        }),
                      );
                    }
                  }),
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.lightBlueAccent,
                  child: const Text('Add And Proceed TO Cart'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
