import 'package:bedayat/UI/screens/home/home.dart';
import 'package:bedayat/UI/screens/register/register_step_five.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/UI/widgets/circle_image.dart';
import 'package:bedayat/UI/widgets/cutome_textFormfield.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/const/const.dart';
import 'package:bedayat/controllers/group_controller.dart';
import 'package:bedayat/controllers/teacher_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hijri/hijri_calendar.dart';

class RegisterStepFourScreen extends StatefulWidget {
  final String nameController;
  final String phoneController;
  final String emailController;
  final String passwordController;
  // final String location;
  final int selectedBranchIndex;

  const RegisterStepFourScreen({
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    //required this.location,
    required this.selectedBranchIndex,
  });
  @override
  _RegisterStepFourScreenState createState() => _RegisterStepFourScreenState();
}

class _RegisterStepFourScreenState extends State<RegisterStepFourScreen> {
  final GroupController groupController = Get.put(GroupController());
  final TeacherController teacherController = Get.put(TeacherController());

  @override
  void initState() {
    super.initState();
    groupController.fetchGroups(widget.selectedBranchIndex);
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController _childNameController = TextEditingController();

  TextEditingController _relationOnefirstNameController =
      TextEditingController();
  TextEditingController _relationOneSecondNameController =
      TextEditingController();
  TextEditingController _relationOneThirdController = TextEditingController();

  TextEditingController _relationTwoFirstNameController =
      TextEditingController();
  TextEditingController _relationTwoScecondNameController =
      TextEditingController();
  TextEditingController _relationTwoThirdNameController =
      TextEditingController();

  TextEditingController _emergencyNumberController = TextEditingController();
  TextEditingController _anthorNotesController = TextEditingController();
  TextEditingController _sensitificController = TextEditingController();
  TextEditingController _emailOneController = TextEditingController();
  TextEditingController _phoneOneController = TextEditingController();
  TextEditingController _emailTwoController = TextEditingController();
  TextEditingController _relationsOneController = TextEditingController();
  TextEditingController _relationsTwoController = TextEditingController();
  TextEditingController _phoneTwoController = TextEditingController();
  TextEditingController _emergencyNameController = TextEditingController();
  TextEditingController _emergencyRelationController = TextEditingController();

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
  registerStepFour() async {
    if (!_formKey.currentState!.validate()) {
      return;
    } else if (_selectedType == 'الجنس') {
      await Get.defaultDialog(
          title: "حدث خطأ ما",
          middleText: 'يرجى التأكد من اختيار الجنس والفئة العمرية');
      return;
    } else if (_familyCardPhoto!.path.isEmpty ||
        _vaccinationCertificate!.path.isEmpty ||
        _doctuumnet!.path.isEmpty ||
        _selectedType == 'الجنس') {
      await Get.defaultDialog(
          title: "حدث خطأ ما", middleText: 'يرجى التأكد من اختيار الصور');
      return;
    } else if (selectedGroupIndex == null || selectedTeacherIndex == null) {
      await Get.defaultDialog(
          title: "حدث خطأ ما",
          middleText: 'يرجى التأكد من اختيار الفصل و المعلم');
    } else {
      Get.to(RegisterStepFiveScreen(
        nameController: widget.nameController,
        phoneController: widget.phoneController,
        emailController: widget.emailController,
        passwordController: widget.passwordController,
        selectedBranchIndex: widget.selectedBranchIndex,
        groupId: selectedGroupIndex!,
        techerId: selectedTeacherIndex!,
        childNameController: _childNameController.text,
        selectedType: _selectedType,
        actualselectedDate: _actualselectedDate,
        relationOnefirstNameController: _relationOnefirstNameController.text,
        relationOneSecondNameController: _relationOneSecondNameController.text,
        relationOneThirdController: _relationOneThirdController.text,
        relationTwoFirstController: _relationTwoFirstNameController.text,
        relationTwoScecondController: _relationTwoScecondNameController.text,
        relationTwoThirdController: _relationTwoThirdNameController.text,
        emergencyNameController: _emergencyNameController.text,
        emergencyRelationController: _emergencyRelationController.text,
        selectedRelationsTwo: _relationsTwoController.text,
        emailTwoController: _emailTwoController.text,
        phoneTwoController: _phoneTwoController.text,
        selectedRelationsOne: _relationsOneController.text,
        emailOneController: _emailOneController.text,
        phoneOneController: _phoneOneController.text,
        familyCardPhoto: _familyCardPhoto,
        vaccinationCertificate: _vaccinationCertificate,
        doctuumnet: _doctuumnet,
        anthorNotesController: _anthorNotesController.text,
        sensitificController: _sensitificController.text,
        emergencyNumberController: _emergencyNumberController.text,
//        selectedAge: '1',
      ));
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
                      Image.asset(
                        AppImages.appSubLogo,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'التسجيل',
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
                              '4/6',
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
                                    child: Text(
                                      'لاتوجد بيانات',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: AppColors.accentColor),
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
                                                      ? 3
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
                                    child: Text(
                                      'لاتوجد بيانات',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: AppColors.accentColor),
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
                                                  ? 3
                                                  : 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            children: [
                                              CircleImageWidget(
                                                imagePath:
                                                    "$baseUrl${teacherController.teacherList[index].profileImg!.replaceAll('public', 'storage')}",
                                              ),
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
                      CustomeTextFormField(
                        controller: _childNameController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                          if (val.length < 2) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        hintText: ' الاسم',
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
                      CustomeTextFormField(
                        controller: _anthorNotesController,
                        validator: (val) {},
                        hintText: 'ملاحظات اخرى',
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
                      CustomeTextFormField(
                        controller: _relationOnefirstNameController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        hintText: 'الاسم الاول',
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.accentColor,
                        ),
                      ),
                      CustomeTextFormField(
                        controller: _relationOneSecondNameController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        hintText: 'الاسم الثانى',
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.accentColor,
                        ),
                      ),
                      CustomeTextFormField(
                        controller: _relationOneThirdController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        hintText: 'الاسم العائلة',
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.accentColor,
                        ),
                      ),
                      CustomeTextFormField(
                        controller: _relationOnefirstNameController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        hintText: 'صلة القرابة',
                        prefixIcon: Icon(
                          Icons.family_restroom,
                          color: AppColors.accentColor,
                        ),
                      ),
                      CustomeTextFormField(
                        controller: _emailOneController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        hintText: 'البريد الألكترونى',
                        prefixIcon: Image.asset(AppImages.appEmailIcon),
                      ),
                      CustomeTextFormField(
                        controller: _relationOnefirstNameController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          } else if (val.length <= 5) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        hintText: 'رقم الجوال',
                        prefixIcon: Image.asset(AppImages.appPhoneIcon),
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
                      CustomeTextFormField(
                        controller: _relationTwoFirstNameController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        hintText: 'الاسم الاول',
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.accentColor,
                        ),
                      ),
                      CustomeTextFormField(
                        controller: _relationTwoScecondNameController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        hintText: 'الاسم الثانى',
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.accentColor,
                        ),
                      ),
                      CustomeTextFormField(
                        controller: _relationTwoThirdNameController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        hintText: 'اسم العائلة',
                        prefixIcon: Icon(
                          Icons.person,
                          color: AppColors.accentColor,
                        ),
                      ),
                      CustomeTextFormField(
                        controller: _relationsTwoController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        hintText: 'صلة القرابة',
                        prefixIcon: Icon(
                          Icons.family_restroom,
                          color: AppColors.accentColor,
                        ),
                      ),
                      CustomeTextFormField(
                        controller: _emailTwoController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          } else if (!val.isEmail) {
                            return 'البريد الالكترونى غير صالح';
                          }
                        },
                        hintText: 'البريد الألكترونى',
                        prefixIcon: Image.asset(
                          AppImages.appEmailIcon,
                        ),
                      ),
                      CustomeTextFormField(
                        controller: _relationOnefirstNameController,
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          } else if (val.length <= 5) {
                            return 'من فضلك ادخل قيمة صحيحة';
                          }
                        },
                        hintText: 'رقم الجوال',
                        prefixIcon: Image.asset(AppImages.appPhoneIcon),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () async {
                          _familyCardPhoto = await _picker.pickImage(
                              source: ImageSource.gallery);
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
                      ActionButton(
                        label: 'التالى',
                        onPressed: () {
                          registerStepFour();
                        },
                      ),
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
