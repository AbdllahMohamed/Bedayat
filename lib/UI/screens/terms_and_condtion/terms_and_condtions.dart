import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Condtions'.tr),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Terms and Condtions'.tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'These terms and conditions must be found carefully before using the site or application or conduct any legally binding terms and conditions through electronic approval, application or use or use of the website :'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'First: Content:'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'a. an introduction::'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '1. “Learning Beginnings Company” is a closed joint stock company, and it is the company that owns the website and the mobile application and its head office is in Riyadh, Kingdom of Saudi Arabia, hereinafter referred to as “Bedayat”.'
                    .tr
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '2. “Terms and Conditions Agreement” is a binding agreement that governs the relationship between the beginnings of learning and the beneficiary and explains the bases that govern the use of the website or the mobile or tablet application. This agreement is subject to the provisions of the electronic transactions system in'
                    .tr
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '3. “The Beneficiary or Beneficiaries” is the natural or legal person who wishes to contract with Bidayat or benefit from the services provided through it, or uses the website or the application in any way.'
                    .tr
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'Scope and nature of services provided:'.tr.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '"It is edited in detail by Beginnings of Learning".'.tr.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'Terms of using the services:'.tr.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '1. The beneficiary must be at least 18 years old and have the legal authority to agree to these terms and conditions.'
                    .tr
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '2. Availability of legal capacity in the event that the beneficiary is a natural guardian or a legal representative of a third party.'
                    .tr
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '3. Compliance with these terms and conditions in addition to the applicable laws in the Kingdom of Saudi Arabia.'
                    .tr
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '4. Obligation to provide correct data and information when submitting content through the website or application. It is prohibited to submit false or misleading statements, whether or not they result in harm to others.'
                    .tr
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '5. Commitment to maintain all intellectual property rights of Bidayyat Company.'
                    .tr
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Second: Registration and reservation:'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'When the beneficiary registers on the website or application (since in order to benefit from some services, it is necessary to create an account, it is not permissible to use another person’s account), he declares on his own behalf and on behalf of his representatives agreeing to the following (the registration request means your acceptance and acknowledgment of the following):'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '1. All terms and conditions of the reservation.'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '2. All fees imposed, including taxes and fees of all kinds.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '3. Accepting financial responsibility for the payment of the reservation value.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '4. Compliance with the binding terms and conditions or any of their subsequent amendments.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '5. Use your information in accordance with the Privacy Policy.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '6. Verify all your data, and you acknowledge that you own the entered email and mobile number.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '7. "Bdayyat" company\'s cancellation and amendment policy.'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '8. Once the reservation is confirmed, the commitment is made between the beneficiary and Bidayat.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '9. "Bidayat" reserves the right to refuse any reservation or any reservation confirmation or provision of the service at its sole discretion without any liability to it.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '10. "Bdayyat" reserves the full right to correct any error that may occur in the advertised prices or in the services, and "Bdayyat" will correct it immediately upon knowledge of this, provided that this is done before commencing the implementation of the service, and the beneficiary has the choice between continuing the implementation after the correction or termination of the contract and refund what was paid.'
                    .tr
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '11. Bidayyat will not be liable for any delay or non-performance of your reservation if incorrect information is provided.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '12. You must verify all the data entered before confirming the reservation'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '13. The reservation is considered active from the date the beneficiary receives the confirmation email.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Third: Amendment and Cancellation:'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '1. Where any modification to the reservation can be made, you will be solely responsible for any additional expenses in this regard.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '2. Bidayat has the right to make an amendment to the reservation based on its unilateral will whenever the need arises, with the need to notify you of this amendment.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '3. Bidayat has the right to amend the service fees at any time without prior notice, bearing in mind that the amendment does not apply to existing applications (in progress). Once the beneficiary completes the application, the fees specified in the application will not change with the change of fees on the website or application.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '4. In the event of cancellation of the reservation by the beneficiary, an amount of five hundred riyals will be deducted from the total dues of the beneficiary at Bidayat as cancellation fees.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '5. Some amendment requests cannot always be fulfilled.'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '6. In the event of cancellation of the reservation by the beneficiary, the fees that were paid in advance shall be refunded, minus the cancellation fees, in addition to the value of the period the child spent in the beginnings or any other expenses in exchange for damages that may have been caused by the child.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '7. The reservation shall not be canceled except by submitting a written letter signed by the child’s guardian to the director of the branch in which the child is registered, or by notifying the guardian through the registered email when registering at Bidayyat to the following email: info@bedayaat.com.sa.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '8. In the event of refunds, they are subject to the cancellation policy of this reservation and the determination of the amount that will be refunded by “Bdayyat” (in cases where a refund is allowed).'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '9. Bidayat has the right to cancel your reservation in the event that you violate one of the essential conditions of these terms and conditions, provided that you are notified by the registered email of such cancellation, without any liability to it.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '10. If the cancellation request is submitted within ten days from the date of registration, and the beginnings of the cancellation request are accepted, the days prior to the cancellation request will be deducted in addition to the cancellation fees, and the remaining amounts will be refunded.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '11. If the cancellation request is submitted after ten days from the date of registration, the cancellation request will not be accepted and the beneficiary is not entitled to claim the fees previously paid for the monthly contracts.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '12. With regard to non-monthly contracts, the expiry of a period of one month or more from the date of registration, and in the event that the cancellation request is submitted within the first ten days of the following month, the work will be done In accordance with the provisions of paragraph (10) above, in addition to refunding the remainder of the value of the following months previously paid in advance, and in the event that a cancellation request is submitted after ten days have passed, the cancellation shall take place starting from the following month, in addition to refunding the remainder of the following months previously paid in advance only'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '13. Bidayat undertakes to refund the remainder of the amounts previously received within (10) working days from the date of notification of the desire to cancel the registration at Bidayat.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Fourth: Prohibited behavior:'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'You hereby agree to refrain from doing any of the following:'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '1. Undertaking not to exploit or disseminate the information or data that is displayed through Bidayyat to any other application or website outside of Bidayyat in any way whatsoever.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '2. Violating or tampering with Bidayat\'s networks or software.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '3. Involvement in or encouragement of any illegal act or related communications.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '4. Transmit files, data, or other materials that contain computer viruses, corrupted data, worms, "Trojan horses", or any commands or designs that may delete data or programming or lead to the disruption of the (Site) or lead to impeding the full use of any equipment or system for which it was designed.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Fifth: General Provisions:'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'a. Limitation of Liability:'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '1. “Bdayyat” is not responsible for any direct or indirect loss arising from the use of the site or application.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '2. The beneficiary acknowledges using the site at his own risk and Bdayat does not bear any responsibility for any damage or injury as a result of any user entering its site or being unable to access or use it.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '3. You are solely responsible for the registration and reservation of Bidayyat and the suitability of the services provided by it to the needs of your child, and Bidayat cannot be held accountable in this regard.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '4. You are also solely responsible for the information provided at the time of registration or reservation, and Bidayat cannot be held liable for any false or fraudulent information provided by you.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '5. You are solely responsible for any activity that takes place through your account without any liability to Bidayat.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '6. Bidayat will not be liable for losses resulting from any unauthorized use of your account, you may be liable for losses caused by Bidayat or others as a result of such unauthorized use.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '7. Bidayat has the right, without any liability, to cancel any account or registration at its absolute discretion and without notice or notice.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'b. Modify the terms and conditions:'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '1. Bidayyat reserves the right to amend these terms and conditions from time to time at its sole discretion in order to improve the work and service within Bidayyat without any liability to it.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '2. In the event that you object to any of the terms and conditions of these terms and conditions or that they are modified by Bidayat and notified to you, in this case, you have no choice but to stop using Bidayyat and terminate your membership account.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '3. You will be notified of the modifications, changes or improvements made through Bidayat via registered email, and they will become effective against you within (5) days from the date of your notification of them and the passage of this period without canceling the account and your use of Bidayyat is considered your acceptance of the modifications or updates.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'c. Intellectual property rights:'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '1. The Website and the Application contain trademarks, trade secrets, technologies, products, steps, and other rights owned by Bidayyat and/or third parties.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '2. Bidayyat does not grant you any license or right in any intellectual property right or any other right, and you may not reproduce, distribute, publish, display, upload or transmit any (Material) except as expressly permitted in these terms and conditions.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'd. Complaints Policy'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'Bidayyat always seeks to improve and develop the services provided through it, and to facilitate the beneficiaries, this policy has been included in order to provide services to the fullest, in addition to providing an effective communication channel with the beneficiaries, through the following:'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '1. Submitting a complaint within (2) days of its occurrence, otherwise the right to file a complaint shall forfeit.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '2. Investigate the complaint with full transparency and integrity.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '3. The complaint will be decided upon within a maximum of (10) days from the date of its submission, and if the complaint requires further study, you will be notified of that.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '4. In the event that the complaint is against an employee, the complaint will not be referred to the employee complained of for investigation or adjudication, but rather it will be presented to his direct manager, with the possibility of hearing his opinion based on the discretion of his direct manager.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '5. You can follow up on the complaint through the announced means of communication.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '6. A link to complaints has been included for the convenience of the beneficiaries.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'e. Dispute Resolution Policy:'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'Any dispute that may arise between Bidayyat and the beneficiary in relation to the services subject of the website or application shall be resolved amicably between the two parties as possible within (7) days from the date of its emergence.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'f. Compensation for damages:'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'You agree to indemnify Bidayyat and any of its subsidiaries, affiliates, partners, employees, directors, agents, licensors, service providers, contractors, suppliers or trainees from any litigation, including attorneys\' fees and court costs, or any claims by Third parties by your breach of these Terms and Conditions or the documents incorporated as references, or for any violation of laws or the rights of third parties.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'G. Notifications'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'Bidaya has the right to send all notices, modifications or other communications required or permitted by these Terms and Conditions by email, postal mail, text message, or by posting to Bidayyat, you will be deemed to have been notified upon receipt of the email or postal mail, Or simply by publishing on the beginnings.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'h. Consent and Undertaking:'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '1. These terms and conditions and their amendments, if any, constitute the entire agreement with you and supersede all previous oral or written agreements.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '2. Bdayyat’s failure to exercise any of its rights or to claim any compensation under these Terms and Conditions or its delay in exercising it or its failure to enforce these Terms and Conditions or Its delay in imposing it or its delay in it does not mean a waiver by it of what was mentioned.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '3. If any provision or part of this Agreement is found to be invalid, unenforceable, or void, the remaining provisions of these Terms and Conditions will remain in full force and effect.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '4. Your use of the website or application is your express consent to accept all these terms and conditions - which include all the aforementioned details - and to work according to them and to abide by what was stated in them after viewing them and understanding all of their contents.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '5. These terms and conditions include agreeing to the (Privacy and Cookie Policy), so we hope that you will review them for more information through these links.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '6. You also undertake to comply with any current or future instructions, guidelines, amendments or additions issued by Bedayat at the latter\'s absolute discretion without any liability to it.'
                    .tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
