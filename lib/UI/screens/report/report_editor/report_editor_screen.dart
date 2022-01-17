// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:bedayat/UI/screens/report/report_editor/report_editor_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ReportEditorScreen extends StatefulWidget {
  final int childId;

  ReportEditorScreen({Key? key, required this.childId}) : super(key: key);

  @override
  _ReportEditorScreenState createState() => _ReportEditorScreenState();
}

class _ReportEditorScreenState extends State<ReportEditorScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<ReportEditorController>();
  }

  late ReportEditorController reportsEditorController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reportsEditorController =
        Get.put(ReportEditorController(childId: widget.childId));
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
              onPressed: () => reportsEditorController.save(),
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
            label: 'notes'.tr,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex == 1
          ? new FloatingActionButton(
              elevation: 0.0,
              child: FaIcon(FontAwesomeIcons.plus, color: Colors.white),
              backgroundColor: Colors.red,
              onPressed: reportsEditorController.pickupFiles)
          : null,
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
                      controller: reportsEditorController.notes,
                    )
                  ],
                )
              : _selectedIndex == 1
                  ? Obx(
                      () => Column(
                        children: [
                          ...reportsEditorController.attachments.value
                              .map((attachment) => FileItem(
                                    attachment: attachment,
                                    deleteHandler:
                                        reportsEditorController.deleteFiles,
                                  ))
                              .toList()
                        ],
                      ),
                    )
                  : Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///// child mood
                          Text("child_mood_morning".tr, style: headingStyle),
                          ListOfOtions(options: [
                            OptionItem(
                              image: "assets/images/good_mood.png",
                              label: "good".tr,
                              value: "high",
                              isSelected:
                                  reportsEditorController.childMoodMorning ==
                                      "high",
                              selectHandler: reportsEditorController
                                  .changeChildMoodMorning,
                            ),
                            OptionItem(
                              image: "assets/images/medium_mood.png",
                              label: "medium".tr,
                              value: "medium",
                              isSelected:
                                  reportsEditorController.childMoodMorning ==
                                      "medium",
                              selectHandler: reportsEditorController
                                  .changeChildMoodMorning,
                            ),
                            OptionItem(
                              image: "assets/images/bad_mood.png",
                              label: "sad".tr,
                              value: "low",
                              isSelected:
                                  reportsEditorController.childMoodMorning ==
                                      "low",
                              selectHandler: reportsEditorController
                                  .changeChildMoodMorning,
                            ),
                          ]),

                          Text("child_mood_noon".tr, style: headingStyle),
                          ListOfOtions(options: [
                            OptionItem(
                              image: "assets/images/good_mood.png",
                              label: "good".tr,
                              value: "high",
                              isSelected:
                                  reportsEditorController.childMoodNoon ==
                                      "high",
                              selectHandler:
                                  reportsEditorController.changeChildMoodNoon,
                            ),
                            OptionItem(
                              image: "assets/images/medium_mood.png",
                              label: "medium".tr,
                              value: "medium",
                              isSelected:
                                  reportsEditorController.childMoodNoon ==
                                      "medium",
                              selectHandler:
                                  reportsEditorController.changeChildMoodNoon,
                            ),
                            OptionItem(
                              image: "assets/images/bad_mood.png",
                              label: "sad".tr,
                              value: "low",
                              isSelected:
                                  reportsEditorController.childMoodNoon ==
                                      "low",
                              selectHandler:
                                  reportsEditorController.changeChildMoodNoon,
                            ),
                          ]),

                          Text("child_mood_afternoon".tr, style: headingStyle),
                          ListOfOtions(options: [
                            OptionItem(
                              image: "assets/images/good_mood.png",
                              label: "good".tr,
                              value: "high",
                              isSelected:
                                  reportsEditorController.childMoodAfterNoon ==
                                      "high",
                              selectHandler: reportsEditorController
                                  .changeChildMoodAfterNoon,
                            ),
                            OptionItem(
                              image: "assets/images/medium_mood.png",
                              label: "medium".tr,
                              value: "medium",
                              isSelected:
                                  reportsEditorController.childMoodAfterNoon ==
                                      "medium",
                              selectHandler: reportsEditorController
                                  .changeChildMoodAfterNoon,
                            ),
                            OptionItem(
                              image: "assets/images/bad_mood.png",
                              label: "sad".tr,
                              value: "low",
                              isSelected:
                                  reportsEditorController.childMoodAfterNoon ==
                                      "low",
                              selectHandler: reportsEditorController
                                  .changeChildMoodAfterNoon,
                            ),
                          ]),

                          /////////////////////////////////////////////////////

                          ///// food
                          Text("food_status_morning".tr, style: headingStyle),
                          ListOfOtions(options: [
                            OptionItem(
                              image: "assets/images/food_high.png",
                              label: "good".tr,
                              value: "high",
                              isSelected:
                                  reportsEditorController.foodStatusMorning ==
                                      "high",
                              selectHandler: reportsEditorController
                                  .changeFoodStatusMorning,
                            ),
                            OptionItem(
                              image: "assets/images/food_medium.png",
                              label: "medium".tr,
                              value: "medium",
                              isSelected:
                                  reportsEditorController.foodStatusMorning ==
                                      "medium",
                              selectHandler: reportsEditorController
                                  .changeFoodStatusMorning,
                            ),
                            OptionItem(
                              image: "assets/images/food_low.png",
                              label: "low".tr,
                              value: "low",
                              isSelected:
                                  reportsEditorController.foodStatusMorning ==
                                      "low",
                              selectHandler: reportsEditorController
                                  .changeFoodStatusMorning,
                            ),
                          ]),

                          Text("food_status_noon".tr, style: headingStyle),
                          ListOfOtions(options: [
                            OptionItem(
                              image: "assets/images/food_high.png",
                              label: "good".tr,
                              value: "high",
                              isSelected:
                                  reportsEditorController.foodStatusNoon ==
                                      "high",
                              selectHandler:
                                  reportsEditorController.changeFoodStatusNoon,
                            ),
                            OptionItem(
                              image: "assets/images/food_medium.png",
                              label: "medium".tr,
                              value: "medium",
                              isSelected:
                                  reportsEditorController.foodStatusNoon ==
                                      "medium",
                              selectHandler:
                                  reportsEditorController.changeFoodStatusNoon,
                            ),
                            OptionItem(
                              image: "assets/images/food_low.png",
                              label: "low".tr,
                              value: "low",
                              isSelected:
                                  reportsEditorController.foodStatusNoon ==
                                      "low",
                              selectHandler:
                                  reportsEditorController.changeFoodStatusNoon,
                            ),
                          ]),

                          Text("food_status_afternoon".tr, style: headingStyle),
                          ListOfOtions(options: [
                            OptionItem(
                              image: "assets/images/food_high.png",
                              label: "good".tr,
                              value: "high",
                              isSelected:
                                  reportsEditorController.foodStatusAfterNoon ==
                                      "high",
                              selectHandler: reportsEditorController
                                  .changeFoodStatusAfterNoon,
                            ),
                            OptionItem(
                              image: "assets/images/food_medium.png",
                              label: "medium".tr,
                              value: "medium",
                              isSelected:
                                  reportsEditorController.foodStatusAfterNoon ==
                                      "medium",
                              selectHandler: reportsEditorController
                                  .changeFoodStatusAfterNoon,
                            ),
                            OptionItem(
                              image: "assets/images/food_low.png",
                              label: "low".tr,
                              value: "low",
                              isSelected:
                                  reportsEditorController.foodStatusAfterNoon ==
                                      "low",
                              selectHandler: reportsEditorController
                                  .changeFoodStatusAfterNoon,
                            ),
                          ]),

                          /////// drink
                          Text("drink_status".tr, style: headingStyle),
                          ListOfOtions(options: [
                            OptionItem(
                              image: "assets/images/drink_high.png",
                              label: "good".tr,
                              value: "high",
                              isSelected:
                                  reportsEditorController.drinkStatus == "high",
                              selectHandler:
                                  reportsEditorController.changeDrinkStatus,
                            ),
                            // OptionItem(
                            //   image: "assets/images/drink_medium.png",
                            //   label: "medium".tr,
                            //   value: "bad",
                            //   isSelected: false,
                            //   selectHandler: () {},
                            // ),
                            OptionItem(
                              image: "assets/images/drink_low.png",
                              label: "low".tr,
                              value: "low",
                              isSelected:
                                  reportsEditorController.drinkStatus == "low",
                              selectHandler:
                                  reportsEditorController.changeDrinkStatus,
                            ),
                          ]),

                          /////// sleep
                          Text("sleep_status".tr, style: headingStyle),
                          ListOfOtions(options: [
                            OptionItem(
                              image: "assets/images/good_sleep.png",
                              label: "good".tr,
                              value: "high",
                              isSelected:
                                  reportsEditorController.sleepStatus == "high",
                              selectHandler:
                                  reportsEditorController.changeSleepStatus,
                            ),
                            OptionItem(
                              image: "assets/images/bad_sleep.png",
                              label: "low".tr,
                              value: "low",
                              isSelected:
                                  reportsEditorController.sleepStatus == "low",
                              selectHandler:
                                  reportsEditorController.changeSleepStatus,
                            ),
                          ]),

                          Slider(
                            value: reportsEditorController.sleep.value,
                            min: 0,
                            max: 120,
                            onChanged: (newValue) {
                              reportsEditorController.sleep.value = newValue;
                            },
                            label: "${reportsEditorController.sleep.value}",
                            divisions: 24,
                          ),

                          Text("temperature_degree".tr, style: headingStyle),
                          Slider(
                            value: reportsEditorController.temp.value,
                            min: 35,
                            max: 40,
                            onChanged: (newValue) {
                              reportsEditorController.temp.value = newValue;
                            },
                            label: "${reportsEditorController.temp.value}",
                            divisions: 5,
                          ),

                          Text("poe_and_pie".tr, style: headingStyle),
                          SizedBox(
                            height: 15,
                          ),

                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ]),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Image.asset(
                                      "assets/images/shitvector.png"),
                                  title: Row(
                                    children: [
                                      InkWell(
                                          onTap: () => reportsEditorController
                                              .incremnetPoeBy(1),
                                          child: FaIcon(
                                            FontAwesomeIcons.plusCircle,
                                            color: Colors.red,
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${reportsEditorController.poe}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                          onTap: reportsEditorController.poe ==
                                                  0
                                              ? null
                                              : () => reportsEditorController
                                                  .incremnetPoeBy(-1),
                                          child: FaIcon(
                                            FontAwesomeIcons.minusCircle,
                                            color: Colors.red,
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  leading: Image.asset(
                                      "assets/images/yellow_drop.png"),
                                  title: Row(
                                    children: [
                                      InkWell(
                                          onTap: () => reportsEditorController
                                              .incremnetpieBy(1),
                                          child: FaIcon(
                                            FontAwesomeIcons.plusCircle,
                                            color: Colors.red,
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${reportsEditorController.pie}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                          onTap: reportsEditorController.pie ==
                                                  0
                                              ? null
                                              : () => reportsEditorController
                                                  .incremnetpieBy(-1),
                                          child: FaIcon(
                                            FontAwesomeIcons.minusCircle,
                                            color: Colors.red,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          Text("activites".tr, style: headingStyle),
                          SizedBox(
                            height: 15,
                          ),

                          if (reportsEditorController.activites.value.length ==
                              0)
                            Text("Not available at the moment")
                          else
                            ...reportsEditorController.activites.value
                                .map((activity) => CheckboxListTile(
                                      activeColor: Colors.red,
                                      title: Text(activity.arabicTitle),
                                      value: reportsEditorController
                                          .selectedActivites
                                          .contains(activity.id),
                                      onChanged: (newValue) =>
                                          reportsEditorController
                                              .toggleActivites(activity.id),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                    ))
                                .toList(),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}

class FileItem extends StatelessWidget {
  // String name;
  // String type;
  dynamic deleteHandler;
  File attachment;

  FileItem(
      {Key? key,
      // required this.name,
      // required this.type,
      this.deleteHandler,
      required this.attachment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FaIcon(FontAwesomeIcons.file),
      title: Text(attachment.path.split("/").last.split(".").first),
      subtitle: Text(attachment.path.split("/").last.split(".").last),
      trailing: InkWell(
        onTap: () => deleteHandler(attachment),
        child: FaIcon(
          FontAwesomeIcons.trash,
          color: Colors.red,
        ),
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
    return InkWell(
      onTap: () => selectHandler(value),
      child: Container(
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
      ),
    );
  }
}
