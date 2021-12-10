import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Expanded(
      child: OffersPlaceHolder(),
    ));
  }
}

class OfferItem extends StatelessWidget {
  const OfferItem({Key? key}) : super(key: key);

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
              "https://img.freepik.com/free-vector/special-offer-sale-discount-banner_180786-46.jpg?size=626&ext=jpg",
              height: height * 0.23,
            ),
          ),
          Text(
            "Offer Name",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
              "Offer Description Offer Description Offer Description Offer Description"),
          Text(
            "End at : 1/1/2022",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: new BoxDecoration(
                color: Colors.red,
                borderRadius:
                    new BorderRadius.all(const Radius.circular(10.0))),
            child: Text(
              "Promo code : Go12",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
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
