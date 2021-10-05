import 'package:bedayat/UI/screens/add_child/add_child_step_four.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/UI/widgets/circle_image.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/const/const.dart';
import 'package:bedayat/controllers/add_child_controller.dart';
import 'package:bedayat/controllers/auth_services.dart';
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

  TextEditingController _childNameController = TextEditingController();
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

  List<String> _dates = ['ميلادى', 'هجرى'];
  String _actualselectedDate = 'تاريخ الميلاد';

  List<String> _types = ['ولد', 'بنت'];
  String _selectedType = 'الجنس';

  bool _isSensitific = false;
  bool _isFilming = false;

  final ImagePicker _picker = ImagePicker();

  XFile? _familyCardPhoto = XFile('');
  XFile? _vaccinationCertificate = XFile('');
  XFile? _doctuumnet = XFile('');

  int? selectedGroupIndex;
  int? selectedTeacherIndex;
  addChildStepThree() async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else if (_actualselectedDate == 'تاريخ الميلاد') {
      await Get.defaultDialog(
          title: "حدث خطأ ما",
          middleText: 'يرجى التأكد من اختيار تاريخ الميلاد ');
    } else if (selectedGroupIndex == null || selectedTeacherIndex == null) {
      await Get.defaultDialog(
          title: "حدث خطأ ما",
          middleText: 'يرجى التأكد من اختيار الفصل و المعلم');
    } else if (_selectedType == 'الجنس') {
      await Get.defaultDialog(
          title: "حدث خطأ ما",
          middleText: 'يرجى التأكد من اختيار الفئة العمرية والجنس');
      return;
    } else if (_familyCardPhoto!.path.isEmpty ||
        _vaccinationCertificate!.path.isEmpty ||
        _doctuumnet!.path.isEmpty ||
        _selectedType == 'الجنس') {
      await Get.defaultDialog(
          title: "حدث خطأ ما", middleText: 'يرجى التأكد من اختيار الصور');
      return;
    } else {
      kIsWeb ? _addChildWeb() : _addChildMobile();
    }
  }

  void _addChildWeb() async {
    String addchildError = await authController.addChildWeb(
      childname: _childNameController.text,
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
      document: _doctuumnet!,
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
      Get.defaultDialog(title: "حدث خطأ ما", middleText: addchildError);
    } else {
      Future.delayed(Duration(milliseconds: 200), () {
        Get.to(AddChildStepFourScreen());
      });
    }
  }

  void _addChildMobile() async {
    String addchildError = await authController.addChild(
      childname: _childNameController.text,
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
      document: _doctuumnet!,
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
      Get.defaultDialog(title: "حدث خطأ ما", middleText: addchildError);
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

  @override
  void dispose() {
    super.dispose();
    _childNameController.dispose();
    _emergencyNumberController.dispose();
    _anthorNotesController.dispose();
    _emailOneController.dispose();
    _phoneOneController.dispose();
    _emailTwoController.dispose();
    _phoneTwoController.dispose();
  }

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
                child: Directionality(
                  textDirection: TextDirection.rtl,
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
                            'اضافة طفل',
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
                        'بيانات الطفل',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'المعلمين',
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
                                      padding: const EdgeInsets.only(top: 80.0),
                                      child: Text(
                                        'لاتوجد بيانات',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: AppColors.accentColor),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 45,
                                    child: ListView.builder(
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
                                                              .groupList[index]
                                                              .id
                                                      ? AppColors.primaryColor
                                                      : Colors.grey,
                                                  width: selectedGroupIndex ==
                                                          groupController
                                                              .groupList[index]
                                                              .id
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
                                      padding: const EdgeInsets.only(top: 80.0),
                                      child: Text(
                                        'لاتوجد بيانات',
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
                                                      teacherController
                                                          .teacherList[index]
                                                          .name!,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors
                                                            .titleColor,
                                                      ),
                                                    ),
                                                    Text(
                                                      teacherController
                                                          .teacherList[index]
                                                          .description!,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: AppColors
                                                            .accentColor,
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
                        controller: _childNameController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          } else if (val.length <= 2) {
                            return 'من فضلك ادخل قيمة صحيحة';
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
                          hintText: ' الاسم',
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
                                  right: 8.0, left: 8, top: 8),
                              child: DropdownButton(
                                iconEnabledColor: Color(0xffAA9E9E),
                                isExpanded: true,
                                iconSize: 30,
                                underline: Divider(
                                  thickness: 1,
                                  color: AppColors.accentColor.withOpacity(0.5),
                                ),
                                icon: Padding(
                                  padding: EdgeInsets.only(bottom: 20),
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
                                  newValue == 'ميلادى'
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
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton(
                                iconEnabledColor: Color(0xffAA9E9E),
                                isExpanded: true,
                                iconSize: 30,
                                underline: Divider(
                                  thickness: 1,
                                  color: AppColors.accentColor.withOpacity(0.5),
                                ),
                                icon: Padding(
                                  padding: EdgeInsets.only(bottom: 20),
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
                          hintText: 'ملاحظات اخرى',
                          hintStyle: TextStyle(color: AppColors.accentColor),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'ولى الامر الاول',
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
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'الاسم الاول',
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
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'الاسم الثانى',
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
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'الاسم العائلة',
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
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'صلة القرابة',
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
                            return 'من فضلك ادخل قيمة صحيحة';
                          } else if (!val.isEmail) {
                            return 'البريد الالكترونى غير صالح';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'البريد الألكترونى',
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
                            return 'من فضلك ادخل قيمة صحيحة';
                          } else if (val.length <= 5) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'رقم الجوال',
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
                        'ولى الامر الثانى',
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
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'الاسم الاول',
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
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'الاسم الثانى',
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
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'اسم العائلة',
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
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'صلة القرابة',
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
                            return 'من فضلك ادخل قيمة صحيحة';
                          } else if (!val.isEmail) {
                            return 'البريد الالكترونى غير صالح';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'البريد الألكترونى',
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
                            return 'من فضلك ادخل قيمة صحيحة';
                          } else if (val.length <= 5) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'رقم الجوال',
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
                          _familyCardPhoto = await _picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {});
                          print(_familyCardPhoto!.path);
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
                                    padding: const EdgeInsets.only(
                                      right: 23.0,
                                      top: 6,
                                      bottom: 6,
                                    ),
                                    child: Text(
                                      'بطاقة العائلة',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.titleColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      'ارفق صورة بطاقة العائلة',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.accentColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Image.asset(
                                  (_familyCardPhoto!.path.isEmpty)
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
                          _vaccinationCertificate = await _picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {});
                          print(_vaccinationCertificate!.path);
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
                                    padding: const EdgeInsets.only(
                                      right: 23.0,
                                      top: 6,
                                      bottom: 6,
                                    ),
                                    child: Text(
                                      'شهادات التطعيمات',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.titleColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      'ارفق صورة شهادات التطعيمات',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.accentColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Image.asset(
                                  (_vaccinationCertificate!.path.isEmpty)
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
                          _doctuumnet = await _picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {});
                          print(_doctuumnet!.path);
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
                                    padding: const EdgeInsets.only(
                                      right: 23.0,
                                      top: 6,
                                      bottom: 6,
                                    ),
                                    child: Text(
                                      'صورة الطفل',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.titleColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      'ارفق صورة الطفل',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.accentColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Image.asset(
                                  (_doctuumnet!.path.isEmpty)
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
                          Text(' هل يعانى الطفل من حساسية'),
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
                                    'فضلا اخبرنا نوع الحساسية الخاصة بطفلك',
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
                          Text('اقبل ان يتم تصوير طفلى'),
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
                        'للنشر على وسائل التواصل الاجتماعى',
                        style: TextStyle(
                          color: AppColors.accentColor,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'للطوارئ',
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
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'الاسم',
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
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'صلة القرابة',
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
                            return 'من فضلك ادخل قيمة صحيحة';
                          } else if (val.length < 3) {
                            return 'من فضلك ادخل قيمة صحيحة';
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
                          hintText: ' رقم الطوارئ',
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
                                label: 'التالى',
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
      ),
    );
  }
}
