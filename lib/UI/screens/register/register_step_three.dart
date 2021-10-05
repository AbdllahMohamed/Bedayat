import 'package:bedayat/UI/screens/register/register_step_four.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/branch_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterStepThreeScreen extends StatefulWidget {
  final String nameController;
  final String phoneController;
  final String emailController;
  final String passwordController;
  // final String location;

  RegisterStepThreeScreen({
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
    //required this.location,
  });

  @override
  _RegisterStepThreeScreenState createState() =>
      _RegisterStepThreeScreenState();
}

class _RegisterStepThreeScreenState extends State<RegisterStepThreeScreen> {
  int? selectedBranchIndex;
  final BranchController branchController = Get.put(BranchController());
  registerStepThreeS() async {
    if (selectedBranchIndex == null) {
      Get.defaultDialog(title: "حدث خطأ ما", middleText: 'يجب اختيار الفرع');
      return;
    } else {
      Get.to(RegisterStepFourScreen(
        nameController: widget.nameController,
        phoneController: widget.phoneController,
        emailController: widget.emailController,
        passwordController: widget.passwordController,
        //location: widget.location,
        selectedBranchIndex: selectedBranchIndex!,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    Row(
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
                    SizedBox(height: 20),
                    Row(
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
                            '3/6',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'اختر الفرع الاقرب لك',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.accentColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 20),
                    Obx(
                      () => branchController.loadingProcess.value
                          ? Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 130),
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.accentColor),
                                ),
                              ),
                            )
                          : branchController.branchsList.length == 0
                              ? Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 130.0),
                                    child: Text(
                                      'لاتوجد بيانات',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: AppColors.accentColor),
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      branchController.branchsList.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedBranchIndex = branchController
                                              .branchsList[index].id;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        height: 65,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: selectedBranchIndex ==
                                                    branchController
                                                        .branchsList[index].id
                                                ? AppColors.primaryColor
                                                : Colors.grey,
                                            width: selectedBranchIndex ==
                                                    branchController
                                                        .branchsList[index].id
                                                ? 2
                                                : 1,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              child: Image.asset(index.isEven
                                                  ? AppImages.appBranchOdd
                                                  : AppImages.appBranchEven),
                                            ),
                                            Expanded(
                                              child: Text(
                                                branchController
                                                    .branchsList[index].title!,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: AppColors.titleColor,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                    ),
                    SizedBox(height: 20),
                    ActionButton(
                        label: 'التالى',
                        onPressed: () async {
                          registerStepThreeS();
                        }),
                    SizedBox(height: 15),
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
