import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'local_databae_provider.dart';

class TestLocalDatabase extends StatefulWidget {
  static const String route = "/TestLocalDatabase";

  const TestLocalDatabase({Key? key}) : super(key: key);

  @override
  State<TestLocalDatabase> createState() => _TestLocalDatabaseState();
}

class _TestLocalDatabaseState extends State<TestLocalDatabase> {
  @override
  void initState() {
    context.read<LocalDatabaseProvider>().getListOfUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalDatabaseProvider>(
        builder: (context, localDatabaseProvider, __) {
      return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            // ElevatedButton(
            //     onPressed: () async {
            //       int status = await appDataBase.insertUser(
            //           const UserTableCompanion(name: drift.Value("abdullaha")));
            //
            //       print("status $status");
            //
            //       // await localDatabaseHelper.insert(
            //       //     {'title': 'Task 1', 'description': 'Description 1'});
            //     },
            //     child: const Center(
            //       child: Text("Insert User"),
            //     )),
            // const SizedBox(
            //   height: 70,
            // ),
            // ElevatedButton(
            //     onPressed: () async {
            //       userTableList = await appDataBase.getAllUsers();
            //
            //       print("status ${userTableList.toList()}");
            //
            //       // await localDatabaseHelper.insert(
            //       //     {'title': 'Task 1', 'description': 'Description 1'});
            //     },
            //     child: const Center(
            //       child: Text("Get Users"),
            //     )),
            // ElevatedButton(
            //     onPressed: () async {
            //       UserTableData? usetableData =
            //           await appDataBase.getIndividualUsers(4);
            //
            //       print("status ${usetableData.toString()}");
            //
            //       // await localDatabaseHelper.insert(
            //       //     {'title': 'Task 1', 'description': 'Description 1'});
            //     },
            //     child: const Center(
            //       child: Text("Get Users"),
            //     )),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              child: ListView.builder(
                  itemCount: localDatabaseProvider.userTableList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    final item = localDatabaseProvider.userTableList[index];

                    return ListTile(
                      tileColor: Colors.green,
                      title: Text(
                        item.name,
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(
                        "ID: ${item.id}",
                        style: TextStyle(color: Colors.black),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Implement edit functionality here
                              // You can open a dialog or navigate to an edit screen.
                              // Example: navigate to EditItemScreen(item: item)
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Implement delete functionality here
                              // You can show a confirmation dialog and remove the item.
                              // Example: showDeleteConfirmationDialog(item);
                              setState(() {
                                //items.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      );
    });
  }
}
