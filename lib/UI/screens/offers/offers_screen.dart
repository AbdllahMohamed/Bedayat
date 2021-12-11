import 'package:bedayat/UI/screens/offers/offers_controller.dart';
import 'package:bedayat/const/const.dart';
import 'package:bedayat/models/offer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';

import '../../../utilities.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  OffersController offersController = Get.put(OffersController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Expanded(
            child: Obx(() => offersController.isLoading.value
                ? const OffersPlaceHolder()
                : offersController.isZeroItems.value
                    ? const Center(
                        child: Text("No Offers"),
                      )
                    : ListView.builder(
                        controller: offersController.listController,
                        itemCount: offersController.offersList.length,
                        itemBuilder: (context, i) {
                          var offer = offersController.offersList[i];
                          // DateTime p = DateTime.parse(notification.createdAt);
                          return OfferItem(
                            offer: offer,
                          );
                        }))));
  }
}

class OfferItem extends StatelessWidget {
  Offer offer;
  OfferItem({Key? key, required this.offer}) : super(key: key);
  final locale = Get.locale;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              fullImageUrl(shortUrl: offer.image),
              height: height * 0.23,
            ),
          ),
          Text(
            locale == Locale('en') ? offer.englishTitle : offer.arabicTitle,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            locale == Locale('en')
                ? offer.englishDescription
                : offer.arabicDescription,
          ),
          Text(
            "End at : ".tr +
                DateFormat('yyyy-MM-dd  kk:mm a')
                    .format(DateTime.parse(offer.endAt)),
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: offer.promoCode))
                  .then((value) {
                final snackBar = SnackBar(
                  content: Text('Copied to Clipboard'.tr),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              });
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: new BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      new BorderRadius.all(const Radius.circular(10.0))),
              child: Text(
                "Promo code : ".tr + offer.promoCode,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OffersPlaceHolder extends StatelessWidget {
  const OffersPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.grey.withOpacity(0.2),
      enabled: true,
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                title: Container(
                  color: Colors.grey,
                  width: double.infinity,
                  height: height * 0.23,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      color: Colors.grey,
                      width: width / 4,
                      height: 10,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      color: Colors.grey,
                      width: width / 1.5,
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey,
                      width: width / 1.5,
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey,
                      width: width / 1.5,
                      height: 10,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      color: Colors.grey,
                      width: width / 6,
                      height: 25,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
