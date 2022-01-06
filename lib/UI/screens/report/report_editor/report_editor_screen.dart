// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:bedayat/UI/screens/report/report_editor/report_editor_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ReportEditorScreen extends StatefulWidget {
  const ReportEditorScreen({Key? key}) : super(key: key);

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

  ReportEditorController reportsEditorController =
      Get.put(ReportEditorController());

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
                          Text("child_mood".tr, style: headingStyle),
                          ListOfOtions(options: [
                            OptionItem(
                              image: "assets/images/good_mood.png",
                              label: "good".tr,
                              value: "high",
                              isSelected:
                                  reportsEditorController.childMood == "high",
                              selectHandler:
                                  reportsEditorController.changeChildMood,
                            ),
                            OptionItem(
                              image: "assets/images/medium_mood.png",
                              label: "medium".tr,
                              value: "medium",
                              isSelected:
                                  reportsEditorController.childMood == "medium",
                              selectHandler:
                                  reportsEditorController.changeChildMood,
                            ),
                            OptionItem(
                              image: "assets/images/bad_mood.png",
                              label: "sad".tr,
                              value: "low",
                              isSelected:
                                  reportsEditorController.childMood == "low",
                              selectHandler:
                                  reportsEditorController.changeChildMood,
                            ),
                          ]),

                          ///// food
                          Text("food_status".tr, style: headingStyle),
                          ListOfOtions(options: [
                            OptionItem(
                              image: "assets/images/food_high.png",
                              label: "good".tr,
                              value: "high",
                              isSelected:
                                  reportsEditorController.foodStatus == "high",
                              selectHandler:
                                  reportsEditorController.changeFoodStatus,
                            ),
                            OptionItem(
                              image: "assets/images/food_medium.png",
                              label: "medium".tr,
                              value: "medium",
                              isSelected: reportsEditorController.foodStatus ==
                                  "medium",
                              selectHandler:
                                  reportsEditorController.changeFoodStatus,
                            ),
                            OptionItem(
                              image: "assets/images/food_low.png",
                              label: "low".tr,
                              value: "low",
                              isSelected:
                                  reportsEditorController.foodStatus == "low",
                              selectHandler:
                                  reportsEditorController.changeFoodStatus,
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

                          Text("activites".tr, style: headingStyle),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("enjoy_with_morning_activity".tr),
                            value: reportsEditorController
                                .enjoy_with_morning_activity.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_enjoy_with_morning_activity(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("love_sharing_with_friends".tr),
                            value: reportsEditorController
                                .love_sharing_with_friends.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_love_sharing_with_friends(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("say_welcome".tr),
                            value: reportsEditorController.say_welcome.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_say_welcome(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("enjoy_with_halqa".tr),
                            value:
                                reportsEditorController.enjoy_with_halqa.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_enjoy_with_halqa(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("say_wehda".tr),
                            value: reportsEditorController.say_wehda.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_say_wehda(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("listening_to_quran".tr),
                            value: reportsEditorController
                                .listening_to_quran.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_listening_to_quran(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("repeat_ayat".tr),
                            value: reportsEditorController.repeat_ayat.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_repeat_ayat(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("new_letter".tr),
                            value: reportsEditorController.new_letter.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_new_letter(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("know_the_letter".tr),
                            value:
                                reportsEditorController.know_the_letter.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_know_the_letter(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("know_the_letter_sound".tr),
                            value: reportsEditorController
                                .know_the_letter_sound.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_know_the_letter_sound(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("mastered_write_letter".tr),
                            value: reportsEditorController
                                .mastered_write_letter.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_mastered_write_letter(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("enjoy_with_arkan".tr),
                            value:
                                reportsEditorController.enjoy_with_arkan.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_enjoy_with_arkan(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("orgnize_after_play".tr),
                            value: reportsEditorController
                                .orgnize_after_play.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_orgnize_after_play(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("mastered_the_activity".tr),
                            value: reportsEditorController
                                .mastered_the_activity.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_mastered_the_activity(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("enjoy_with_art_activity".tr),
                            value: reportsEditorController
                                .enjoy_with_art_activity.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_enjoy_with_art_activity(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("help_himself_in_art_activity".tr),
                            value: reportsEditorController
                                .help_himself_in_art_activity.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_help_himself_in_art_activity(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),

                          CheckboxListTile(
                            activeColor: Colors.red,
                            title: Text("enjoy_with_the_story".tr),
                            value: reportsEditorController
                                .enjoy_with_the_story.value,
                            onChanged: (newValue) => reportsEditorController
                                .change_enjoy_with_the_story(newValue),
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
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
