import 'package:bedayat/models/slider_image.dart';
import 'package:bedayat/services/slider_image.dart';
import 'package:get/get.dart';

class SliderImagesController extends GetxController {
  var sliderImagesList = <SliderImage>[].obs;
  var loadingProcess = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSliderImages();
  }

  void fetchSliderImages() async {
    try {
      loadingProcess(true);
      var sliderImages = await SliderImagesServices.getAll();
      if (sliderImages != null) {
        sliderImagesList.value = sliderImages;
      }
    } finally {
      loadingProcess(false);
    }
  }
}
