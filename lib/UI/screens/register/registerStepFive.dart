import 'package:bedayat/UI/screens/register/registerStepSix.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/package_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterStepFiveScreen extends StatefulWidget {
  @override
  _RegisterStepFiveScreenState createState() => _RegisterStepFiveScreenState();
}

class _RegisterStepFiveScreenState extends State<RegisterStepFiveScreen> {
  final PackageController packageController = Get.put(PackageController());
  int? selectedIndex;

  registerStepFive() {
    // if (!_formKey.currentState!.validate()) {
    //   return;
    // }
    // String error = await authController.Register(_email.text, _password.text);

    // if (error != "") {
    //   Get.defaultDialog(title: "حدث خطأ ما", middleText: error);
    // } else {
    //   Get.to(HomeScreen());
    // }

    //Get.to(HomeScreen());
  }

  List<String> _banckImage = [
    AppImages.appMadaBank,
    AppImages.appStcpayBank,
  ];
  List<String> _banckName = [
    'مدى',
    'STC Pay',
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Image.asset(
                      AppImages.appSubLogo,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'التسجيل',
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
                            '5/5',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'الدفع',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.accentColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Obx(
                    () => packageController.loadingProcess.value
                        ? Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.accentColor,
                              ),
                            ),
                          )
                        : Container(
                            height: 100,
                            margin: EdgeInsets.all(10),
                            width: double.infinity,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: packageController.packageList.length,
                              itemBuilder: (context, i) => Container(
                                width: 95,
                                height: 95,
                                margin: EdgeInsets.only(left: 5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.selectedPaymentColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'شهر \n${packageController.packageList[i].price!} \nريال',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
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
                      'الفاتورة',
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
                          'الاجمالى',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.accentColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '500 ريال',
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
                          'الضريبة',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.accentColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '75 ريال',
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
                          'الاجمالى',
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.accentColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '575 ريال',
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
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      'الفاتورة',
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
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
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
                              color: selectedIndex == index
                                  ? AppColors.primaryColor
                                  : Colors.grey,
                              width: selectedIndex == index ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Image.asset(_banckImage[index]),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                _banckName[index],
                                style: TextStyle(
                                  fontSize: 13,
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
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      'بالتسجيل فانت توافق علي الشروط و الاحكام',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.accentColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ActionButton(
                    label: 'التالى',
                    onPressed: () async {
                      Get.to(RegisterStepSixScreen());
                    },
                  ),
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
