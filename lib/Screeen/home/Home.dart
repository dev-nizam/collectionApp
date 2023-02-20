import 'package:collection_app/Screeen/home/collection/Collection.dart';
import 'package:collection_app/Screeen/home/customer%20registration/Customer%20registration.dart';
import 'package:collection_app/Screeen/home/viewCostomer/ViewCostomer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final mheight = MediaQuery.of(context).size.height;
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Collection app"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        height: mheight * 9,
        width: mwidth * 9,
        child: Column(
          children: [
            SizedBox(
              height: mheight * 0.03,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => Registration()));
                  },
                  child: Container(
                    height: mheight * 0.26,
                    width: mwidth * 0.46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.app_registration,
                          size: 70,
                        ),
                        Text(
                          "Costomer Registration",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight * 0.03,
                  width: mwidth * 0.039,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => ViewCostomer()));
                  },
                  child: Container(
                    height: mheight * 0.26,
                    width: mwidth * 0.46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_tree_outlined,
                          size: 70,
                        ),
                        Text(
                          "View Costomer ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mheight * 0.03,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => Collection()));
                  },
                  child: Container(
                    height: mheight * 0.26,
                    width: mwidth * 0.46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.money,
                          size: 70,
                        ),
                        Text(
                          "Get Collection  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: mheight * 0.03,
                  width: mwidth * 0.039,
                ),
                Container(
                  height: mheight * 0.26,
                  width: mwidth * 0.46,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.receipt,
                        size: 70,
                      ),
                      Text(
                        "Received Collection ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
