import 'package:bedayat/UI/screens/register/registerStepSix.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/auth_services.dart';
import 'package:bedayat/controllers/package_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterStepFiveScreen extends StatefulWidget {
  final String nameController;
  final String phoneController;
  final String emailController;
  final String passwordController;
  final String location;
  final int selectedBranchIndex;
  final String childNameController;
  final String selectedAge;
  final String selectedType;
  final String emergencyNumberController;
  final String anthorNotesController;
  final String sensitificController;
  final String emailOneController;
  final String phoneOneController;
  final String emailTwoController;
  final String phoneTwoController;
  final XFile? familyCardPhoto;
  final XFile? vaccinationCertificate;
  final XFile? doctuumnet;

  const RegisterStepFiveScreen(
      {Key? key,
      required this.nameController,
      required this.phoneController,
      required this.emailController,
      required this.passwordController,
      required this.location,
      required this.selectedBranchIndex,
      required this.childNameController,
      required this.selectedAge,
      required this.selectedType,
      required this.emergencyNumberController,
      required this.anthorNotesController,
      required this.sensitificController,
      required this.emailOneController,
      required this.phoneOneController,
      required this.emailTwoController,
      required this.phoneTwoController,
      required this.familyCardPhoto,
      required this.vaccinationCertificate,
      required this.doctuumnet})
      : super(key: key);

  @override
  _RegisterStepFiveScreenState createState() => _RegisterStepFiveScreenState();
}

class _RegisterStepFiveScreenState extends State<RegisterStepFiveScreen> {
  AuthController authController = Get.put(AuthController());

  final PackageController packageController = Get.put(PackageController());
  int? selectedBankIndex;

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

    // String error = await authController.register(

    // );

    // if (error != "") {
    //   Get.defaultDialog(title: "حدث خطأ ما", middleText: error);
    // } else {
    //   //Get.to(HomeScreen());
    // }
    // Get.to(HomeScreen());
  }
  int? selectedPackageIndex = 1;

  late String price;
  late String tax;
  late int totalPackage;

  List<String> _banckImage = [
    AppImages.appMadaBank,
    AppImages.appStcpayBank,
  ];
  List<String> _banckName = [
    'مدى',
    'STC Pay',
  ];

  @override
  void initState() {
    super.initState();
    price = packageController.packageList[0].price!;
    tax = packageController.packageList[0].tax!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Obx(
              () => packageController.loadingProcess.value
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.accentColor,
                        ),
                      ),
                    )
                  : Directionality(
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
                          Container(
                            height: 100,
                            margin: EdgeInsets.all(10),
                            width: double.infinity,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: packageController.packageList.length,
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedPackageIndex = index;
                                    price = packageController
                                        .packageList[selectedPackageIndex!]
                                        .price!;
                                    tax = packageController
                                        .packageList[selectedPackageIndex!]
                                        .tax!;
                                    totalPackage = int.parse(price + tax);
                                  });
                                },
                                child: Container(
                                  width: 95,
                                  height: 95,
                                  margin: EdgeInsets.only(left: 5),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.selectedPaymentColor,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: selectedPackageIndex == index
                                          ? AppColors.primaryColor
                                          : Colors.grey,
                                      width:
                                          selectedPackageIndex == index ? 2 : 1,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        '${packageController.packageList[index].title!} \n',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        '${packageController.packageList[index].price!} \nريال',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ],
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
                                  '$price ريال',
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
                                  '$tax ريال',
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
                                  '$totalPackage ريال',
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
                                    selectedBankIndex = index;
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
                                        padding:
                                            const EdgeInsets.only(right: 15.0),
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
                              registerStepFive();
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
      ),
    );
  }
}
