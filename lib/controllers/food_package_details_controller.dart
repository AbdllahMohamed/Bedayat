import 'package:bedayat/models/food_package.dart';
import 'package:bedayat/models/food_package_details.dart';
import 'package:bedayat/services/food_package_details_services.dart';
import 'package:get/get.dart';

class FoodPackageDetailsController extends GetxController {
  var foodPackageDetailsList = <FoodPackageDetails>[].obs;
  //fisrt_week
  var firstWeek = <FoodPackageDetails>[];
  var breakFaskfirstWeek = <FoodPackageDetails>[];
  var lunchfirstWeek = <FoodPackageDetails>[];
  var drinkfirstWeek = <FoodPackageDetails>[];
  var snackfirstWeek = <FoodPackageDetails>[];

  //second_week
  var secondWeek = <FoodPackageDetails>[];
  var breakFaskSecondWeek = <FoodPackageDetails>[];
  var lunchSecondWeek = <FoodPackageDetails>[];
  var drinkSecondWeek = <FoodPackageDetails>[];
  var snackSecondWeek = <FoodPackageDetails>[];
  //third_week
  var thirdWeek = <FoodPackageDetails>[];
  var breakFaskThirdWeek = <FoodPackageDetails>[];
  var lunchThirdWeek = <FoodPackageDetails>[];
  var drinkThirdWeek = <FoodPackageDetails>[];
  var snackThirdWeek = <FoodPackageDetails>[];
  //fourth_week
  var fourthWeek = <FoodPackageDetails>[];
  var breakFaskFourthWeek = <FoodPackageDetails>[];
  var lunchFourthWeek = <FoodPackageDetails>[];
  var drinkFourthWeek = <FoodPackageDetails>[];
  var snackFourthWeek = <FoodPackageDetails>[];

  var loadingProcess = false.obs;

  void getFoodPackageDetails(int packageId) async {
    try {
      loadingProcess(true);

      await FoodPackageDetailsServices.getFoodPackageDetails(
        packageId,
        firstWeek,
        secondWeek,
        thirdWeek,
        fourthWeek,
      );
      firstWeek.forEach((e) {
        breakFaskfirstWeek = firstWeek
            .where((element) => element.mealType == 'breakfast')
            .toList();
      });
      firstWeek.forEach((e) {
        lunchfirstWeek =
            firstWeek.where((element) => element.mealType == 'lunch').toList();
      });
      firstWeek.forEach((e) {
        drinkfirstWeek =
            firstWeek.where((element) => element.mealType == 'drink').toList();
      });
      firstWeek.forEach((e) {
        snackfirstWeek =
            firstWeek.where((element) => element.mealType == 'snack').toList();
      });
      //second
      secondWeek.forEach((e) {
        breakFaskSecondWeek = secondWeek
            .where((element) => element.mealType == 'breakfast')
            .toList();
      });
      secondWeek.forEach((e) {
        lunchSecondWeek =
            secondWeek.where((element) => element.mealType == 'lunch').toList();
      });
      secondWeek.forEach((e) {
        drinkSecondWeek =
            secondWeek.where((element) => element.mealType == 'drink').toList();
      });
      secondWeek.forEach((e) {
        snackSecondWeek =
            secondWeek.where((element) => element.mealType == 'snack').toList();
      });
      //third
      thirdWeek.forEach((e) {
        breakFaskThirdWeek = thirdWeek
            .where((element) => element.mealType == 'breakfast')
            .toList();
      });
      thirdWeek.forEach((e) {
        lunchThirdWeek =
            thirdWeek.where((element) => element.mealType == 'lunch').toList();
      });
      thirdWeek.forEach((e) {
        drinkThirdWeek =
            thirdWeek.where((element) => element.mealType == 'drink').toList();
      });
      thirdWeek.forEach((e) {
        snackThirdWeek =
            thirdWeek.where((element) => element.mealType == 'snack').toList();
      });
      //fourth
      fourthWeek.forEach((e) {
        breakFaskFourthWeek = fourthWeek
            .where((element) => element.mealType == 'breakfast')
            .toList();
      });
      fourthWeek.forEach((e) {
        lunchFourthWeek =
            fourthWeek.where((element) => element.mealType == 'lunch').toList();
      });
      fourthWeek.forEach((e) {
        drinkFourthWeek =
            fourthWeek.where((element) => element.mealType == 'drink').toList();
      });
      fourthWeek.forEach((e) {
        snackFourthWeek =
            fourthWeek.where((element) => element.mealType == 'snack').toList();
      });
    } finally {
      loadingProcess(false);
    }
  }
}
