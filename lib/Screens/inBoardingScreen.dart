import 'package:flutter/material.dart';
import 'package:myshop/Screens/shopLoginScreen.dart';
import 'package:myshop/model/onBoard_model.dart';
import 'package:myshop/network/chash_helper.dart';
import 'package:myshop/shared/Colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingModel> onModel = [
    OnBoardingModel(
        img: "assets/img/on2.jpg",
        body: "OnBoard Body 1",
        title: "OnBoard Title 1"),
    OnBoardingModel(
        img: "assets/img/on6.jpg",
        body: "OnBoard Body 2",
        title: "OnBoard Title 2"),
    OnBoardingModel(
        img: "assets/img/on7.jpg",
        body: "OnBoard Body 3",
        title: "OnBoard Title 3"),
  ];

  var pageController = PageController();

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(key: "onBoarding", value: true).then((value) {
      if (value) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ShopLoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [TextButton(onPressed: submit, child: Text("SKIP"))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == onModel.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                    print("last");
                  } else {
                    setState(() {
                      isLast = false;
                    });
                    print("Not last");
                  }
                },
                physics: BouncingScrollPhysics(),
                controller: pageController,
                itemBuilder: (context, index) =>
                    buildOnBoardItem(onModel[index]),
                itemCount: onModel.length,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: onModel.length,
                    axisDirection: Axis.horizontal,
                    effect: ExpandingDotsEffect(
                        dotColor: gray, activeDotColor: defaultColor),
                  ),
                  Spacer(),
                  FloatingActionButton(
                      onPressed: () {
                        if (isLast) {
                          submit();
                        } else {
                          pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linear);
                        }
                      },
                      child: Icon(Icons.arrow_forward_ios))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column buildOnBoardItem(OnBoardingModel model) {
    return Column(
      children: [
        Expanded(
            child: Image(image: AssetImage(model.img), fit: BoxFit.fitWidth)),
        Text(model.title,
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: "Quicksand Bold")),
        Text(model.body,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Quicksand Bold")),
      ],
    );
  }
}
