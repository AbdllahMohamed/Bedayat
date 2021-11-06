import 'package:bedayat/UI/screens/food_menu/food_menu.dart';
import 'package:bedayat/UI/screens/payment_web_view/payment_web_view.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/food_package_controller.dart';
import 'package:bedayat/controllers/package_controller.dart';
import 'package:bedayat/controllers/payment_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

int? selectedPackageIndex = 0;
int? selectedFoodPackageIndex = 0;
TextEditingController streetController = new TextEditingController();
TextEditingController cityController = new TextEditingController();
TextEditingController stateController = new TextEditingController();
TextEditingController postCodeController = new TextEditingController();
TextEditingController givenNameController = new TextEditingController();
TextEditingController surnameController = new TextEditingController();
String? seletctedBank;
String? peroid = 'from7to2';
String actualselectedDate = 'Date'.tr;

class PaymentScreen extends StatefulWidget {
  final String childId;
  final String routeName;

  const PaymentScreen({
    Key? key,
    required this.childId,
    required this.routeName,
  }) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentController paymentController = Get.put(PaymentController());

  final _formKey = GlobalKey<FormState>();

  final PackageController packageController = Get.put(PackageController());
  final FoodPackageController foodPackageController =
      Get.put(FoodPackageController());

  List<String> _banckImage = [
    AppImages.appMadaBank,
    AppImages.appVisa,
    AppImages.appMasterCaed,
    AppImages.appStcpayBank,
    AppImages.appAmex,
  ];
  List<String> _banckName = [
    'mada',
    'visa',
    'master_card',
    'stc_pay',
    'amex',
  ];

  List<String> _peroids = [
    'من 2 الى 7',
    'من 5 الى 7',
  ];
  String _selectedPeroid = 'من 2 الى 7';
  int? selectedBankIndex;
  int? updatePakageIndex = 0;
  int? updateFoodPakageIndex = 0;

  registerStepFive() async {
    if (actualselectedDate == 'Date'.tr) {
      Get.defaultDialog(
          title: "Something went wrong".tr,
          middleText: 'Please choose the date'.tr);
      return;
    }

    if (selectedFoodPackageIndex == 0) {
      Get.defaultDialog(
          title: "Something went wrong".tr,
          middleText: 'Please choose your Food Package'.tr);
      return;
    }

    if (!_formKey.currentState!.validate()) {
      return;
    }

    String error = await paymentController.getCheckoutId(
        packageId: selectedPackageIndex.toString(),
        email: '${GetStorage().read('userEmail')}',
        street: streetController.text,
        city: cityController.text,
        state: stateController.text,
        postcode: postCodeController.text,
        givenName: givenNameController.text,
        surname: surnameController.text,
        paymentMethod: seletctedBank,
        childId: widget.childId.toString(),
        startAt: actualselectedDate,
        foodPackageId: selectedFoodPackageIndex == 0
            ? null
            : selectedFoodPackageIndex.toString());

    print((selectedPackageIndex!).toString());
    print((selectedFoodPackageIndex!).toString());
    print('${GetStorage().read('userEmail')}');
    print(streetController.text);
    print(cityController.text);
    print(stateController.text);
    print(postCodeController.text);
    print(givenNameController.text);
    print(surnameController.text);
    print(seletctedBank);
    print(widget.childId);
    print(actualselectedDate);

    print(error);
    if (error != "") {
      Get.defaultDialog(title: "حدث خطأ ما", middleText: error);
    } else {
      Get.to(
        PaymentWebviewScreen(
          checkoutId: "${GetStorage().read('checkoutId')}",
          routeName: widget.routeName,
        ),
      );
    }
  }

