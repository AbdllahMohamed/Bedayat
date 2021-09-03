import 'package:bedayat/UI/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: onBordingBody(),
    );
  }

  Widget onBordingBody() => Container(
        child: SliderLayoutView(),
      );
}

class SliderLayoutView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  // ignore: unused_field
  int _currentPage = 0;
  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) => topSliderLayout();

  Widget topSliderLayout() => Container(
        child: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: sliderArrayList.length,
                itemBuilder: (ctx, i) => SlideItem(i),
              ),
            ],
          ),
        ),
      );
}

// ignore: must_be_immutable
class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.3),
      height: isActive ? 12 : 10,
      width: isActive ? 12 : 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

// ignore: must_be_immutable
class SlideItem extends StatefulWidget {
  int index;
  SlideItem(this.index);

  @override
  _SlideItemState createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(sliderArrayList[widget.index].sliderImageUrl!,
            height: double.infinity, width: double.infinity, fit: BoxFit.cover),
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0x870c0c0c),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0, right: 40),
            child: Image.asset(
              'assets/images/introductionLogo.png',
              width: 190,
              height: 95,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 170.0, right: 30),
            child: Text(
              sliderArrayList[widget.index].sliderHeading!,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 220.0, right: 15),
            child: Text(
              sliderArrayList[widget.index].sliderSubHeading!,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15.0, bottom: 15.0),
                child: InkWell(
                  onTap: () {
                    Get.to(LoginScreen());
                  },
                  child: Text(
                    Constants.SKIP,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: AlignmentDirectional.bottomCenter,
              margin: EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for (int i = 0; i < sliderArrayList.length; i++)
                    if (i == widget.index) SlideDots(true) else SlideDots(false)
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 15.0, bottom: 15.0),
                child: InkWell(
                  onTap: () {
                    if (widget.index < sliderArrayList.length - 1) {
                      setState(() {
                        widget.index++;
                      });
                    } else {
                      Get.to(LoginScreen());
                    }
                  },
                  child: Text(
                    Constants.NEXT,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Slider {
  final String? sliderImageUrl;
  final String? sliderHeading;
  final String? sliderSubHeading;

  Slider(
      {@required this.sliderImageUrl,
      @required this.sliderHeading,
      @required this.sliderSubHeading});
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: 'assets/images/introImage1.png',
      sliderHeading: Constants.SLIDER_HEADING_1,
      sliderSubHeading: Constants.SLIDER_SubHEADING_1),
  Slider(
      sliderImageUrl: 'assets/images/slider_Image_1.jpg',
      sliderHeading: Constants.SLIDER_HEADING_2,
      sliderSubHeading: Constants.SLIDER_SubHEADING_1),
  Slider(
      sliderImageUrl: 'assets/images/slider_Image_2.jpg',
      sliderHeading: Constants.SLIDER_HEADING_3,
      sliderSubHeading: Constants.SLIDER_SubHEADING_1),
];

class Constants {
  static const String SKIP = "تخطى";
  static const String NEXT = "التالى";
  static const String SLIDER_HEADING_1 = "نرعاهم من اجلك";
  static const String SLIDER_HEADING_2 = "نرعاهم من اجلك";
  static const String SLIDER_HEADING_3 = "نرعاهم من اجلك";
  static const String SLIDER_SubHEADING_1 =
      "اساليب حديثة للتعلم والاهتمام بحالة النفسية \n بطفلك  نحن نعلم مدى حبك لطفلك";
  static const String SLIDER_SubHEADING_2 = "";
  static const String SLIDER_SubHEADING_3 = "";
}
