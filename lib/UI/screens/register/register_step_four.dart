import 'package:bedayat/UI/screens/register/register_step_five.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/UI/widgets/circle_image.dart';
import 'package:bedayat/UI/widgets/cutome_textFormfield.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/const/const.dart';
import 'package:bedayat/controllers/auth_Controller.dart';
import 'package:bedayat/controllers/group_controller.dart';
import 'package:bedayat/controllers/teacher_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    // _controller.displayDate = hi.HijriDateTime(1445, 02, 05);
    super.initState();
    groupController.fetchGroups(widget.selectedBranchIndex);
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController _childFirstNameController = TextEditingController();
  TextEditingController _childSecondNameController = TextEditingController();

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
  registerStepFour() async {
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
      kIsWeb ? _registerAndavegatoToWeb() : _registerAndavegatoToMobile();
    }
  }

  void _registerAndavegatoToWeb() async {
    String registerError = await authController.registerWeb(
      username: widget.nameController,
      phone: widget.phoneController,
      email: widget.emailController,
      password: widget.passwordController,
      groupId: selectedGroupIndex.toString(),
      teacherId: selectedTeacherIndex.toString(),
      // childname: _childNameController.text,
      relationOnefirstNameController: _relationOnefirstNameController.text,
      relationOneSecondNameController: _relationOneSecondNameController.text,
      relationOneThirdController: _relationOneThirdController.text,
      relationTwoFirstController: _relationTwoFirstNameController.text,
      relationTwoScecondController: _relationTwoScecondNameController.text,
      relationTwoThirdController: _relationTwoThirdNameController.text,
      emergencyNameController: _emergencyNameController.text,
      emergencyRelationController: _emergencyRelationController.text,
      parentTwoRealation: _relationsTwoController.text,
      parentTwoEmail: _emailTwoController.text,
      parentTwoPhone: _phoneTwoController.text,
      parentOneRealation: _relationsOneController.text,
      parentOneEmail: _emailOneController.text,
      parentOnePhone: _phoneOneController.text,
      familyCard: _familyCardPhoto,
      vaccinationCertificate: _vaccinationCertificate,
      document: _doctuumnet,
      emergencyNumber: _emergencyNumberController.text,
      ageGroup: '1',
      userId: '1',
      birthDate: _actualselectedDate,
      gender: _selectedType == 'ولد' ? 'male' : 'female',
    );
    if (registerError != "") {
      Get.defaultDialog(
          title: "Something went wrong".tr, middleText: registerError);
    } else {
      await authController
          .login(
        widget.emailController,
        widget.passwordController,
      )
          .then((value) {
        Get.to(RegisterStepFiveScreen());
      });
    }
  }

  void _registerAndavegatoToMobile() async {
    String registerError = await authController.register(
      username: widget.nameController,
      phone: widget.phoneController,
      email: widget.emailController,
      password: widget.passwordController,
      groupId: selectedGroupIndex.toString(),
      teacherId: selectedTeacherIndex.toString(),
      //childname: _childNameController.text,
      gender: _selectedType == 'ولد' ? 'male' : 'female',
      relationOnefirstNameController: _relationOnefirstNameController.text,
      relationOneSecondNameController: _relationOneSecondNameController.text,
      relationOneThirdController: _relationOneThirdController.text,
      relationTwoFirstController: _relationTwoFirstNameController.text,
      relationTwoScecondController: _relationTwoScecondNameController.text,
      relationTwoThirdController: _relationTwoThirdNameController.text,
      emergencyNameController: _emergencyNameController.text,
      emergencyRelationController: _emergencyRelationController.text,
      parentTwoRealation: _relationsTwoController.text,
      parentTwoEmail: _emailTwoController.text,
      parentTwoPhone: _phoneTwoController.text,
      parentOneRealation: _relationsOneController.text,
      parentOneEmail: _emailOneController.text,
      parentOnePhone: _phoneOneController.text,
      familyCard: _familyCardPhoto,
      vaccinationCertificate: _vaccinationCertificate,
      document: _doctuumnet,
      emergencyNumber: _emergencyNumberController.text,
      ageGroup: '1',
      userId: '1',
      actualselectedDate: _actualselectedDate,
    );
    if (registerError != "") {
      Get.defaultDialog(
          title: "Something went wrong".tr, middleText: registerError);
    } else {
      await authController
          .login(
        widget.emailController,
        widget.passwordController,
      )
          .then((value) {
        Get.to(RegisterStepFiveScreen());
      });
    }
  }

  Future<void> _selectMeldadyDate(BuildContext context) async {
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
        initialDatePickerMode: DatePickerMode.year,
        locale: Locale("${GetStorage().read('languageCode')}"));

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
                          'Register'.tr,
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
                                  child: Text(
                                    'Not Found Data'.tr,
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
                                                            .groupList[index].id
                                                    ? AppColors.primaryColor
                                                    : Colors.grey,
                                                width: selectedGroupIndex ==
                                                        groupController
                                                            .groupList[index].id
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
                                    'Not Found Data'.tr,
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
                    CustomeTextFormField(
                      controller: _childFirstNameController,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        } else if (val.length <= 2) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      hintText: 'First Name'.tr,
                    ),
                    CustomeTextFormField(
                      controller: _childSecondNameController,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        } else if (val.length <= 2) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      hintText: 'Name'.tr,
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
                                newValue == 'Gregorian'.tr
                                    ? _selectMeldadyDate(context)
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
                      hintText: 'Anthor Notes'.tr,
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
                    CustomeTextFormField(
                      controller: _relationOnefirstNameController,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      hintText: 'First Name'.tr,
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.accentColor,
                      ),
                    ),
                    CustomeTextFormField(
                      controller: _relationOneSecondNameController,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      hintText: 'Second Name'.tr,
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.accentColor,
                      ),
                    ),
                    CustomeTextFormField(
                      controller: _relationOneThirdController,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      hintText: 'Family Name'.tr,
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.accentColor,
                      ),
                    ),
                    CustomeTextFormField(
                      controller: _relationsOneController,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      hintText: 'Relative Relation'.tr,
                      prefixIcon: Icon(
                        Icons.family_restroom,
                        color: AppColors.accentColor,
                      ),
                    ),
                    CustomeTextFormField(
                      controller: _emailOneController,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      hintText: 'Email',
                      prefixIcon: Image.asset(AppImages.appEmailIcon),
                    ),
                    CustomeTextFormField(
                      controller: _phoneOneController,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        } else if (val.length <= 5) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      hintText: 'Phone Number'.tr,
                      prefixIcon: Image.asset(AppImages.appPhoneIcon),
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
                    CustomeTextFormField(
                      controller: _relationTwoFirstNameController,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      hintText: 'First Name'.tr,
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.accentColor,
                      ),
                    ),
                    CustomeTextFormField(
                      controller: _relationTwoScecondNameController,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      hintText: 'Second Name'.tr,
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.accentColor,
                      ),
                    ),
                    CustomeTextFormField(
                      controller: _relationTwoThirdNameController,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      hintText: 'Family Name'.tr,
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.accentColor,
                      ),
                    ),
                    CustomeTextFormField(
                      controller: _relationsTwoController,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      hintText: 'relative relation'.tr,
                      prefixIcon: Icon(
                        Icons.family_restroom,
                        color: AppColors.accentColor,
                      ),
                    ),
                    CustomeTextFormField(
                      controller: _emailTwoController,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        } else if (!val.isEmail) {
                          return 'The email is invalid'.tr;
                        }
                      },
                      hintText: 'Email'.tr,
                      prefixIcon: Image.asset(
                        AppImages.appEmailIcon,
                      ),
                    ),
                    CustomeTextFormField(
                      controller: _phoneTwoController,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        } else if (val.length <= 5) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      hintText: 'Phone Number'.tr,
                      prefixIcon: Image.asset(AppImages.appPhoneIcon),
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
                                registerStepFour();
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
