import 'package:bedayat/UI/screens/child_editor/Account_information/account_information.dart';
import 'package:bedayat/UI/screens/child_editor/child_form/child_form.dart';
import 'package:bedayat/UI/screens/child_editor/select_branch/select_branch.dart';
import 'package:bedayat/UI/screens/child_editor/select_locatio_on_map/select_locatio_on_map.dart';
import 'package:bedayat/UI/screens/child_editor/select_location/select_location.dart';
import 'package:bedayat/controllers/child_editor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

ChildEditorController childEditorController = Get.put(ChildEditorController());

// ignore: must_be_immutable
class ChildEditorScreen extends StatefulWidget {
  final String routename;
  String? childId;

  ChildEditorScreen({Key? key, required this.routename, this.childId})
      : super(key: key);

  @override
  State<ChildEditorScreen> createState() => _ChildEditorScreenState();
}

class _ChildEditorScreenState extends State<ChildEditorScreen> {
  @override
  void initState() {
    super.initState();
    childEditorController.type = widget.routename;
  }

  @override
  Widget build(BuildContext context) {
    if (childEditorController.type == 'register') {
      return Obx(
        () => childEditorController.step.value == 0
            ? AccountInformation(
                routename: widget.routename,
              )
            : childEditorController.step.value == 1
                ? SelectLocationScreen(
                    routename: widget.routename,
                  )
                : childEditorController.step.value == 2
                    ? SelectLocationOnMapScreen(
                        routename: widget.routename,
                      )
                    : childEditorController.step.value == 3
                        ? SelectBranchScreen(
                            routename: widget.routename,
                          )
                        : childEditorController.step.value == 4
                            ? ChildFormScreen(
                                routename: widget.routename,
                              )
                            : SizedBox(),
      );
    } else if (widget.routename == 'addChild') {
      return Obx(
        () => childEditorController.step.value == 1
            ? SelectBranchScreen(
                routename: widget.routename,
              )
            : childEditorController.step.value == 2
                ? ChildFormScreen(
                    routename: widget.routename,
                  )
                : SizedBox(),
      );
    } else {
      return Obx(
        () => childEditorController.step.value == 1
            ? SelectLocationScreen(
                routename: widget.routename,
              )
            : childEditorController.step.value == 2
                ? SelectLocationOnMapScreen(
                    routename: widget.routename,
                  )
                : childEditorController.step.value == 3
                    ? SelectBranchScreen(
                        routename: widget.routename,
                      )
                    : childEditorController.step.value == 4
                        ? ChildFormScreen(
                            routename: widget.routename,
                            childId: widget.childId,
                          )
                        : SizedBox(),
      );
    }
  }
}
