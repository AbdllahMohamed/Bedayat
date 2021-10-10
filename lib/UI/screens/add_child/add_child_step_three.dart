import 'package:bedayat/UI/screens/add_child/add_child_step_four.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/UI/widgets/circle_image.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/const/const.dart';
import 'package:bedayat/controllers/add_child_controller.dart';
import 'package:bedayat/controllers/auth_Controller.dart';
import 'package:bedayat/controllers/group_controller.dart';
import 'package:bedayat/controllers/teacher_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hijri/hijri_calendar.dart';

class AddChildStepThreeScreen extends StatefulWidget {
  final int selectedBranchIndex;
  final String emergaceyNumber;

  final String relationsOneController;
  final String relationsTwoController;
  final String anthorNotesController;
  final String emailOneController;
  final String phoneOneController;
  final String emailTwoController;
  final String phoneTwoController;

  final String relationOnefirstNameController;
  final String relationOneSecondNameController;
  final String relationOneThirdNameController;
  final String relationTwoFirstNameController;
  final String relationTwoScecondNameController;
  final String relationTwoThirdNameController;
  final String emergencyNameController;
  final String emergencyRelationController;

  const AddChildStepThreeScreen({
    required this.selectedBranchIndex,
    required this.emergaceyNumber,
    required this.relationsOneController,
    required this.relationsTwoController,
    required this.anthorNotesController,
    required this.emailOneController,
    required this.phoneOneController,
    required this.emailTwoController,
    required this.phoneTwoController,
    required this.relationOnefirstNameController,
    required this.relationOneSecondNameController,
    required this.relationOneThirdNameController,
    required this.relationTwoFirstNameController,
    required this.relationTwoScecondNameController,
    required this.relationTwoThirdNameController,
    required this.emergencyNameController,
    required this.emergencyRelationController,
  });
  @override
  _AddChildStepThreeScreenState createState() =>
      _AddChildStepThreeScreenState();
}

class _AddChildStepThreeScreenState extends State<AddChildStepThreeScreen> {
  final GroupController groupController = Get.put(GroupController());
  final TeacherController teacherController = Get.put(TeacherController());
  final AddChildController addChildController = Get.put(AddChildController());
  AuthController authController = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();

  TextEditingController _childFirstNameController = TextEditingController();
  TextEditingController _childSecondNameController = TextEditingController();
  TextEditingController _sensitificController = TextEditingController();
  late TextEditingController _emergencyNumberController;
  late TextEditingController _anthorNotesController;
  late TextEditingController _emailOneController;
  late TextEditingController _phoneOneController;
  late TextEditingController _relationsOneController;
  late TextEditingController _relationsTwoController;
  late TextEditingController _emailTwoController;
  late TextEditingController _phoneTwoController;
  late TextEditingController _relationOnefirstNameController;
  late TextEditingController _relationOneSecondNameController;
  late TextEditingController _relationOneThirdController;
  late TextEditingController _relationTwoFirstNameController;
  late TextEditingController _relationTwoScecondNameController;
  late TextEditingController _relationTwoThirdNameController;
  late TextEditingController _emergencyNameController;
  late TextEditingController _emergencyRelationController;

  @override
  void initState() {
    super.initState();
    groupController.fetchGroups(widget.selectedBranchIndex);

    _emergencyNumberController =
        TextEditingController(text: widget.emergaceyNumber);
    _anthorNotesController =
        TextEditingController(text: widget.anthorNotesController);

    _relationsOneController =
        TextEditingController(text: widget.relationsOneController);
    _emailOneController =
        TextEditingController(text: widget.emailOneController);
    _phoneOneController =
        TextEditingController(text: widget.phoneOneController);
    _relationsTwoController =
        TextEditingController(text: widget.relationsTwoController);
    _emailTwoController =
        TextEditingController(text: widget.emailTwoController);
    _phoneTwoController =
        TextEditingController(text: widget.phoneTwoController);

    _relationOnefirstNameController =
        TextEditingController(text: widget.relationOnefirstNameController);
    _relationOneSecondNameController =
        TextEditingController(text: widget.relationOneSecondNameController);
    _relationOneThirdController =
        TextEditingController(text: widget.relationOneThirdNameController);
    _relationTwoFirstNameController =
        TextEditingController(text: widget.relationTwoFirstNameController);
    _relationTwoScecondNameController =
        TextEditingController(text: widget.relationTwoScecondNameController);
    _relationTwoThirdNameController =
        TextEditingController(text: widget.relationTwoThirdNameController);
    _emergencyNameController =
        TextEditingController(text: widget.emergencyNameController);
    _emergencyRelationController =
        TextEditingController(text: widget.emergencyRelationController);
    _emergencyRelationController =
        TextEditingController(text: widget.emergencyRelationController);
  }

