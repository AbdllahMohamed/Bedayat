import 'package:bedayat/models/teacher.dart';
import 'package:bedayat/services/teacher_services.dart';
import 'package:get/get.dart';

class TeacherController extends GetxController {
  var teacherList = <Teacher>[].obs;
  var loadingProcess = false.obs;

  void fetchTeachers(int groupId) async {
    try {
      loadingProcess(true);
      var teachers = await TeachersServices.getAll(groupId);
      if (teachers != null) {
        teacherList.value = teachers;
      }
    } finally {
      loadingProcess(false);
    }
  }
}
