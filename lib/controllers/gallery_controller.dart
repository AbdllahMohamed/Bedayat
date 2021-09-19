import 'package:bedayat/models/gallery.dart';
import 'package:bedayat/services/gallery_services.dart';
import 'package:get/get.dart';

class GalleryController extends GetxController {
  var galleryList = <Gallery>[].obs;
  var loadingProcess = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void fetchGallery(int childId) async {
    try {
      loadingProcess(true);
      var gallery = await GalleryServices.getAll(childId);
      if (gallery != null) {
        galleryList.value = gallery;
      }
    } finally {
      loadingProcess(false);
    }
  }
}