  List<String> _dates = ['Gregorian'.tr, 'Hijri'.tr];
  String _actualselectedDate = 'birth date'.tr;

  List<String> _types = ['Male'.tr, 'Female'.tr];
  String _selectedType = 'Gender'.tr;

  bool _isSensitific = false;
  bool _isFilming = false;

  final ImagePicker _picker = ImagePicker();

  XFile _familyCardPhoto = XFile('');
  XFile _vaccinationCertificate = XFile('');
  XFile _doctuumnet = XFile('');

  int? selectedGroupIndex;
  int? selectedTeacherIndex;
  addChildStepThree() async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else if (_actualselectedDate == 'birth date'.tr) {
      await Get.defaultDialog(
          title: "Something went wrong".tr,
          middleText: 'Please make sure to choose your date of birth'.tr);
    } else if (selectedGroupIndex == null || selectedTeacherIndex == null) {
      await Get.defaultDialog(
          title: "Something went wrong".tr,
          middleText: 'Please make sure you choose the class and teacher'.tr);
    } else if (_selectedType == 'Gender'.tr) {
      await Get.defaultDialog(
          title: "Something went wrong".tr,
          middleText:
              'Please make sure to choose your age group and gender'.tr);
      return;
    } else if (_familyCardPhoto.path.isEmpty ||
        _vaccinationCertificate.path.isEmpty ||
        _doctuumnet.path.isEmpty ||
        _selectedType == 'Gender'.tr) {
      await Get.defaultDialog(
          title: "Something went wrong".tr,
          middleText: 'Please make sure to choose photos'.tr);
      return;
    } else {
      kIsWeb ? _addChildWeb() : _addChildMobile();
    }
  }

  void _addChildWeb() async {
    String addchildError = await authController.addChildWeb(
      childFirstName: _childFirstNameController.text,
      childSecondName: _childSecondNameController.text,
      gender: _selectedType == 'ولد' ? 'male' : 'female',
      emergencyNumber: _emergencyNumberController.text,
      parentOneRealation: _relationsOneController.text,
      parentOneEmail: widget.emailOneController,
      parentOnePhone: widget.phoneOneController,
      parentTwoRealation: _relationsTwoController.text,
      parentTwoEmail: widget.emailTwoController,
      parentTwoPhone: widget.phoneTwoController,
      userId: "1",
      ageGroup: '1',
      teacherId: selectedTeacherIndex.toString(),
      groupId: selectedGroupIndex.toString(),
      familyCard: _familyCardPhoto,
      vaccinationCertificate: _vaccinationCertificate,
      document: _doctuumnet,
      actualselectedDate: _actualselectedDate,
      relationOnefirstNameController: _relationOnefirstNameController.text,
      relationOneSecondNameController: _relationOneSecondNameController.text,
      relationOneThirdController: _relationOneThirdController.text,
      relationTwoFirstController: _relationTwoFirstNameController.text,
      relationTwoScecondController: _relationTwoScecondNameController.text,
      relationTwoThirdController: _relationTwoThirdNameController.text,
      emergencyNameController: _emergencyNameController.text,
      emergencyRelationController: _emergencyRelationController.text,
    );

    print(addchildError);
    if (addchildError != "") {
      Get.defaultDialog(
          title: "Something went wrong".tr, middleText: addchildError);
    } else {
      Future.delayed(Duration(milliseconds: 200), () {
        Get.to(AddChildStepFourScreen());
      });
    }
  }

  void _addChildMobile() async {
    String addchildError = await authController.addChild(
      childFirstName: _childFirstNameController.text,
      childSecondName: _childSecondNameController.text,
      gender: _selectedType == 'ولد' ? 'male' : 'female',
      emergencyNumber: _emergencyNumberController.text,
      parentOneRealation: _relationsOneController.text,
      parentOneEmail: widget.emailOneController,
      parentOnePhone: widget.phoneOneController,
      parentTwoRealation: _relationsTwoController.text,
      parentTwoEmail: widget.emailTwoController,
      parentTwoPhone: widget.phoneTwoController,
      userId: "1",
      teacherId: selectedTeacherIndex.toString(),
      groupId: selectedGroupIndex.toString(),
      familyCard: _familyCardPhoto,
      vaccinationCertificate: _vaccinationCertificate,
      document: _doctuumnet,
      actualselectedDate: _actualselectedDate,
      relationOnefirstNameController: _relationOnefirstNameController.text,
      relationOneSecondNameController: _relationOneSecondNameController.text,
      relationOneThirdController: _relationOneThirdController.text,
      relationTwoFirstController: _relationTwoFirstNameController.text,
      relationTwoScecondController: _relationTwoScecondNameController.text,
      relationTwoThirdController: _relationTwoThirdNameController.text,
      emergencyNameController: _emergencyNameController.text,
      emergencyRelationController: _emergencyRelationController.text,
    );

    print(addchildError);
    if (addchildError != "") {
      Get.defaultDialog(
          title: "Something went wrong".tr, middleText: addchildError);
    } else {
      Future.delayed(Duration(milliseconds: 200), () {
        Get.to(AddChildStepFourScreen());
      });
    }
  }

  Future<void> _selectMedladyDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
      firstDate: DateTime(2000, 8),
    );

    if (picked != null)
      setState(() {
        _actualselectedDate = picked.toString().substring(0, 10);
      });
  }

  Future<void> _selectHijrDate(BuildContext context) async {
    final HijriCalendar? picked = await showHijriDatePicker(
      context: context,
      initialDate: HijriCalendar.now(),
      lastDate: HijriCalendar.now(),
      firstDate: HijriCalendar()
        ..hYear = 1400
        ..hMonth = 12
        ..hDay = 25,
      initialDatePickerMode: DatePickerMode.day,
    );

    if (picked != null)
      setState(() {
        _actualselectedDate = "${picked.hYear}/${picked.hMonth}/${picked.hDay}";
      });
  }

  final locale = Get.locale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        Image.asset(
                          AppImages.appSubLogo,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add Child'.tr,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 6,
                              color: AppColors.accentColor,
                            ),
                          ),
                          child: Text(
                            '3/5',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Child Data'.tr,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.accentColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Teachers'.tr,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 15),
                    Obx(
                      () => groupController.loadingProcess.value
                          ? Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.accentColor,
                                ),
                              ),
                            )
                          : groupController.groupList.length == 0
                              ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 70.0),
                                    child: Text(
                                      'Not Found Data'.tr,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: AppColors.accentColor),
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 45,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          groupController.groupList.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedGroupIndex =
                                                  groupController
                                                      .groupList[index].id;
                                              teacherController.fetchTeachers(
                                                  selectedGroupIndex!);
                                            });
                                          },
                                          child: Container(
                                            width: 100,
                                            height: 40,
                                            margin: EdgeInsets.only(left: 5),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: selectedGroupIndex !=
                                                        groupController
                                                            .groupList[index].id
                                                    ? AppColors.primaryColor
                                                    : Colors.grey,
                                                width: selectedGroupIndex ==
                                                        groupController
                                                            .groupList[index].id
                                                    ? 2
                                                    : 1,
                                              ),
                                            ),
                                            child: Text(
                                              groupController
                                                  .groupList[index].title!,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Obx(
                      () => teacherController.loadingProcess.value
                          ? Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.accentColor,
                                ),
                              ),
                            )
                          : teacherController.teacherList.length == 0
                              ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 40.0, bottom: 40),
                                    child: Text(
                                      'Not Found Data'.tr,
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: AppColors.accentColor),
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      teacherController.teacherList.length,
                                  itemBuilder: (_, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedTeacherIndex =
                                              teacherController
                                                  .teacherList[index].id;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: selectedTeacherIndex ==
                                                    teacherController
                                                        .teacherList[index].id
                                                ? AppColors.primaryColor
                                                : Colors.grey,
                                            width: selectedTeacherIndex ==
                                                    teacherController
                                                        .teacherList[index].id
                                                ? 2
                                                : 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Row(
                                          children: [
                                            CircleImageWidget(
                                                imagePath:
                                                    "$baseUrl${teacherController.teacherList[index].profileImg!.replaceAll('public', 'storage')}"),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    locale == Locale('en')
                                                        ? teacherController
                                                            .teacherList[index]
                                                            .englishName!
                                                        : teacherController
                                                            .teacherList[index]
                                                            .arabicName!,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColors.titleColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    locale == Locale('en')
                                                        ? teacherController
                                                            .teacherList[index]
                                                            .englishDescription!
                                                        : teacherController
                                                            .teacherList[index]
                                                            .arabicDescription!,
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                          AppColors.accentColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _childFirstNameController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        } else if (val.length <= 2) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        hintText: 'First Name'.tr,
                        hintStyle: TextStyle(color: AppColors.accentColor),
                      ),
                    ),
                    TextFormField(
                      controller: _childSecondNameController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        } else if (val.length <= 2) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        hintText: 'Second Name'.tr,
                        hintStyle: TextStyle(color: AppColors.accentColor),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 5.0, left: 5, top: 8),
                            child: DropdownButton(
                              iconEnabledColor: Color(0xffAA9E9E),
                              isExpanded: true,
                              iconSize: 30,
                              underline: Divider(
                                thickness: 1,
                                color: AppColors.accentColor.withOpacity(0.5),
                              ),
                              icon: Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Icon(Icons.arrow_drop_down),
                              ),
                              hint: Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Text(
                                  _actualselectedDate,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.accentColor,
                                  ),
                                ),
                              ),
                              onChanged: (String? newValue) {
                                newValue == 'Gregorian'.tr
                                    ? _selectMedladyDate(context)
                                    : _selectHijrDate(context);
                              },
                              items: _dates.map((type) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    type,
                                    style: TextStyle(
                                      color: Color(0xff707070),
                                    ),
                                  ),
                                  value: type,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, top: 8, bottom: 8),
                            child: DropdownButton(
                              iconEnabledColor: Color(0xffAA9E9E),
                              isExpanded: true,
                              iconSize: 30,
                              underline: Divider(
                                thickness: 1,
                                color: AppColors.accentColor.withOpacity(0.5),
                              ),
                              icon: Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Icon(Icons.arrow_drop_down),
                              ),
                              hint: Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Text(
                                  _selectedType,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.accentColor,
                                  ),
                                ),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedType = newValue.toString();
                                });
                              },
                              items: _types.map((country) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    country.toString(),
                                    style: TextStyle(
                                      color: Color(0xff707070),
                                    ),
                                  ),
                                  value: country.toString(),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: _anthorNotesController,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        hintText: 'Anthor Notes'.tr,
                        hintStyle: TextStyle(color: AppColors.accentColor),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'First Parent'.tr,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _relationOnefirstNameController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'First Name'.tr,
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.accentColor,
                        ),
                        hintStyle: TextStyle(
                          color: AppColors.accentColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _relationOneSecondNameController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Second Name'.tr,
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.accentColor,
                        ),
                        hintStyle: TextStyle(
                          color: AppColors.accentColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _relationOneThirdController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Family Name'.tr,
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.accentColor,
                        ),
                        hintStyle: TextStyle(
                          color: AppColors.accentColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _relationsOneController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Relative Relation'.tr,
                        prefixIcon: Icon(
                          Icons.family_restroom,
                          color: AppColors.accentColor,
                        ),
                        hintStyle: TextStyle(
                          color: AppColors.accentColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _emailOneController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        } else if (!val.isEmail) {
                          return 'The email is invalid'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Image.asset(AppImages.appEmailIcon),
                        hintStyle: TextStyle(
                          color: AppColors.accentColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _phoneOneController,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        } else if (val.length <= 5) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Phone Number'.tr,
                        prefixIcon: Image.asset(AppImages.appPhoneIcon),
                        hintStyle: TextStyle(
                          color: AppColors.accentColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'The second Parent'.tr,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _relationTwoFirstNameController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'First Name'.tr,
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.accentColor,
                        ),
                        hintStyle: TextStyle(
                          color: AppColors.accentColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _relationTwoScecondNameController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Second Name'.tr,
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.accentColor,
                        ),
                        hintStyle: TextStyle(
                          color: AppColors.accentColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _relationTwoThirdNameController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Family Name'.tr,
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.accentColor,
                        ),
                        hintStyle: TextStyle(
                          color: AppColors.accentColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _relationsTwoController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'relative relation'.tr,
                        prefixIcon: Icon(
                          Icons.family_restroom,
                          color: AppColors.accentColor,
                        ),
                        hintStyle: TextStyle(
                          color: AppColors.accentColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _emailTwoController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        } else if (!val.isEmail) {
                          return 'The email is invalid'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Email'.tr,
                        prefixIcon: Image.asset(AppImages.appEmailIcon),
                        hintStyle: TextStyle(
                          color: AppColors.accentColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _phoneTwoController,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        } else if (val.length <= 5) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Phone Number'.tr,
                        prefixIcon: Image.asset(AppImages.appPhoneIcon),
                        hintStyle: TextStyle(
                          color: AppColors.accentColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () async {
                        _familyCardPhoto = (await _picker.pickImage(
                            source: ImageSource.gallery))!;
                        setState(() {});
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.borderColor,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  child: Text(
                                    'Family Card'.tr,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.titleColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    'Attach a photo of the family card'.tr,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.accentColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Image.asset(
                                (_familyCardPhoto.path.isEmpty)
                                    ? AppImages.appUploadNormal
                                    : AppImages.appUploadColored,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        _vaccinationCertificate = (await _picker.pickImage(
                            source: ImageSource.gallery))!;
                        setState(() {});
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.borderColor,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  child: Text(
                                    'Vaccination certificates'.tr,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.titleColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    'Attach of the vaccination certificates'.tr,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.accentColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Image.asset(
                                (_vaccinationCertificate.path.isEmpty)
                                    ? AppImages.appUploadNormal
                                    : AppImages.appUploadColored,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        _doctuumnet = (await _picker.pickImage(
                            source: ImageSource.gallery))!;
                        setState(() {});
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.borderColor,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  child: Text(
                                    'Child picture'.tr,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.titleColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Text(
                                    'Attach a picture of the child'.tr,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.accentColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Image.asset(
                                (_doctuumnet.path.isEmpty)
                                    ? AppImages.appUploadNormal
                                    : AppImages.appUploadColored,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Does the child have an allergy?'.tr),
                        Switch(
                          activeColor: Colors.green,
                          value: _isSensitific,
                          onChanged: (val) {
                            setState(() {
                              _isSensitific = val;
                            });
                          },
                        )
                      ],
                    ),
                    _isSensitific
                        ? TextFormField(
                            controller: _sensitificController,
                            readOnly: _isSensitific,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[300]!),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[300]!),
                              ),
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[300]!),
                              ),
                              hintText:
                                  'Please tell us what type of allergy your child has'
                                      .tr,
                              hintStyle:
                                  TextStyle(color: AppColors.accentColor),
                            ),
                          )
                        : const SizedBox(),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('I want my child to be photographed'.tr),
                        Switch(
                          activeColor: Colors.green,
                          value: _isFilming,
                          onChanged: (val) {
                            setState(() {
                              _isFilming = val;
                            });
                          },
                        )
                      ],
                    ),
                    Text(
                      'To post on social media'.tr,
                      style: TextStyle(
                        color: AppColors.accentColor,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'for emergency'.tr,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _emergencyNameController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Name'.tr,
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.accentColor,
                        ),
                        hintStyle: TextStyle(
                          color: AppColors.accentColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _emergencyRelationController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'relative relation'.tr,
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.accentColor,
                        ),
                        hintStyle: TextStyle(
                          color: AppColors.accentColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _emergencyNumberController,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        } else if (val.length < 3) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: 14, left: 8, right: 5),
                        prefixIcon: Image.asset(
                          AppImages.appEmergecey,
                          width: 5,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        hintText: 'emergency number'.tr,
                        hintStyle: TextStyle(
                          color: AppColors.accentColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      return authController.loadingProcess.value
                          ? Center(child: CircularProgressIndicator())
                          : ActionButton(
                              label: 'Next'.tr,
                              onPressed: () async {
                                addChildStepThree();
                              });
                    }),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
