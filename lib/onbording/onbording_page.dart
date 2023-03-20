import 'package:flutter/material.dart';
import 'package:onbordingscren/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Resources/colors_manager.dart';
import '../Resources/dimen_manager.dart';
import '../Resources/strings_manager.dart';
import '../Resources/styles_manager.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  bool isBack = false;

  List pages = [Page1(), Page2(), Page3()];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: AppMargin.m20),
            alignment: Alignment.topRight,
            child: TextButton(
                onPressed: () => _controller.jumpToPage(pages.length),
                child: isLastPage
                    ? Text(
                        "",
                      )
                    : Text(
                        AppStrings.skip,
                        style: getRegularStyle(
                            fontSize: 18, color: AppColors.black),
                      )),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    isLastPage = (value == 2);
                    isBack = value < 1;
                  });
                },
                children: List.generate(pages.length, (index) => pages[index])),
          ),
          isLastPage
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyWidget()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: AppPadding.p16),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.lightPrimary,
                    ),
                    child: Text(
                      AppStrings.done,
                      style: getRegularStyle(
                          color: AppColors.primary, fontSize: 15),
                    ),
                  ),
                )
              : Container(
                  width: double.infinity,
                  height: 75,
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: WormEffect(
                          dotWidth: 13,
                          dotHeight: 13,
                          activeDotColor: AppColors.primary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                          ///////////////////////////////
                        },
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.lightPrimary,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            AppStrings.next,
                            style: getRegularStyle(
                                color: AppColors.primary, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
