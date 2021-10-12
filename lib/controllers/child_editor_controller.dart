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
  TextEditingController nameController =
      new TextEditingController(text: "test");
  TextEditingController phoneController =
      new TextEditingController(text: "1111111111111");
  TextEditingController emailController =
      new TextEditingController(text: "test02@gmail.com");
  TextEditingController passwordController =
      new TextEditingController(text: "test2222222");
  //step Map
  double? latitude;
  double? longitude;

  //step two
  RxInt selectedBranchIndex = 1.obs;

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
  var loadingProcess = false.obs;
  var editChildLoadingProcess = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchBranches() async {
    try {
      loadingProcess(true);
      var fetchedbranches = await BranchesServices.getAll();
      if (fetchedbranches != null) {
        branches.value = fetchedbranches;
      }
    } finally {
      loadingProcess(false);
    }
  }

  void fetchGroups(int branchId) async {
    try {
      loadingProcess(true);
      var fetchedgroups = await GroupsServices.getAll(branchId);
      if (fetchedgroups != null) {
        groups.value = fetchedgroups;
      }
    } finally {
      loadingProcess(false);
    }
  }

  void fetchTeachers(int groupId) async {
    try {
      loadingProcess(true);
      var teachers = await TeachersServices.getAll(groupId);
      if (teachers != null) {
        teachersList.value = teachers;
      }
    } finally {
      loadingProcess(false);
    }
  }

  var addChildList = <AddChild>[].obs;

  Future<void> fetchchildern() async {
    try {
      loadingProcess(true);
      var addchild = await AddChildServices.getAll();
      if (addchild != null) {
        addChildList.value = addchild;
      }
    } finally {
      loadingProcess(false);
    }
  }

  var editChildList = <AddChild>[].obs;

  Future<void> getEditChildData(String childId) async {
    try {
      editChildLoadingProcess(true);
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
