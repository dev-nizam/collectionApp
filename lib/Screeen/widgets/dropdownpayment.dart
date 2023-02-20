import 'package:flutter/material.dart';

class DropdownButtonPayment extends StatefulWidget {
  DropdownButtonPayment({super.key, required this.name, required this.model});

  String name;
  String model;

  @override
  State<DropdownButtonPayment> createState() => _DropdownButtonPaymentState();
}

class _DropdownButtonPaymentState extends State<DropdownButtonPayment> {
  @override
  Widget build(BuildContext context) {
    final mheight = MediaQuery.of(context).size.height;
    final mwidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(
              //   width:5,
              // ),
              Text(widget.name),
              // SizedBox(
              //   width: mwidth*0.3,
              // ),
              DropdownButton<String>(
                value: widget.model,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    widget.model = value!;
                  });
                },
                items: dlist.map<DropdownMenuItem<String>>((String valuee) {
                  return DropdownMenuItem<String>(
                    value: valuee,
                    child: Text(valuee),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

List<String> dlist = <String>['One', 'Two', 'Three', 'Four'];

// class DropdownButtonPayment extends StatefulWidget {
//   DropdownButtonPayment({super.key, required this.name,required this.dropItems});
//   String name;
//   List<String> dropItems;
//   @override
//   State<DropdownButtonPayment> createState() => _DropdownButtonPaymentState();
// }
//
// class _DropdownButtonPaymentState extends State<DropdownButtonPayment> {
//   String dropValue= 'Select Scheme';
//   @override
//
//   @override
//   Widget build(BuildContext context) {
//
//     final mheight =MediaQuery.of(context).size.height;
//     final mwidth =MediaQuery.of(context).size.width;
//     return Container(
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),borderRadius: BorderRadius.all(Radius.circular(5))
//       ),
//       child: Column(
//         children: [
//           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // SizedBox(
//               //   width:5,
//               // ),
//               Text(widget.name,style: TextStyle(color: Colors.grey[700] ),),
//               // SizedBox(
//               //   width: mwidth*0.3,
//               // ),
//               DropdownButton<String>(
//                 value: dropValue,
//                 icon: const Icon(Icons.arrow_downward),
//                 elevation: 16,
//                 style: const TextStyle(color: Colors.deepPurple),
//                 underline: Container(
//                   height: 2,
//                   color: Colors.deepPurpleAccent,
//                 ),
//                 onChanged: (String? value) {
//                   // This is called when the user selects an item.
//                   setState(() {
//                     dropValue = value!;
//                     id= widget.dropItems.where((element) => element.dlist!.contains(value!)).toList();
//                   });
//                 },
//                 items: widget.dropItems.map<DropdownMenuItem<String>>(( valuee) {
//                   return DropdownMenuItem<String>(
//                     value: valuee.dlist!,
//                     child: Text(valuee.dlist!),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//
//         ],
//       ),
//     );
//   }
//
// }
// List<String> dlist = <String>['CASH', 'UPI', ];
// List<String> id=[];
