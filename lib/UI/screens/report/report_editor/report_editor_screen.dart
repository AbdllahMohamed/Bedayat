// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ReportEditorScreen extends StatefulWidget {
  const ReportEditorScreen({Key? key}) : super(key: key);

  @override
  _ReportEditorScreenState createState() => _ReportEditorScreenState();
}

class _ReportEditorScreenState extends State<ReportEditorScreen> {
  double temp = 37;
  double sleep = 37;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var headingStyle = TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.save, color: Colors.white),
              onPressed: () => Get.back(),
            ),
          ],
          title: Text("add_report".tr)),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'child_status'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attachment),
            label: 'attachments'.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'notes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: SingleChildScrollView(
          child: _selectedIndex == 2
              ? Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(hintText: "enter notes".tr),
                      minLines:
                          6, // any number you need (It works as the rows for the textarea)
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    )
                  ],
                )
              : _selectedIndex == 1
                  ? Column(
                      children: [FileItem(name: "homework", type: "pdf")],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///// child mood
                        Text("child_mood".tr, style: headingStyle),
                        ListOfOtions(options: [
                          OptionItem(
                            image: "assets/images/good_mood.png",
                            label: "good".tr,
                            value: "bad",
                            isSelected: true,
                            selectHandler: () {},
                          ),
                          OptionItem(
                            image: "assets/images/medium_mood.png",
                            label: "medium".tr,
                            value: "bad",
                            isSelected: false,
                            selectHandler: () {},
                          ),
                          OptionItem(
                            image: "assets/images/bad_mood.png",
                            label: "sad".tr,
                            value: "bad",
                            isSelected: false,
                            selectHandler: () {},
                          ),
                        ]),

                        ///// food
                        Text("food_status".tr, style: headingStyle),
                        ListOfOtions(options: [
                          OptionItem(
                            image: "assets/images/food_high.png",
                            label: "good".tr,
                            value: "bad",
                            isSelected: true,
                            selectHandler: () {},
                          ),
                          OptionItem(
                            image: "assets/images/food_medium.png",
                            label: "medium".tr,
                            value: "bad",
                            isSelected: false,
                            selectHandler: () {},
                          ),
                          OptionItem(
                            image: "assets/images/food_low.png",
                            label: "low".tr,
                            value: "bad",
                            isSelected: false,
                            selectHandler: () {},
                          ),
                        ]),

                        /////// drink
                        Text("drink_status".tr, style: headingStyle),
                        ListOfOtions(options: [
                          OptionItem(
                            image: "assets/images/drink_high.png",
                            label: "good".tr,
                            value: "bad",
                            isSelected: true,
                            selectHandler: () {},
                          ),
                          OptionItem(
                            image: "assets/images/drink_medium.png",
                            label: "medium".tr,
                            value: "bad",
                            isSelected: false,
                            selectHandler: () {},
                          ),
                          OptionItem(
                            image: "assets/images/drink_low.png",
                            label: "low".tr,
                            value: "bad",
                            isSelected: false,
                            selectHandler: () {},
                          ),
                        ]),

                        /////// sleep
                        Text("sleep_status".tr, style: headingStyle),
                        ListOfOtions(options: [
                          OptionItem(
                            image: "assets/images/good_sleep.png",
                            label: "good".tr,
                            value: "bad",
                            isSelected: true,
                            selectHandler: () {},
                          ),
                          OptionItem(
                            image: "assets/images/bad_sleep.png",
                            label: "medium".tr,
                            value: "bad",
                            isSelected: false,
                            selectHandler: () {},
                          ),
                        ]),

                        Slider(
                          value: sleep,
                          min: 0,
                          max: 120,
                          onChanged: (newValue) {
                            setState(() {
                              sleep = newValue;
                            });
                          },
                          label: "$sleep",
                          divisions: 24,
                        ),

                        Text("temperature_degree".tr, style: headingStyle),
                        Slider(
                          value: temp,
                          min: 35,
                          max: 40,
                          onChanged: (newValue) {
                            setState(() {
                              temp = newValue;
                            });
                          },
                          label: "$temp",
                          divisions: 5,
                        ),

                        Text("activites".tr, style: headingStyle),
                      ],
                    ),
        ),
      ),
    );
  }
}

class FileItem extends StatelessWidget {
  String name;
  String type;
  dynamic deleteHandler;

  FileItem(
      {Key? key, required this.name, required this.type, this.deleteHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FaIcon(FontAwesomeIcons.file),
      title: Text(name),
      subtitle: Text(type),
      trailing: FaIcon(
        FontAwesomeIcons.trash,
        color: Colors.red,
      ),
    );
  }
}

class ListOfOtions extends StatelessWidget {
  List options;
  ListOfOtions({Key? key, required this.options}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [...options],
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  String image;
  String label;
  String value;
  bool isSelected;
  dynamic selectHandler;

  OptionItem(
      {Key? key,
      required this.image,
      required this.label,
      required this.value,
      required this.isSelected,
      this.selectHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          border: Border.all(
              color: isSelected ? Colors.red : Colors.white, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 80,
          ),
          Text(
            label,
            style: TextStyle(color: Colors.black, fontSize: 20),
          )
        ],
      ),
    );
  }
}
