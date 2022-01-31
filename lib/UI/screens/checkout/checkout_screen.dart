// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:im_stepper/stepper.dart';

class CheckoutScreen extends StatefulWidget {
  int childId;
  CheckoutScreen({Key? key, required this.childId}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  int activeStep = 0; // Initial step set to 5.

  int dotCount = 5;

  /// Generates jump steps for dotCount number of steps, and returns them in a row.
  Row steps() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(dotCount, (index) {
        return ElevatedButton(
          child: Text('${index + 1}'),
          onPressed: () {
            setState(() {
              activeStep = index;
            });
          },
        );
      }),
    );
  }

  /// Returns the next button widget.
  Widget nextButton() {
    return ElevatedButton(
      child: Text('Next'),
      onPressed: () {
        /// ACTIVE STEP MUST BE CHECKED FOR (dotCount - 1) AND NOT FOR dotCount To PREVENT Overflow ERROR.
        if (activeStep < dotCount - 1) {
          setState(() {
            activeStep++;
          });
        }
      },
    );
  }

  /// Returns the previous button widget.
  Widget previousButton() {
    return ElevatedButton(
      child: Text('Prev'),
      onPressed: () {
        // activeStep MUST BE GREATER THAN 0 TO PREVENT OVERFLOW.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
    );
  }

  /// Returns the header wrapping the header text.
  Widget header() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headerText(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Returns the header text based on the activeStep.
  String headerText() {
    switch (activeStep) {
      case 1:
        return 'Preface';

      case 2:
        return 'Table of Contents';

      case 3:
        return 'About the Author';

      case 4:
        return 'Publisher Information';

      case 5:
        return 'Reviews';

      case 6:
        return 'Chapters #1';

      default:
        return 'Introduction';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconStepper(
              stepColor: Colors.grey,
              activeStepColor: Colors.red,
              icons: [
                Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                ),
                Icon(
                  FontAwesomeIcons.utensils,
                  color: Colors.white,
                ),
                Icon(
                  Icons.payment,
                  color: Colors.white,
                ),
                // Icon(Icons.flag),
                // Icon(Icons.access_alarm),
                // Icon(Icons.supervised_user_circle),
              ],

              // activeStep property set to activeStep variable defined above.
              activeStep: activeStep,

              // This ensures step-tapping updates the activeStep.
              onStepReached: (index) {
                setState(() {
                  activeStep = index;
                });
              },
            ),
            // header(),

            Expanded(
              child: FittedBox(
                child: Center(
                  child: Text('$activeStep'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                previousButton(),
                nextButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
