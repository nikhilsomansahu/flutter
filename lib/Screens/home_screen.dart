import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box friendbox = Hive.box("friends");
  String? name;
  addFriend() async {
    await friendbox.put("name", "chaman");
  }

  getFriend() async {
    setState(() {
      name = friendbox.get("name");
    });
  }

  updateFriend() async {
    await friendbox.put("name", "gautam gambhir");

  }
  deleteFriend() async {
    await friendbox.delete("name");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive DB"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$name"),
            ElevatedButton(onPressed: addFriend, child: Text("Create")),
            ElevatedButton(onPressed: getFriend, child: Text("Read")),
            ElevatedButton(onPressed: updateFriend, child: Text("Update")),
            ElevatedButton(onPressed: deleteFriend, child: Text("Delete")),
          ],
        ),
      ),
    );
  }
}
