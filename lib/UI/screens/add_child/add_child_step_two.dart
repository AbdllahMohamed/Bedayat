import 'package:bedayat/UI/screens/add_child/add_child_step_three.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';
import 'package:bedayat/controllers/add_child_controller.dart';
import 'package:bedayat/controllers/branch_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddChildStepTwoScreen extends StatefulWidget {
  @override
  _AddChildStepTwoScreenState createState() => _AddChildStepTwoScreenState();
}

class _AddChildStepTwoScreenState extends State<AddChildStepTwoScreen> {
  int? selectedBranchIndex;
  final BranchController branchController = Get.put(BranchController());
  final AddChildController addChildController = Get.put(AddChildController());

  addChildStepTwo() async {
    if (selectedBranchIndex == null) {
      Get.defaultDialog(
          title: "Something went wrong".tr,
          middleText: 'Branch must be selected'.tr);
      return;
    } else {
      Get.to(
        AddChildStepThreeScreen(
          selectedBranchIndex: selectedBranchIndex!,
          emergaceyNumber:
              addChildController.addChildList[0].emergencyNumber ?? "",
          anthorNotesController: addChildController.addChildList[0].notes ?? "",
          relationsOneController:
              addChildController.addChildList[0].parentOneRealation ?? "",
          emailOneController:
              addChildController.addChildList[0].parentOneEmail ?? "",
          phoneOneController:
              addChildController.addChildList[0].parentOnePhone ?? "",
          relationsTwoController:
              addChildController.addChildList[0].parentTwoRealation ?? "",
          emailTwoController:
              addChildController.addChildList[0].parentTwoEmail ?? "",
          phoneTwoController:
              addChildController.addChildList[0].parentTwoPhone ?? "",
          relationOnefirstNameController:
              addChildController.addChildList[0].relationOneFirstName ?? "",
          relationOneSecondNameController:
              addChildController.addChildList[0].relationOneSecondName ?? "",
          relationOneThirdNameController:
              addChildController.addChildList[0].relationOneThirdName ?? "",
          relationTwoFirstNameController:
              addChildController.addChildList[0].relationTwoFirstName ?? "",
          relationTwoScecondNameController:
              addChildController.addChildList[0].relationTwoScecondName ?? "",
          relationTwoThirdNameController:
              addChildController.addChildList[0].relationTwoThirdName ?? "",
          emergencyNameController:
              addChildController.addChildList[0].emergencyName ?? "",
          emergencyRelationController:
              addChildController.addChildList[0].emergencyRelation ?? "",
        ),
      );
    }
  }

  final locale = Get.locale;

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
                          '2/5',
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
                    'Choose the branch closest to you'.tr,
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
                                  padding: const EdgeInsets.only(top: 200.0),
                                  child: Text(
                                    'Not Found Data'.tr,
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
                                itemCount: branchController.branchsList.length,
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
                                        borderRadius: BorderRadius.circular(8),
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
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                            ),
                                            child: Image.asset(index.isEven
                                                ? AppImages.appBranchOdd
                                                : AppImages.appBranchEven),
                                          ),
                                          Expanded(
                                            child: Text(
                                              locale == Locale('en')
                                                  ? branchController
                                                      .branchsList[index]
                                                      .englistTitle!
                                                  : branchController
                                                      .branchsList[index]
                                                      .arabicTitle!,
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
                      label: 'Next'.tr,
                      onPressed: () async {
                        addChildStepTwo();
                      }),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
