import 'package:collection_app/repository/bloc/Schem/scheme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/model/SchemeModel.dart';

class DropdownButtonScheme extends StatefulWidget {
  DropdownButtonScheme({
    super.key,
  });

  @override
  State<DropdownButtonScheme> createState() => _DropdownButtonSchemeState();
}

class _DropdownButtonSchemeState extends State<DropdownButtonScheme> {
  late SchemeModel schemeModel;
  String dropValue = 'Select Scheme';

  @override
  void initState() {
    BlocProvider.of<SchemeBloc>(context).add(FetchScheme());
    // widget.dropItems.insert(0, Data(id: 0,name: 'Select Scheme'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mheight = MediaQuery.of(context).size.height;
    final mwidth = MediaQuery.of(context).size.width;
    return BlocBuilder<SchemeBloc, SchemeState>(
      builder: (context, state) {
        if (state is SchemeLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SchemeLoaded) {
          print("state loaded.......");
          schemeModel = BlocProvider.of<SchemeBloc>(context).schemeeModel;
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
                    Text(
                      "Scheme",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    // SizedBox(
                    //   width: mwidth*0.3,
                    // ),
                    DropdownButton<String>(
                      value: dropValue,
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
                          dropValue = value!;
                          id = schemeModel.data!
                              .where(
                                  (element) => element.name!.contains(value!))
                              .toList();
                        });
                      },
                      items: schemeModel.data!
                          .map<DropdownMenuItem<String>>((valuee) {
                        return DropdownMenuItem<String>(
                          value: valuee.name!,
                          child: Text(valuee.name!),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        if (state is SchemeError) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * .9,
              // color: Colors.red,
              child: Center(
                child: Text("something went wrong"),
              ),
            ),
          );
        }
        return Center(
          child: Text("no response"),
        );
      },
    );
  }
}

List<String> dlist = <String>['One', 'Two', 'Three', 'Four'];
List<Data> id = [];
