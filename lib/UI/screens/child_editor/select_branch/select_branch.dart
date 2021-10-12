import 'package:bedayat/UI/screens/child_editor/child_editor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bedayat/UI/widgets/actionButton.dart';
import 'package:bedayat/app_colors/app_colors.dart';
import 'package:bedayat/app_images/app_images.dart';

class SelectBranchScreen extends StatefulWidget {
  final String routename;
  SelectBranchScreen({Key? key, required this.routename}) : super(key: key);
  @override
  _SelectBranchScreenState createState() => _SelectBranchScreenState();
}

class _SelectBranchScreenState extends State<SelectBranchScreen> {
  @override
  void initState() {
    super.initState();
    childEditorController.fetchBranches();
  }

  registerStepThreeS() async {
    // ignore: unnecessary_null_comparison
    if (childEditorController.selectedBranchIndex.value == null) {
      Get.defaultDialog(
          title: "Something went wrong".tr,
          middleText: 'Branch must be selected'.tr);
      return;
    } else {
      // Get.to(ChildFormScreen(
      childEditorController.step += 1;
      //   nameController: widget.nameController,
      //   phoneController: widget.phoneController,
      //   emailController: widget.emailController,
      //   passwordController: widget.passwordController,
      //   //location: widget.location,
      //   selectedBranchIndex: selectedBranchIndex!,
      // ));
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
                      widget.routename == 'editChild'
                          ? const SizedBox()
                          : IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                childEditorController.step -= 1;
                              },
                            ),
                      Image.asset(
                        AppImages.appSubLogo,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  if (widget.routename == 'register')
                    Row(
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
                            '3/6',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  if (widget.routename == 'addChild')
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
                    () => childEditorController.loadingProcess.value
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
                        : childEditorController.branches.length == 0
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 130.0),
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
                                itemCount:
                                    childEditorController.branches.length,
                                itemBuilder: (context, index) {
                                  var _currentBranch =
                                      childEditorController.branches[index];

                                  bool _isbranchSelected = childEditorController
                                          .selectedBranchIndex.value ==
                                      _currentBranch.id;

                                  return InkWell(
                                    onTap: () {
                                      childEditorController.selectedBranchIndex
                                          .value = _currentBranch.id!;
                                      setState(() {});
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      height: 65,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: _isbranchSelected
                                              ? AppColors.primaryColor
                                              : Colors.grey,
                                          width: _isbranchSelected ? 2 : 1,
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
                                                  ? _currentBranch.englistTitle!
                                                  : _currentBranch.arabicTitle!,
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
                        registerStepThreeS();
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
