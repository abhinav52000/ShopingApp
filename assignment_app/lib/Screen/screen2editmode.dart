// import 'package:assignment_app/Screen/screen1.dart';
// import 'package:assignment_app/Screen/screen3.dart';
// import 'package:assignment_app/Screen/screen4.dart';
// import 'package:assignment_app/Screen/screen5.dart';
// import 'package:assignment_app/constants.dart';
// import 'package:assignment_app/main.dart';
// import 'package:assignment_app/transaction.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

// class Scereen2edit extends StatefulWidget {
//   const Scereen2edit({Key? key, required this.index}) : super(key: key);

//   final int index;

//   @override
//   State<Scereen2edit> createState() => _Scereen2editState();
// }

// class _Scereen2editState extends State<Scereen2edit> {
//   @override
//   Widget build(BuildContext context) {
//     // int index = Provider.of<DataProvider>(context).index;
//     dynamic content = Provider.of<DataProvider>(context).content;
//     int index = 0;

//     final SalesData salesData = box.get(int.parse(index.toString()));

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product Details'),
//       ),
//       body: Container(
//         height: 420,
//         width: double.infinity,
//         margin: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             border: Border.all(color: Colors.black, width: 2),
//             borderRadius: BorderRadius.circular(10)),
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Text(salesData.productname,
//                   textAlign: TextAlign.center, style: kBigFontStyle),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Text(
//               'Quantity: ${salesData.quantity}\nTotal price: ${salesData.quantity * int.parse(salesData.unitprice)}',
//               style: kSmallFontStyle,
//             ),
//             Text(
//               'Selected Color: ${salesData.colorvariant}\nSelected Size: ${salesData.sizevariant}',
//               style: kSmallFontStyle,
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Center(
//               child: RawMaterialButton(
//                 onPressed: (() {
//                   setState(() {
//                     setState(() {
//                       if (salesData.colorvariant != '') {
//                         Alert(
//                             context: context,
//                             title: 'You already Selected a Variant',
//                             desc:
//                                 'You already selected item Color as ${salesData.colorvariant}',
//                             closeFunction: (() {
//                               Navigator.pop(context);
//                             }),
//                             buttons: [
//                               DialogButton(
//                                 onPressed: (() {
//                                   Navigator.pop(context);
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(builder: (context) {
//                                       return Screen3(
//                                         content: content,
//                                         index: widget.index,
//                                       );
//                                     }),
//                                   );
//                                 }),
//                                 child: const Text('Confirm To Change'),
//                               )
//                             ]).show();
//                       } else {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) {
//                             return Screen3(
//                               content: content,
//                               index: widget.index,
//                             );
//                           }),
//                         );
//                       }
//                     });
//                   });
//                 }),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 fillColor: Colors.lightBlueAccent,
//                 child: const Text('Select Color'),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             (content['product_list'][widget.index]['product_variants'].isEmpty)
//                 ? const Text('Single Size')
//                 : Center(
//                     child: RawMaterialButton(
//                       onPressed: (() {
//                         setState(() {
//                           if (salesData.sizevariant != '') {
//                             Alert(
//                                 context: context,
//                                 title: 'You already Selected a Variant',
//                                 desc:
//                                     'You already selected item size as ${salesData.sizevariant}',
//                                 closeFunction: (() {
//                                   Navigator.pop(context);
//                                 }),
//                                 buttons: [
//                                   DialogButton(
//                                     onPressed: (() {
//                                       Navigator.pop(context);
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(builder: (context) {
//                                           return Screen4(
//                                             index: widget.index,
//                                           );
//                                         }),
//                                       );
//                                     }),
//                                     child: const Text('Confirm To Change'),
//                                   )
//                                 ]).show();
//                           } else {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) {
//                                 return Screen4(
//                                   index: widget.index,
//                                 );
//                               }),
//                             );
//                           }
//                         });
//                       }),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       fillColor: Colors.lightBlueAccent,
//                       child: const Text('Select Size'),
//                     ),
//                   ),
//             const SizedBox(
//               height: 20,
//             ),
//             Center(
//               child: RawMaterialButton(
//                 onPressed: (() {
//                   if (salesData.quantity == 0) {
//                     Alert(
//                         context: context,
//                         title: 'Quantity Is Zero',
//                         desc:
//                             'Atleast 1 quantity is must to proceed for checkout',
//                         closeFunction: (() {
//                           Navigator.pop(context);
//                         }),
//                         buttons: [
//                           DialogButton(
//                             onPressed: (() {
//                               Navigator.pop(context);
//                               Navigator.pop(context);
//                             }),
//                             child: const Text('Close'),
//                           )
//                         ]).show();
//                   } else {
//                     selecteditembox.add(SelectedProduct(
//                         quantity: salesData.quantity,
//                         productname: salesData.productname,
//                         unitprice: salesData.unitprice,
//                         colorvariant: (salesData.colorvariant == '')
//                             ? 'No Color Available'
//                             : salesData.colorvariant,
//                         sizevariant: (salesData.sizevariant == '')
//                             ? 'No Size Available'
//                             : salesData.sizevariant));

//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) {
//                         return const Screen5();
//                       }),
//                     );
//                   }
//                 }),
//                 padding: const EdgeInsets.all(10),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//                 fillColor: Colors.lightBlueAccent,
//                 child: const Text('Add And Proceed TO Cart'),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//     ;
//   }
// }