  void _changePakge(peroid) {
    print(
        'packageController.packageList.length ${packageController.packageList.length}');

    setState(() {
      packageController.pakagesSelection = packageController.packageList
          .where((item) => item.period == peroid)
          .toList();
      print(packageController.pakagesSelection.length);
    });
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
        actualselectedDate = picked.toString().substring(0, 10);
      });
  }

  final locale = Get.locale;
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
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
                  ),
                  SizedBox(height: 20),
                  if (widget.routeName == 'home')
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'payment'.tr,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (widget.routeName == 'addChild')
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
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
                              '4/5',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  if (widget.routeName == 'register')
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
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
                              '5/6',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Start From'.tr + '  :',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: () {
                            _selectMeldadyDate(context);
                          },
                          icon: Icon(Icons.date_range)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        actualselectedDate,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                          left: 20,
                          bottom: 10,
                        ),
                        child: Text(
                          'Choose the period :'.tr,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.accentColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          width: 120,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              iconEnabledColor: Color(0xffAA9E9E),
                              isExpanded: true,
                              iconSize: 30,
                              icon: Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: Icon(Icons.arrow_drop_down),
                              ),
                              hint: Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Text(
                                  _selectedPeroid,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.accentColor,
                                  ),
                                ),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedPeroid = newValue.toString();
                                });
                                if (_selectedPeroid == 'من 2 الى 7')
                                  _changePakge('from7to2');
                                if (_selectedPeroid == 'من 5 الى 7')
                                  _changePakge('from7to5');
                              },
                              items: _peroids.map((country) {
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => packageController.loadingProcess.value
                        ? Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 100, bottom: 70),
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.accentColor,
                                ),
                              ),
                            ),
                          )
                        : packageController.pakagesSelection.length == 0
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30.0, bottom: 30),
                                  child: Text(
                                    'Not Found Data'.tr,
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: AppColors.accentColor),
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.only(
                                    right: 10, left: 10, bottom: 10),
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 105,
                                      child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: packageController
                                            .pakagesSelection.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                selectedPackageIndex =
                                                    packageController
                                                        .pakagesSelection[index]
                                                        .id!;
                                                updatePakageIndex = index;
                                              });
                                            },
                                            child: Container(
                                              width: 95,
                                              height: 95,
                                              margin: EdgeInsets.only(left: 5),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: AppColors
                                                    .selectedPaymentColor,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: selectedPackageIndex ==
                                                          packageController
                                                              .pakagesSelection[
                                                                  index]
                                                              .id
                                                      ? AppColors.primaryColor
                                                      : Colors.grey,
                                                  width: selectedPackageIndex ==
                                                          packageController
                                                              .pakagesSelection[
                                                                  index]
                                                              .id
                                                      ? 3
                                                      : 1,
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    locale == Locale('en')
                                                        ? '${packageController.pakagesSelection[index].englishTitle!}'
                                                        : '${packageController.pakagesSelection[index].arabicTitle!}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                  Text(
                                                    '${packageController.pakagesSelection[index].price! + '\n' + 'Rial'.tr} ',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 35,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 17,
                                      ),
                                      child: Text(
                                        'Food Menu :'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                    Obx(
                                      () =>
                                          foodPackageController
                                                  .loadingProcess.value
                                              ? Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 100,
                                                            bottom: 70),
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        AppColors.accentColor,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : foodPackageController
                                                      .foodPackageList.isEmpty
                                                  ? Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 30.0,
                                                                bottom: 30),
                                                        child: Text(
                                                          'Not Found Data'.tr,
                                                          style: TextStyle(
                                                              fontSize: 22,
                                                              color: AppColors
                                                                  .accentColor),
                                                        ),
                                                      ),
                                                    )
                                                  : ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount:
                                                          foodPackageController
                                                              .foodPackageList
                                                              .length,
                                                      itemBuilder:
                                                          (context, i) =>
                                                              InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            selectedFoodPackageIndex =
                                                                foodPackageController
                                                                    .foodPackageList[
                                                                        i]
                                                                    .id;
                                                            updateFoodPakageIndex =
                                                                i;
                                                          });
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: selectedFoodPackageIndex ==
                                                                        foodPackageController
                                                                            .foodPackageList[
                                                                                i]
                                                                            .id
                                                                    ? AppColors
                                                                        .primaryColor
                                                                    : AppColors
                                                                        .borderColor,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            child:
                                                                ExpansionPanelList(
                                                              animationDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          500),
                                                              children: [
                                                                ExpansionPanel(
                                                                  headerBuilder:
                                                                      (context,
                                                                          isExpanded) {
                                                                    return ListTile(
                                                                      title:
                                                                          Text(
                                                                        locale ==
                                                                                Locale('en')
                                                                            ? foodPackageController.foodPackageList[i].englishTitle
                                                                            : foodPackageController.foodPackageList[i].arabicTitle,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              AppColors.titleColor,
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  body: Column(
                                                                    children: [
                                                                      ListTile(
                                                                        leading:
                                                                            FaIcon(FontAwesomeIcons.utensils),
                                                                        title:
                                                                            Text(
                                                                          'breakfast'
                                                                              .tr,
                                                                          style:
                                                                              TextStyle(color: Colors.black),
                                                                        ),
                                                                        trailing:
                                                                            Icon(
                                                                          Icons
                                                                              .check_circle_rounded,
                                                                          color: foodPackageController.foodPackageList[i].breakfastAvailability
                                                                              ? Colors.green
                                                                              : Colors.grey,
                                                                          size:
                                                                              28,
                                                                        ),
                                                                      ),
                                                                      ListTile(
                                                                        leading:
                                                                            FaIcon(FontAwesomeIcons.hamburger),
                                                                        title:
                                                                            Text(
                                                                          'lunch'
                                                                              .tr,
                                                                        ),
                                                                        trailing:
                                                                            Icon(
                                                                          Icons
                                                                              .check_circle_rounded,
                                                                          color: foodPackageController.foodPackageList[i].lunchAvailability
                                                                              ? Colors.green
                                                                              : Colors.grey,
                                                                          size:
                                                                              28,
                                                                        ),
                                                                      ),
                                                                      ListTile(
                                                                        leading:
                                                                            FaIcon(FontAwesomeIcons.cookieBite),
                                                                        title:
                                                                            Text(
                                                                          'snack'
                                                                              .tr,
                                                                        ),
                                                                        trailing:
                                                                            Icon(
                                                                          Icons
                                                                              .check_circle_rounded,
                                                                          color: foodPackageController.foodPackageList[i].snackAvailability
                                                                              ? Colors.green
                                                                              : Colors.grey,
                                                                          size:
                                                                              28,
                                                                        ),
                                                                      ),
                                                                      ListTile(
                                                                        leading:
                                                                            FaIcon(FontAwesomeIcons.mugHot),
                                                                        title:
                                                                            Text(
                                                                          'juice or milk'
                                                                              .tr,
                                                                        ),
                                                                        trailing:
                                                                            Icon(
                                                                          Icons
                                                                              .check_circle_rounded,
                                                                          color: foodPackageController.foodPackageList[i].drinkAvailability
                                                                              ? Colors.green
                                                                              : Colors.grey,
                                                                          size:
                                                                              28,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              15,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            ActionButton(
                                                                              width: MediaQuery.of(context).size.width * 0.4,
                                                                              label: "View The Menu".tr,
                                                                              height: 40,
                                                                              onPressed: () {
                                                                                Get.to(FoodMenuScreen(
                                                                                  packageId: foodPackageController.foodPackageList[i].id,
                                                                                ));
                                                                              },
                                                                            ),
                                                                            Spacer(),
                                                                            Text(
                                                                              '\$${foodPackageController.foodPackageList[i].price}  ' + "${'Rial'.tr}",
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              15),
                                                                    ],
                                                                  ),
                                                                  isExpanded:
                                                                      _expanded,
                                                                  canTapOnHeader:
                                                                      true,
                                                                ),
                                                              ],
                                                              expansionCallback:
                                                                  (panelIndex,
                                                                      isExpanded) {
                                                                _expanded =
                                                                    !_expanded;
                                                                setState(() {});
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                    ),
                                    SizedBox(
                                      height: 35,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Text(
                                        'Pill :'.tr,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Price :'.tr,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.accentColor,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          selectedPackageIndex == 0
                                              ? SizedBox()
                                              : Text(
                                                  '${(double.parse(packageController.pakagesSelection[updatePakageIndex!].price!) + double.parse(foodPackageController.foodPackageList[updateFoodPakageIndex!].price)).toString()} ${'Rial'.tr}',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Tax :'.tr,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.accentColor,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          selectedPackageIndex == 0
                                              ? SizedBox()
                                              : Text(
                                                  '${packageController.pakagesSelection[updatePakageIndex!].tax!} ${'Rial'.tr}',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 8,
                                      ),
                                      child: Divider(
                                        color: Color(0xffE9E1E1),
                                        thickness: 1.5,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Total :'.tr,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: AppColors.accentColor,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          selectedPackageIndex == 0
                                              ? SizedBox()
                                              : Text(
                                                  '${(double.parse(packageController.pakagesSelection[updatePakageIndex!].price!) + double.parse(foodPackageController.foodPackageList[updateFoodPakageIndex!].price) + double.parse(packageController.pakagesSelection[updatePakageIndex!].tax!)).toString()} ${'Rial'.tr}',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: AppColors.titleColor,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'Pill :'.tr,
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.titleColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _banckName.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedBankIndex = index;
                            seletctedBank = _banckName[selectedBankIndex!];
                            print(seletctedBank);
                          });
                        },
                        child: Container(
                          height: 60,
                          margin: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: selectedBankIndex == index
                                  ? AppColors.primaryColor
                                  : Colors.grey,
                              width: selectedBankIndex == index ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Image.asset(_banckImage[index]),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                _banckName[index],
                                style: TextStyle(
                                  fontSize: 17,
                                  color: AppColors.titleColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'Requirments for Payment'.tr,
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.titleColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: givenNameController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                        if (val.length < 3) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.person, color: AppColors.accentColor),
                        hintText: 'First Name'.tr,
                        hintStyle: TextStyle(color: AppColors.accentColor),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: surnameController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                        if (val.length < 3) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.person, color: AppColors.accentColor),
                        hintText: 'Second Name'.tr,
                        hintStyle: TextStyle(color: AppColors.accentColor),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: streetController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                        if (val.length < 3) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.home_rounded,
                            color: AppColors.accentColor),
                        hintText: 'street'.tr,
                        hintStyle: TextStyle(color: AppColors.accentColor),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: cityController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                        if (val.length < 3) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.home_outlined,
                            color: AppColors.accentColor),
                        hintText: 'city'.tr,
                        hintStyle: TextStyle(color: AppColors.accentColor),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: stateController,
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                        if (val.length < 3) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_city_rounded,
                            color: AppColors.accentColor),
                        hintText: 'district'.tr,
                        hintStyle: TextStyle(color: AppColors.accentColor),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextFormField(
                      controller: postCodeController,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please enter a valid value'.tr;
                        }
                        if (val.length < 3) {
                          return 'Please enter a valid value'.tr;
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.post_add_sharp,
                            color: AppColors.accentColor),
                        hintText: 'Postal code'.tr,
                        hintStyle: TextStyle(color: AppColors.accentColor),
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'By registering, you agree to the terms and conditions'
                          .tr,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.accentColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Obx(() {
                    return paymentController.loadingProcess.value
                        ? Center(child: CircularProgressIndicator())
                        : ActionButton(
                            label: 'Confirm'.tr,
                            onPressed: () async {
                              registerStepFive();
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
    );
  }
}
