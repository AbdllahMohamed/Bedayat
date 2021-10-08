import 'package:bedayat/utils/ar.dart';
import 'package:bedayat/utils/en.dart';
import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'ar': ar};
}
