import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ChildrenListScreen extends StatefulWidget {
  const ChildrenListScreen({Key? key}) : super(key: key);

  @override
  _ChildrenListScreenState createState() => _ChildrenListScreenState();
}

class _ChildrenListScreenState extends State<ChildrenListScreen> {
  @override
  Widget build(BuildContext context) {
    var headingStyle = TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back, color: Colors.white),
          //   onPressed: () {},
          // ),
          actions: [
            IconButton(
              icon: FaIcon(FontAwesomeIcons.filter, color: Colors.white),
              onPressed: () {},
            ),
          ], title: Text("children_list".tr)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("children".tr, style: headingStyle),
            ChildItem(),
            ChildItem(),
          ],
        ),
      ),
    );
  }
}

class ChildItem extends StatelessWidget {
  const ChildItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: ListTile(
        // trailing: Text("test"),
        leading: CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(
              "https://childdevelopment.com.au/wp-content/uploads/what-is-child-development.jpg"),
          backgroundColor: Colors.transparent,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("child_name".tr),
            // Text("last_update".tr),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "report_status" + "completed".tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
