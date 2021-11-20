import 'package:bedayat/UI/screens/bottom_navigation/bottom_navigation.dart';
import 'package:bedayat/UI/screens/child_editor/child_editor.dart';
import 'package:bedayat/UI/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/UI/widgets/cutome_textFormfield.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'dart:async';
import 'package:bedayat/UI/screens/payment/payment.dart';
import 'package:bedayat/UI/widgets/circle_image.dart';
import 'package:bedayat/const/const.dart';
import 'package:bedayat/controllers/auth_Controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hijri/hijri_calendar.dart';

// ignore: must_be_immutable
class ChildFormScreen extends StatefulWidget {
  final String routename;
  String? childId;

  ChildFormScreen({Key? key, required this.routename, this.childId})
      : super(key: key);
  @override
  _ChildFormScreenState createState() => _ChildFormScreenState();
}

class _ChildFormScreenState extends State<ChildFormScreen> {
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  void initializeData() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (widget.routename == 'addChild' || widget.routename == 'register') {
        childEditorController
            .fetchGroups(childEditorController.selectedBranchIndex.value);
      }

      if (widget.routename == 'addChild') {
        childEditorController.emergencyNumberController.text =
            childEditorController.addChildList[0].emergencyNumber ?? "";

        childEditorController.anthorNotesController.text =
            childEditorController.addChildList[0].notes ?? "";

        childEditorController.relationsOneController.text =
            childEditorController.addChildList[0].parentOneRealation ?? "";

        childEditorController.emailOneController.text =
            childEditorController.addChildList[0].parentOneEmail ?? "";

        childEditorController.phoneOneController.text =
            childEditorController.addChildList[0].parentOnePhone ?? "";

        childEditorController.relationsTwoController.text =
            childEditorController.addChildList[0].parentTwoRealation ?? "";

        childEditorController.emailTwoController.text =
            childEditorController.addChildList[0].parentTwoEmail ?? "";

        childEditorController.phoneTwoController.text =
            childEditorController.addChildList[0].parentTwoPhone ?? "";

        childEditorController.relationOnefirstNameController.text =
            childEditorController.addChildList[0].relationOneFirstName ?? "";

        childEditorController.relationOneSecondNameController.text =
            childEditorController.addChildList[0].relationOneSecondName ?? "";

        childEditorController.relationOneThirdController.text =
            childEditorController.addChildList[0].relationOneThirdName ?? "";

        childEditorController.relationTwoFirstNameController.text =
            childEditorController.addChildList[0].relationTwoFirstName ?? "";

        childEditorController.relationTwoScecondNameController.text =
            childEditorController.addChildList[0].relationTwoScecondName ?? "";

        childEditorController.relationTwoThirdNameController.text =
            childEditorController.addChildList[0].relationTwoThirdName ?? "";

        childEditorController.emergencyNameController.text =
            childEditorController.addChildList[0].emergencyName ?? "";

        childEditorController.emergencyRelationController.text =
            childEditorController.addChildList[0].emergencyRelation ?? "";
      }
      _editChildData();
    });
  }

  _editChildData() async {
    childEditorController.initLoadingProcess.value = true;
    if (widget.routename == 'editChild' &&
        childEditorController.initLoadingProcess.value == true) {
      await childEditorController.getEditChildData(widget.childId.toString());

      await childEditorController.fetchGroups(
          childEditorController.selectedBranchIndex.value == 0
              ? childEditorController.editChildList[0].branchId!
              : childEditorController.selectedBranchIndex.value);
      await childEditorController
          .fetchTeachers(childEditorController.editChildList[0].groupId!);

      childEditorController.selectedBranchIndex.value =
          childEditorController.selectedBranchIndex.value == 0
              ? childEditorController.editChildList[0].branchId!
              : childEditorController.selectedBranchIndex.value;
      childEditorController.childFirstNameController.text =
          childEditorController.editChildList[0].childFirstName ?? "";
      childEditorController.childSecondNameController.text =
          childEditorController.editChildList[0].childSecondName ?? "";
      childEditorController.emergencyNumberController.text =
          childEditorController.editChildList[0].emergencyNumber ?? "";
      childEditorController.anthorNotesController.text =
          childEditorController.editChildList[0].notes ?? "";
      childEditorController.relationsOneController.text =
          childEditorController.editChildList[0].parentOneRealation ?? "";
      childEditorController.emailOneController.text =
          childEditorController.editChildList[0].parentOneEmail ?? "";
      childEditorController.phoneOneController.text =
          childEditorController.editChildList[0].parentOnePhone ?? "";
      childEditorController.relationsTwoController.text =
          childEditorController.editChildList[0].parentTwoRealation ?? "";
      childEditorController.emailTwoController.text =
          childEditorController.editChildList[0].parentTwoEmail ?? "";
      childEditorController.phoneTwoController.text =
          childEditorController.editChildList[0].parentTwoPhone ?? "";
      childEditorController.relationOnefirstNameController.text =
          childEditorController.editChildList[0].relationOneFirstName ?? "";
      childEditorController.relationOneSecondNameController.text =
          childEditorController.editChildList[0].relationOneSecondName ?? "";
      childEditorController.relationOneThirdController.text =
          childEditorController.editChildList[0].relationOneThirdName ?? "";
      childEditorController.relationTwoFirstNameController.text =
          childEditorController.editChildList[0].relationTwoFirstName ?? "";
      childEditorController.relationTwoScecondNameController.text =
          childEditorController.editChildList[0].relationTwoScecondName ?? "";
      childEditorController.relationTwoThirdNameController.text =
          childEditorController.editChildList[0].relationTwoThirdName ?? "";
      childEditorController.emergencyNameController.text =
          childEditorController.editChildList[0].emergencyName ?? "";
      childEditorController.emergencyRelationController.text =
          childEditorController.editChildList[0].emergencyRelation ?? "";
      childEditorController.initLoadingProcess.value = false;
    }
  }

  final _formKey = GlobalKey<FormState>();

  registerStepFour() async {
    if (widget.routename == 'register' || widget.routename == 'addChild') {
      if (!_formKey.currentState!.validate()) {
        return;
      } else if (childEditorController.actualselectedDate == 'birth date'.tr) {
        print(childEditorController.actualselectedDate);
        await Get.defaultDialog(
            title: "Something went wrong".tr,
            middleText: 'Please make sure to choose your date of birth'.tr);
      } else if (childEditorController.selectedGroupIndex == null ||
          childEditorController.selectedTeacherIndex == null) {
        await Get.defaultDialog(
            title: "Something went wrong".tr,
            middleText: 'Please make sure you choose the class and teacher'.tr);
      } else if (childEditorController.selectedType == 'Gender'.tr) {
        await Get.defaultDialog(
            title: "Something went wrong".tr,
            middleText:
                'Please make sure to choose your age group and gender'.tr);
        return;
      } else if (childEditorController.familyCardPhoto.path.isEmpty ||
          childEditorController.vaccinationCertificate.path.isEmpty ||
          childEditorController.doctuumnet.path.isEmpty ||
          childEditorController.selectedType == 'Gender'.tr) {
        await Get.defaultDialog(
            title: "Something went wrong".tr,
            middleText: 'Please make sure to choose photos'.tr);
        return;
      } else {
        if (widget.routename == 'register') {
          kIsWeb ? _registerAndavegatoToWeb() : _registerAndavegatoToMobile();
        }
        if (widget.routename == 'addChild') {
          kIsWeb ? _addChildWeb() : _addChildMobile();
        }
      }
    } else {
      if (widget.routename == 'editChild' &&
          childEditorController.updateChoice.value == false) {
        childEditorController.actualselectedDate =
            childEditorController.editChildList[0].birthDate!.substring(0, 10);
        print(childEditorController.actualselectedDate);
      } else {
        print(childEditorController.actualselectedDate);
      }
      if (widget.routename == 'editChild' &&
          childEditorController.updateChoice.value == false) {
        childEditorController.actualselectedDate =
            childEditorController.editChildList[0].birthDate!.substring(0, 10);
        print(childEditorController.actualselectedDate);
      } else {
        print(childEditorController.actualselectedDate);
      }

      if (widget.routename == 'editChild' &&
          childEditorController.updateChoice.value == false) {
        childEditorController.selectedType =
            childEditorController.editChildList[0].gender!;
        print(childEditorController.selectedType);
      } else {
        print(childEditorController.selectedType);
      }

      if (childEditorController.selectedGroupIndex == null ||
          childEditorController.selectedTeacherIndex == null) {
        await Get.defaultDialog(
            title: "Something went wrong".tr,
            middleText: 'Please make sure you choose the class and teacher'.tr);
      } else {
        if (widget.routename == 'editChild') {
          kIsWeb ? _editChildWeb() : _editChild();
        }
      }
    }
  }

  void _addChildWeb() async {
    String addchildError = await authController.addChildWeb(
        childFirstName: childEditorController.childFirstNameController.text,
        childSecondName: childEditorController.childSecondNameController.text,
        gender: childEditorController.selectedType == 'ولد' ? 'male' : 'female',
        emergencyNumber: childEditorController.emergencyNumberController.text,
        parentOneRealation: childEditorController.relationsOneController.text,
        parentOneEmail: childEditorController.emailOneController.text,
        parentOnePhone: childEditorController.phoneOneController.text,
        parentTwoRealation: childEditorController.relationsTwoController.text,
        parentTwoEmail: childEditorController.emailTwoController.text,
        parentTwoPhone: childEditorController.phoneTwoController.text,
        userId: "1",
        teacherId: childEditorController.selectedTeacherIndex.toString(),
        groupId: childEditorController.selectedGroupIndex.toString(),
        familyCard: childEditorController.familyCardPhoto,
        vaccinationCertificate: childEditorController.vaccinationCertificate,
        document: childEditorController.doctuumnet,
        actualselectedDate: childEditorController.actualselectedDate,
        relationOnefirstNameController:
            childEditorController.relationOnefirstNameController.text,
        relationOneSecondNameController:
            childEditorController.relationOneSecondNameController.text,
        relationOneThirdController:
            childEditorController.relationOneThirdController.text,
        relationTwoFirstController:
            childEditorController.relationTwoFirstNameController.text,
        relationTwoScecondController:
            childEditorController.relationTwoScecondNameController.text,
        relationTwoThirdController:
            childEditorController.relationTwoThirdNameController.text,
        emergencyNameController:
            childEditorController.emergencyNameController.text,
        emergencyRelationController:
            childEditorController.emergencyRelationController.text,
        branchId: childEditorController.selectedBranchIndex.value.toString());

    print(addchildError);
    if (addchildError != "") {
      Get.defaultDialog(
          title: "Something went wrong".tr, middleText: addchildError);
    } else {
      Future.delayed(Duration(milliseconds: 200), () {
        Get.to(PaymentScreen(
            childId: widget.routename == 'register'
                ? "${GetStorage().read('childId')}"
                : "${GetStorage().read('addChildId')}",
            routeName: widget.routename));
      });
    }
  }

  void _addChildMobile() async {
    String addchildError = await authController.addChild(
        childFirstName: childEditorController.childFirstNameController.text,
        childSecondName: childEditorController.childSecondNameController.text,
        gender: childEditorController.selectedType == 'ولد' ? 'male' : 'female',
        emergencyNumber: childEditorController.emergencyNumberController.text,
        parentOneRealation: childEditorController.relationsOneController.text,
        parentOneEmail: childEditorController.emailOneController.text,
        parentOnePhone: childEditorController.phoneOneController.text,
        parentTwoRealation: childEditorController.relationsTwoController.text,
        parentTwoEmail: childEditorController.emailTwoController.text,
        parentTwoPhone: childEditorController.phoneTwoController.text,
        userId: "1",
        teacherId: childEditorController.selectedTeacherIndex.toString(),
        groupId: childEditorController.selectedGroupIndex.toString(),
        familyCard: childEditorController.familyCardPhoto,
        vaccinationCertificate: childEditorController.vaccinationCertificate,
        document: childEditorController.doctuumnet,
        actualselectedDate: childEditorController.actualselectedDate,
        relationOnefirstNameController:
            childEditorController.relationOnefirstNameController.text,
        relationOneSecondNameController:
            childEditorController.relationOneSecondNameController.text,
        relationOneThirdController:
            childEditorController.relationOneThirdController.text,
        relationTwoFirstController:
            childEditorController.relationTwoFirstNameController.text,
        relationTwoScecondController:
            childEditorController.relationTwoScecondNameController.text,
        relationTwoThirdController:
            childEditorController.relationTwoThirdNameController.text,
        emergencyNameController:
            childEditorController.emergencyNameController.text,
        emergencyRelationController:
            childEditorController.emergencyRelationController.text,
        branchId: childEditorController.selectedBranchIndex.value.toString());

    print(addchildError);
    if (addchildError != "") {
      Get.defaultDialog(
          title: "Something went wrong".tr, middleText: addchildError);
    } else {
      Get.to(BottomNavigationWidget());
    }
  }

  void _editChildWeb() async {
    String addchildError = await authController.editChildWeb(
        childFirstName: childEditorController.childFirstNameController.text,
        childSecondName: childEditorController.childSecondNameController.text,
        gender: childEditorController.selectedType == 'ولد' ? 'male' : 'female',
        emergencyNumber: childEditorController.emergencyNumberController.text,
        parentOneRealation: childEditorController.relationsOneController.text,
        parentOneEmail: childEditorController.emailOneController.text,
        parentOnePhone: childEditorController.phoneOneController.text,
        parentTwoRealation: childEditorController.relationsTwoController.text,
        parentTwoEmail: childEditorController.emailTwoController.text,
        parentTwoPhone: childEditorController.phoneTwoController.text,
        userId: "1",
        teacherId: childEditorController.selectedTeacherIndex.toString(),
        groupId: childEditorController.selectedGroupIndex.toString(),
        familyCard: childEditorController.familyCardPhoto,
        vaccinationCertificate: childEditorController.vaccinationCertificate,
        document: childEditorController.doctuumnet,
        actualselectedDate: childEditorController.actualselectedDate,
        relationOnefirstNameController:
            childEditorController.relationOnefirstNameController.text,
        relationOneSecondNameController:
            childEditorController.relationOneSecondNameController.text,
        relationOneThirdController:
            childEditorController.relationOneThirdController.text,
        relationTwoFirstController:
            childEditorController.relationTwoFirstNameController.text,
        relationTwoScecondController:
            childEditorController.relationTwoScecondNameController.text,
        relationTwoThirdController:
            childEditorController.relationTwoThirdNameController.text,
        emergencyNameController:
            childEditorController.emergencyNameController.text,
        emergencyRelationController:
            childEditorController.emergencyRelationController.text,
        childId: widget.childId,
        branchId: childEditorController.selectedBranchIndex.value.toString());

    print(addchildError);
    if (addchildError != "") {
      Get.defaultDialog(
          title: "Something went wrong".tr, middleText: addchildError);
    } else {
      Future.delayed(Duration(milliseconds: 200), () {
        Get.to(BottomNavigationWidget());
      });
    }
  }

  void _editChild() async {
    String addchildError = await authController.editChild(
        childFirstName: childEditorController.childFirstNameController.text,
        childSecondName: childEditorController.childSecondNameController.text,
        gender: childEditorController.selectedType == 'ولد' ? 'male' : 'female',
        emergencyNumber: childEditorController.emergencyNumberController.text,
        parentOneRealation: childEditorController.relationsOneController.text,
        parentOneEmail: childEditorController.emailOneController.text,
        parentOnePhone: childEditorController.phoneOneController.text,
        parentTwoRealation: childEditorController.relationsTwoController.text,
        parentTwoEmail: childEditorController.emailTwoController.text,
        parentTwoPhone: childEditorController.phoneTwoController.text,
        userId: "1",
        teacherId: childEditorController.selectedTeacherIndex.toString(),
        groupId: childEditorController.selectedGroupIndex.toString(),
        familyCard: childEditorController.familyCardPhoto,
        vaccinationCertificate: childEditorController.vaccinationCertificate,
        document: childEditorController.doctuumnet,
        actualselectedDate: childEditorController.actualselectedDate,
        relationOnefirstNameController:
            childEditorController.relationOnefirstNameController.text,
        relationOneSecondNameController:
            childEditorController.relationOneSecondNameController.text,
        relationOneThirdController:
            childEditorController.relationOneThirdController.text,
        relationTwoFirstController:
            childEditorController.relationTwoFirstNameController.text,
        relationTwoScecondController:
            childEditorController.relationTwoScecondNameController.text,
        relationTwoThirdController:
            childEditorController.relationTwoThirdNameController.text,
        emergencyNameController:
            childEditorController.emergencyNameController.text,
        emergencyRelationController:
            childEditorController.emergencyRelationController.text,
        childId: widget.childId,
        branchId: childEditorController.selectedBranchIndex.value.toString());

    print(addchildError);
    if (addchildError != "") {
      Get.defaultDialog(
          title: "Something went wrong".tr, middleText: addchildError);
    } else {
      Get.to(BottomNavigationWidget());
    }
  }

  void _registerAndavegatoToWeb() async {
    String registerError = await authController.registerWeb(
        username: childEditorController.nameController.text,
        phone: childEditorController.phoneController.text,
        email: childEditorController.emailController.text,
        password: childEditorController.passwordController.text,
        groupId: childEditorController.selectedGroupIndex.toString(),
        teacherId: childEditorController.selectedTeacherIndex.toString(),
        childFirstName: childEditorController.childFirstNameController.text,
        childSecondName: childEditorController.childSecondNameController.text,
        relationOnefirstNameController:
            childEditorController.relationOnefirstNameController.text,
        relationOneSecondNameController:
            childEditorController.relationOneSecondNameController.text,
        relationOneThirdController:
            childEditorController.relationOneThirdController.text,
        relationTwoFirstController:
            childEditorController.relationTwoFirstNameController.text,
        relationTwoScecondController:
            childEditorController.relationTwoScecondNameController.text,
        relationTwoThirdController:
            childEditorController.relationTwoThirdNameController.text,
        emergencyNameController:
            childEditorController.emergencyNameController.text,
        emergencyRelationController:
            childEditorController.emergencyRelationController.text,
        parentTwoRealation: childEditorController.relationsTwoController.text,
        parentTwoEmail: childEditorController.emailTwoController.text,
        parentTwoPhone: childEditorController.phoneTwoController.text,
        parentOneRealation: childEditorController.relationsOneController.text,
        parentOneEmail: childEditorController.emailOneController.text,
        parentOnePhone: childEditorController.phoneOneController.text,
        familyCard: childEditorController.familyCardPhoto,
        vaccinationCertificate: childEditorController.vaccinationCertificate,
        document: childEditorController.doctuumnet,
        emergencyNumber: childEditorController.emergencyNumberController.text,
        ageGroup: '1',
        userId: '1',
        birthDate: childEditorController.actualselectedDate,
        gender: childEditorController.selectedType == 'ولد' ? 'male' : 'female',
        branchId: childEditorController.selectedBranchIndex.value.toString());
    if (registerError != "") {
      Get.defaultDialog(
          title: "Something went wrong".tr, middleText: registerError);
    } else {
      await authController
          .login(
        childEditorController.emailController.text,
        childEditorController.passwordController.text,
      )
          .then((value) {
        Get.to(PaymentScreen(
            childId: widget.routename == 'register'
                ? "${GetStorage().read('childId')}"
                : "${GetStorage().read('addChildId')}",
            routeName: widget.routename));
      });
    }
  }

  void _registerAndavegatoToMobile() async {
    String registerError = await authController.register(
        username: childEditorController.nameController.text,
        phone: childEditorController.phoneController.text,
        email: childEditorController.emailController.text,
        password: childEditorController.passwordController.text,
        groupId: childEditorController.selectedGroupIndex.toString(),
        teacherId: childEditorController.selectedTeacherIndex.toString(),
        childFirstName: childEditorController.childFirstNameController.text,
        childSecondName: childEditorController.childSecondNameController.text,
        relationOnefirstNameController:
            childEditorController.relationOnefirstNameController.text,
        relationOneSecondNameController:
            childEditorController.relationOneSecondNameController.text,
        relationOneThirdController:
            childEditorController.relationOneThirdController.text,
        relationTwoFirstController:
            childEditorController.relationTwoFirstNameController.text,
        relationTwoScecondController:
            childEditorController.relationTwoScecondNameController.text,
        relationTwoThirdController:
            childEditorController.relationTwoThirdNameController.text,
        emergencyNameController:
            childEditorController.emergencyNameController.text,
        emergencyRelationController:
            childEditorController.emergencyRelationController.text,
        parentTwoRealation: childEditorController.relationsTwoController.text,
        parentTwoEmail: childEditorController.emailTwoController.text,
        parentTwoPhone: childEditorController.phoneTwoController.text,
        parentOneRealation: childEditorController.relationsOneController.text,
        parentOneEmail: childEditorController.emailOneController.text,
        parentOnePhone: childEditorController.phoneOneController.text,
        familyCard: childEditorController.familyCardPhoto,
        vaccinationCertificate: childEditorController.vaccinationCertificate,
        document: childEditorController.doctuumnet,
        emergencyNumber: childEditorController.emergencyNumberController.text,
        ageGroup: '1',
        userId: '1',
        actualselectedDate: childEditorController.actualselectedDate,
        gender: childEditorController.selectedType == 'ولد' ? 'male' : 'female',
        branchId: childEditorController.selectedBranchIndex.value.toString());
    if (registerError != "") {
      Get.defaultDialog(
          title: "Something went wrong".tr, middleText: registerError);
    } else {
      await authController
          .login(
        childEditorController.emailController.text,
        childEditorController.passwordController.text,
      )
          .then((value) {
        Get.to(PaymentScreen(
          childId: widget.routename == 'register'
              ? "${GetStorage().read('childId')}"
              : "${GetStorage().read('addChildId')}",
          routeName: widget.routename,
        ));
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
        childEditorController.updateChoice.value = true;
        childEditorController.actualselectedDate =
            picked.toString().substring(0, 10);
      });
  }

  var selectedDate = new HijriCalendar.now();

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
    );

    if (picked != null)
      setState(() {
        childEditorController.updateChoice.value = true;
        childEditorController.actualselectedDate =
            "${picked.hYear}/${picked.hMonth}/${picked.hDay}";
      });
  }

  final locale = Get.locale;

  @override
  Widget build(BuildContext context) {
    HijriCalendar.setLocal(Localizations.localeOf(context).languageCode);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(body: Obx(() {
        return (childEditorController.initLoadingProcess.value &&
                widget.routename == 'editChild')
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.accentColor,
                  ),
                ),
              )
            : SafeArea(
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
                                  childEditorController.step -= 1;
                                },
                              ),
                              Image.asset(
                                AppImages.appSubLogo,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          if (widget.routename == 'register')
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
                          if (widget.routename == 'addChild')
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
                            () => childEditorController
                                    .grouploadingProcess.value
                                ? Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        AppColors.accentColor,
                                      ),
                                    ),
                                  )
                                : childEditorController.groups.isEmpty
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
                                            itemCount: childEditorController
                                                .groups.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    childEditorController
                                                            .selectedGroupIndex =
                                                        childEditorController
                                                            .groups[index].id;
                                                    // if (widget.routename ==
                                                    //         'addChild' ||
                                                    //     widget.routename ==
                                                    //         'register') {
                                                    childEditorController
                                                        .fetchTeachers(
                                                            childEditorController
                                                                .selectedGroupIndex!);
                                                    // }
                                                  });
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 40,
                                                  margin:
                                                      EdgeInsets.only(left: 5),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        AppColors.primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color: childEditorController
                                                                  .selectedGroupIndex !=
                                                              childEditorController
                                                                  .groups[index]
                                                                  .id
                                                          ? AppColors
                                                              .primaryColor
                                                          : Colors.grey,
                                                      width: childEditorController
                                                                  .selectedGroupIndex ==
                                                              childEditorController
                                                                  .groups[index]
                                                                  .id
                                                          ? 3
                                                          : 1,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    childEditorController
                                                        .groups[index].title!,
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
                            () => childEditorController
                                    .teacherloadingProcess.value
                                ? Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        AppColors.accentColor,
                                      ),
                                    ),
                                  )
                                : childEditorController.teachersList.isEmpty
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
                                        itemCount: childEditorController
                                            .teachersList.length,
                                        itemBuilder: (_, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                childEditorController
                                                        .selectedTeacherIndex =
                                                    childEditorController
                                                        .teachersList[index].id;
                                              });
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              margin: EdgeInsets.only(top: 10),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: childEditorController
                                                              .selectedTeacherIndex ==
                                                          childEditorController
                                                              .teachersList[
                                                                  index]
                                                              .id
                                                      ? AppColors.primaryColor
                                                      : Colors.grey,
                                                  width: childEditorController
                                                              .selectedTeacherIndex ==
                                                          childEditorController
                                                              .teachersList[
                                                                  index]
                                                              .id
                                                      ? 3
                                                      : 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                children: [
                                                  // CircleImageWidget(
                                                  //   imagePath:
                                                  //       "$baseUrl${childEditorController.teachersList[index].profileImg!.replaceAll('public', 'storage')}",
                                                  // ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          locale == Locale('en')
                                                              ? childEditorController
                                                                  .teachersList[
                                                                      index]
                                                                  .englishName!
                                                              : childEditorController
                                                                  .teachersList[
                                                                      index]
                                                                  .arabicName!,
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .titleColor,
                                                          ),
                                                        ),
                                                        Text(
                                                          locale == Locale('en')
                                                              ? childEditorController
                                                                  .teachersList[
                                                                      index]
                                                                  .englishDescription!
                                                              : childEditorController
                                                                  .teachersList[
                                                                      index]
                                                                  .arabicDescription!,
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
                            controller:
                                childEditorController.childFirstNameController,
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
                            controller:
                                childEditorController.childSecondNameController,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please enter a valid value'.tr;
                              } else if (val.length <= 2) {
                                return 'Please enter a valid value'.tr;
                              }
                            },
                            hintText: 'Second Name'.tr,
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
                                      color: AppColors.accentColor
                                          .withOpacity(0.5),
                                    ),
                                    icon: Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Icon(Icons.arrow_drop_down),
                                    ),
                                    hint: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15.0),
                                      child: Text(
                                        (widget.routename == 'editChild' &&
                                                childEditorController
                                                        .updateChoice.value ==
                                                    false)
                                            ? childEditorController
                                                .editChildList[0].birthDate!
                                                .substring(0, 10)
                                            : childEditorController
                                                .actualselectedDate,
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
                                    items:
                                        childEditorController.dates.map((type) {
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
                                      color: AppColors.accentColor
                                          .withOpacity(0.5),
                                    ),
                                    icon: Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Icon(Icons.arrow_drop_down),
                                    ),
                                    hint: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15.0),
                                      child: Text(
                                        (widget.routename == 'editChild' &&
                                                childEditorController
                                                        .updateChoice.value ==
                                                    false)
                                            ? childEditorController
                                                .editChildList[0].gender!
                                            : childEditorController
                                                .selectedType,
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
                                        childEditorController
                                            .updateChoice.value = true;
                                        childEditorController.selectedType =
                                            newValue.toString();
                                      });
                                    },
                                    items:
                                        childEditorController.types.map((type) {
                                      return DropdownMenuItem(
                                        child: new Text(
                                          type.toString(),
                                          style: TextStyle(
                                            color: Color(0xff707070),
                                          ),
                                        ),
                                        value: type.toString(),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          CustomeTextFormField(
                            controller:
                                childEditorController.anthorNotesController,
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
                            controller: childEditorController
                                .relationOnefirstNameController,
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
                            controller: childEditorController
                                .relationOneSecondNameController,
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
                            controller: childEditorController
                                .relationOneThirdController,
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
                            controller:
                                childEditorController.relationsOneController,
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
                            controller:
                                childEditorController.emailOneController,
                            validator: (val) {
                              if (val.isEmpty) {
                                return 'Please enter a valid value'.tr;
                              }
                            },
                            hintText: 'Email'.tr,
                            prefixIcon: Image.asset(AppImages.appEmailIcon),
                          ),
                          CustomeTextFormField(
                            keyboardType: TextInputType.number,
                            controller:
                                childEditorController.phoneOneController,
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
                            controller: childEditorController
                                .relationTwoFirstNameController,
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
                            controller: childEditorController
                                .relationTwoScecondNameController,
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
                            controller: childEditorController
                                .relationTwoThirdNameController,
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
                            controller:
                                childEditorController.relationsTwoController,
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
                            controller:
                                childEditorController.emailTwoController,
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
                            keyboardType: TextInputType.number,
                            controller:
                                childEditorController.phoneTwoController,
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
                              childEditorController.familyCardPhoto =
                                  (await childEditorController.picker
                                      .pickImage(source: ImageSource.gallery))!;
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          'Attach a photo of the family card'
                                              .tr,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.accentColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Image.asset(
                                      (childEditorController
                                              .familyCardPhoto.path.isEmpty)
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
                              childEditorController.vaccinationCertificate =
                                  (await childEditorController.picker
                                      .pickImage(source: ImageSource.gallery))!;
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          'Attach of the vaccination certificates'
                                              .tr,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: AppColors.accentColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Image.asset(
                                      (childEditorController
                                              .vaccinationCertificate
                                              .path
                                              .isEmpty)
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
                              childEditorController.doctuumnet =
                                  (await childEditorController.picker
                                      .pickImage(source: ImageSource.gallery))!;
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Image.asset(
                                      (childEditorController
                                              .doctuumnet.path.isEmpty)
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
                                value: childEditorController.isSensitific,
                                onChanged: (val) {
                                  setState(() {
                                    childEditorController.isSensitific = val;
                                  });
                                },
                              )
                            ],
                          ),
                          childEditorController.isSensitific
                              ? TextFormField(
                                  controller: childEditorController
                                      .sensitificController,
                                  readOnly: childEditorController.isSensitific,
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
                                value: childEditorController.isFilming,
                                onChanged: (val) {
                                  setState(() {
                                    childEditorController.isFilming = val;
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
                            controller:
                                childEditorController.emergencyNameController,
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
                            ),
                          ),
                          TextFormField(
                            controller: childEditorController
                                .emergencyRelationController,
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
                            ),
                          ),
                          TextFormField(
                            controller:
                                childEditorController.emergencyNumberController,
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
                                    label: widget.routename == 'editChild'
                                        ? 'Save'.tr
                                        : 'Next'.tr,
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
              );
      })),
    );
  }
}

class MyDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyDialogState();
  }
}

class _MyDialogState extends State<MyDialog> {
  var selectedDate = new HijriCalendar.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 350,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30.0),
              child: HijriMonthPicker(
                lastDate: HijriCalendar()
                  ..hYear = 1445
                  ..hMonth = 9
                  ..hDay = 25,
                firstDate: HijriCalendar()
                  ..hYear = 1438
                  ..hMonth = 12
                  ..hDay = 25,
                onChanged: (HijriCalendar value) {
                  childEditorController.updateChoice.value = true;
                  setState(() {
                    print(value);
                    selectedDate = value;
                    childEditorController.actualselectedDate =
                        selectedDate.toString();
                    print(childEditorController.actualselectedDate);
                  });
                },
                selectedDate: selectedDate,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Spacer(),
                ActionButton(
                  width: 80,
                  label: 'Cancel'.tr,
                  onPressed: () {
                    Get.back();
                  },
                ),
                Spacer(),
                ActionButton(
                  width: 80,
                  label: 'Save'.tr,
                  onPressed: () {
                    Get.back();
                  },
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
