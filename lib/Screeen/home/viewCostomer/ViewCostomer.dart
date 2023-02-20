import 'package:collection_app/repository/model/GetCustomerModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/bloc/CustomerView/customer_view_bloc.dart';

class ViewCostomer extends StatefulWidget {
  const ViewCostomer({Key? key}) : super(key: key);

  @override
  State<ViewCostomer> createState() => _ViewCostomerState();
}

class _ViewCostomerState extends State<ViewCostomer> {
  late GetCustomerModel getCustomerModel;

  void initState() {
    // TODO: implement initState
    BlocProvider.of<CustomerViewBloc>(context).add(FetchCustomerView());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mheight = MediaQuery.of(context).size.height;
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("ViewCustomers"),
      ),
      body: BlocBuilder<CustomerViewBloc, CustomerViewState>(
          builder: (context, state) {
        if (state is CustomerViewLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CustomerViewLoaded) {
          print("state loaded.......");
          // notificationModelClass = BlocProvider.of<NotificationBloc>(context)
          //     .notificationModelClass;
          getCustomerModel =
              BlocProvider.of<CustomerViewBloc>(context).getCustomerModel;

          return Container(
            height: mheight * 9,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (query) {
                      print(query);
                      String q = query;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w600),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    height: mheight * 0.8,
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        _buildPopupDialog(context, index),
                                  );
                                },
                                child: ListTile(
                                  title: Text(
                                    getCustomerModel.data![index].name
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  subtitle: Text(getCustomerModel
                                      .data![index].mobile
                                      .toString()),
                                ),
                              ),
                            ),
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                              thickness: 2,
                            ),
                        itemCount: 15),
                  ),
                ),
              ],
            ),
          );
        }
        if (state is CustomerViewError) {
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

  Widget _buildPopupDialog(BuildContext context, int index) {
    return AlertDialog(
      title: const Text('Customer details'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text("id: "),
              Text(getCustomerModel.data![index].id.toString()),
            ],
          ),
          Row(
            children: [
              Text("name: "),
              Text(getCustomerModel.data![index].name.toString()),
            ],
          ),
          Row(
            children: [
              Text("mobile: "),
              Text(getCustomerModel.data![index].mobile.toString()),
            ],
          ),
          Row(
            children: [
              Text("accountId: "),
              Text(getCustomerModel.data![index].accountId.toString()),
            ],
          ),
          Row(
            children: [
              Text("addedBy: "),
              Text(getCustomerModel.data![index].addedBy.toString()),
            ],
          ),
          Row(
            children: [
              Text("branchId: "),
              Text(getCustomerModel.data![index].branchId.toString()),
            ],
          ),
          Row(
            children: [
              Text("bulidingComanyShop: "),
              Text(getCustomerModel.data![index].bulidingComanyShop.toString()),
            ],
          ),
          Row(
            children: [
              Text("clusterId: "),
              Text(getCustomerModel.data![index].clusterId.toString()),
            ],
          ),
          Row(
            children: [
              Text("collectionAmount: "),
              Text(getCustomerModel.data![index].collectionAmount.toString()),
            ],
          ),
          Row(
            children: [
              Text("collectionDay: "),
              Text(getCustomerModel.data![index].collectionDay.toString()),
            ],
          ),
          Row(
            children: [
              Text("deletedAt: "),
              Text(getCustomerModel.data![index].deletedAt.toString()),
            ],
          ),
          Row(
            children: [
              Text("gardianName: "),
              Text(getCustomerModel.data![index].gardianName.toString()),
            ],
          ),
          Row(
            children: [
              Text("houseName: "),
              Text(getCustomerModel.data![index].houseName.toString()),
            ],
          ),
          Row(
            children: [
              Text("inDate: "),
              Text(getCustomerModel.data![index].inDate.toString()),
            ],
          ),
          Row(
            children: [
              Text("status: "),
              Text(getCustomerModel.data![index].status.toString()),
            ],
          ),
          Row(
            children: [
              Text("schemeId: "),
              Text(getCustomerModel.data![index].schemeId.toString()),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
