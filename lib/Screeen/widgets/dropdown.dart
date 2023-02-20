import 'package:collection_app/repository/bloc/id/user_id_bloc.dart';
import 'package:collection_app/repository/model/RouteModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownButtonRoute extends StatefulWidget {
  DropdownButtonRoute({
    super.key,
  });

  @override
  State<DropdownButtonRoute> createState() => _DropdownButtonRouteState();
}

class _DropdownButtonRouteState extends State<DropdownButtonRoute> {
  late RouteModel routeModel;
  String dropValue = 'Select Route';

  @override
  void initState() {
    BlocProvider.of<UserIdBloc>(context).add(FetchRoute());
    dlist.insert(0, Data(id: 0, routeName: 'Select Route'));
    super.initState();
  }

  List<Data> dlist = [
    Data(id: 0, routeName: "Select Route"),
  ];

  @override
  Widget build(BuildContext context) {
    final mheight = MediaQuery.of(context).size.height;
    final mwidth = MediaQuery.of(context).size.width;
    return BlocListener<UserIdBloc, UserIdState>(
      listener: (context, state) {
        routeModel = BlocProvider.of<UserIdBloc>(context).routeModel;
        dlist.addAll(routeModel.data!);
        // TODO: implement listener
      },
      child: BlocBuilder<UserIdBloc, UserIdState>(builder: (context, state) {
        if (state is UserIdLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserIdLoaded) {
          print("state loaded.......");
          // notificationModelClass = BlocProvider.of<NotificationBloc>(context)
          //     .notificationModelClass;
          routeModel = BlocProvider.of<UserIdBloc>(context).routeModel;
          return Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // SizedBox(
                    //   width:5,
                    // ),
                    Text(
                      "route_id",
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
                          id = dlist
                              .where((element) =>
                                  element.routeName!.contains(value!))
                              .toList();
                        });
                      },
                      items: dlist.map<DropdownMenuItem<String>>((valuee) {
                        return DropdownMenuItem<String>(
                          value: valuee.routeName!,
                          child: Text(valuee.routeName!),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        if (state is UserIdError) {
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
      }),
    );
  }
}

// List<String> dlist = <String>['One', 'Two', 'Three', 'Four'];
List<Data> id = [];
