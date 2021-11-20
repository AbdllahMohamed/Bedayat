import 'package:bedayat/models/add_child.dart';
import 'package:bedayat/models/branch.dart';
import 'package:bedayat/models/group.dart';
import 'package:bedayat/models/teacher.dart';
import 'package:bedayat/services/add_child_services.dart';
import 'package:bedayat/services/branch_services.dart';
import 'package:bedayat/services/edit_child_services.dart';
import 'package:bedayat/services/group_services.dart';
import 'package:bedayat/services/teacher_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChildEditorController extends GetxController {
  RxInt step = 0.obs;
  String? type; //new register edit

  //register step one
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  //step Map
  double? latitude;
  double? longitude;

  //step two
  RxInt selectedBranchIndex = 0.obs;

//step three
  TextEditingController childFirstNameController = TextEditingController();
  TextEditingController childSecondNameController = TextEditingController();

  TextEditingController relationOnefirstNameController =
      TextEditingController();
  TextEditingController relationOneSecondNameController =
      TextEditingController();
  TextEditingController relationOneThirdController = TextEditingController();

  TextEditingController relationTwoFirstNameController =
      TextEditingController();
  TextEditingController relationTwoScecondNameController =
      TextEditingController();
  TextEditingController relationTwoThirdNameController =
      TextEditingController();

  TextEditingController emergencyNumberController = TextEditingController();
  TextEditingController anthorNotesController = TextEditingController();
  TextEditingController sensitificController = TextEditingController();
  TextEditingController emailOneController = TextEditingController();
  TextEditingController phoneOneController = TextEditingController();
  TextEditingController emailTwoController = TextEditingController();
  TextEditingController relationsOneController = TextEditingController();
  TextEditingController relationsTwoController = TextEditingController();
  TextEditingController phoneTwoController = TextEditingController();
  TextEditingController emergencyNameController = TextEditingController();
  TextEditingController emergencyRelationController = TextEditingController();

  List<String> dates = ['Gregorian'.tr, 'Hijri'.tr];
  String actualselectedDate = 'birth date'.tr;

  List<String> types = ['male'.tr, 'female'.tr];
  String selectedType = 'Gender'.tr;

  bool isSensitific = false;
  bool isFilming = false;

  final ImagePicker picker = ImagePicker();

  XFile familyCardPhoto = XFile('');
  XFile vaccinationCertificate = XFile('');
  XFile doctuumnet = XFile('');

  int? selectedGroupIndex;
  int? selectedTeacherIndex;

  var teachersList = <Teacher>[].obs;
  var groups = <Group>[].obs;
  var branches = <Branch>[].obs;
  var branchloadingProcess = false.obs;
  var updateChoice = false.obs;
  var teacherloadingProcess = false.obs;
  var grouploadingProcess = false.obs;
  var editChildLoadingProcess = false.obs;
  var childrenLoadingProcess = false.obs;
  var initLoadingProcess = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchBranches() async {
    try {
      branchloadingProcess(true);
      var fetchedbranches = await BranchesServices.getAll();
      if (fetchedbranches != null) {
        branches.value = fetchedbranches;
      }
    } finally {
      branchloadingProcess(false);
    }
  }

  Future<void> fetchGroups(int branchId) async {
    try {
      grouploadingProcess(true);
      var fetchedgroups = await GroupsServices.getAll(branchId);
      if (fetchedgroups != null) {
        groups.value = fetchedgroups;
      }
    } finally {
      grouploadingProcess(false);
    }
  }

  Future<void> fetchTeachers(int groupId) async {
    try {
      teacherloadingProcess(true);
      var teachers = await TeachersServices.getAll(groupId);
      if (teachers != null) {
        teachersList.value = teachers;
      }
    } finally {
      teacherloadingProcess(false);
      initLoadingProcess(false);
    }
  }

  var addChildList = <AddChild>[].obs;

  Future<void> fetchchildern() async {
    try {
      childrenLoadingProcess(true);
      var addchild = await AddChildServices.getAll();
      if (addchild != null) {
        addChildList.value = addchild;
      }
    } finally {
      childrenLoadingProcess(false);
    }
  }

  var editChildList = <AddChild>[].obs;

  Future<void> getEditChildData(String childId) async {
    try {
      var editchild = await EditChildServices.getEditChildData(childId);
      if (editchild != null) {
        editChildList.value = editchild;
      }
    } finally {
      editChildLoadingProcess(false);
    }
  }

  getChildData() {}

  getLastChildData() {}
}
