import 'package:collection_app/Screeen/home/Home.dart';
import 'package:collection_app/Screeen/widgets/dropdownpayment.dart';
import 'package:flutter/material.dart';

class Collection extends StatefulWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  @override
  Widget build(BuildContext context) {
    final mheight = MediaQuery.of(context).size.height;
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(50),
        child: Column(
          children: [
            Text(
              "Collection",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Container(
                margin: EdgeInsets.only(top: mheight * .005),
                width: mwidth * .65,
                child: TextFormField(
                  // keyboardType: TextInputType.number,
                  // key: _formFieldKey,
                  //
                  // onChanged: (name) {
                  //   _formFieldKey.currentState!
                  //       .validate();
                  // },
                  // controller: numberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Can\'t be empty';
                    }
                    if (value.length < 10) {
                      return 'Too short';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Customer_id',
                  ),
                )),
            Container(
                margin: EdgeInsets.only(top: mheight * .005),
                width: mwidth * .65,
                child: TextFormField(
                  // keyboardType: TextInputType.number,
                  // key: _formFieldKey,
                  //
                  // onChanged: (name) {
                  //   _formFieldKey.currentState!
                  //       .validate();
                  // },
                  // controller: numberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Can\'t be empty';
                    }
                    if (value.length < 10) {
                      return 'Too short';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Payment',
                  ),
                )),
            Container(
              margin: EdgeInsets.only(top: mheight * .005),
              width: mwidth * .65,
              child: Column(
                children: [
                  // DropdownButtonExample(name: "  route_id", model: dlist.first,),
                  // SizedBox(
                  //   height: mheight * .005,
                  //   width: mwidth * 0.03,
                  // ),
                  // DropdownButtonExample(name: "  scheme_id", model: dlist.first,),
                  // SizedBox(
                  //   height: mheight * .005,
                  //   width: mwidth * 0.03,
                  // ),
                  // DropdownButtonExample(name: "  place_id", model: dlist.first,),
                  // SizedBox(
                  //   height: mheight * .005,
                  //   width: mwidth * 0.03,
                  // ),
                  // DropdownButtonExample(name: "  payment_method", model: dlist.first,),
                  DropdownButtonPayment(name: "route_id", model: dlist.first),
                  DropdownButtonPayment(name: "scheme_id", model: dlist.first),
                  DropdownButtonPayment(name: "payment", model: dlist.first),
                  DropdownButtonPayment(name: "place_id", model: dlist.first),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: mheight * .005),
              width: mwidth * .65,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (ctx) => Home()));
                  },
                  child: Text("Submit")),
            ),
          ],
        ),
      ),
    );
  }
}
