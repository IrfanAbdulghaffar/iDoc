import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idoc/utils/color_constants.dart';

import '../../utils/app_constants.dart';
import '../../utils/extensions.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  static const routeName = "/DashboardScreen";

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final autoSizeGroup = AutoSizeGroup();
  final List<Widget> _pages = [
    PageOne(),
    PageTwo(),
    PageThree(),
    PageTwo(),
    PageOne(),
  ];
  List<String> iconList = [
    "assets/image/home.png",
    "assets/image/people.png",
    "assets/image/fitness.png",
    "assets/image/bar_code.png",
  ];
  List<String> titleList = [
    "Home",
    "Space",
    "Fitness",
    "Kiosk",
  ];
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent, // Background color of the status bar
      statusBarIconBrightness: Brightness.dark, // Icon color of the status bar
    ));
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(child: Container(
              color: Colors.white,
              width: double.infinity,
            )),
            Container(
              height: 200,

              decoration: BoxDecoration(
                  color: Colors.red,
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      ColorConstants.primary
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                  )
              ),

            )
          ],
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(3),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.pink,
                      ColorConstants.primary,
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 1.0),

                ),
                  color: ColorConstants.primary, shape: BoxShape.circle),
              child: Image.asset("assets/image/app_icon_white.png"),
            ),
            //params
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
              height: 85,
              activeIndex: _bottomNavIndex,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.softEdge,
              onTap: (index) => setState(() => _bottomNavIndex = index),
              itemCount: 4,
              tabBuilder: (int index, bool isActive) {
                final color = isActive ? ColorConstants.primary : ColorConstants.grey;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      iconList[index],
                      color: color,
                      scale: 2,
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: AutoSizeText(
                        titleList[index],
                        maxLines: 1,
                        style: TextStyle(color: color),
                        group: autoSizeGroup,
                      ),
                    )
                  ],
                );
              }
              ),
          body: _pages[_bottomNavIndex],
        ),
      ],
    );
  }
}

class PageOne extends StatefulWidget {
  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  List<String> images=[
    "assets/image/1.png",
    "assets/image/2.png",
    "assets/image/3.png",
  ];
  List<String> subHeading=[
    "Keep track of your health",
    "Stay healthy all the time with\nworkout and nutrition",
    "Follow up  your test results",
  ];

  List<String> heading=[
    "Check your Symptoms",
    "Health & Fitness",
    "Kiosks Results",
  ];
  List<Color> colorList=[
    CustomColor.fromHex("#862996"),
    CustomColor.fromHex("#FE81B0"),
    CustomColor.fromHex("#CA73D9"),
  ];

  int _currentIndex = 0;

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(height: 35,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.brown,
                    shape: BoxShape.circle,
                  ),
                  height: 48,
                  width: 48,
                  child: Image.asset("assets/image/profile_demo.png",),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Welcome, ',
                  style: AppConstants.heading2.copyWith(fontSize: 18,color: ColorConstants.primary),
                ),
                Text(
                  'Ahmad',
                  style: AppConstants.heading2.copyWith(fontSize: 18,color: ColorConstants.primary,fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Image.asset("assets/image/notification.png",height: 28,width: 28,),
              ],
            ),
            const SizedBox(height: 15,),
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, _) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: colorList[index],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            heading[index],
                            style: AppConstants.heading2.copyWith(fontSize: 16,color: ColorConstants.white,fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            subHeading[index],
                            style: AppConstants.heading2.copyWith(fontSize: 12,color: ColorConstants.white,fontWeight: FontWeight.normal),
                          ),
                          const Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 18,vertical: 8),
                            decoration: BoxDecoration(
                              
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Text(
                              'Get Started',
                              style: AppConstants.heading2.copyWith(fontSize: 15,color:colorList[index],fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle
                        ),
                        child: Image.asset(
                          images[index],
                          height: 110,
                          width: 110,
                        ),
                      ),
                    ],
                  ),
                );
              },
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 160,
                viewportFraction: 1.0,
                onPageChanged: (index, _) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 8,),
            DotsIndicator(
              dotsCount: images.length,
              position: _currentIndex.round(),
              decorator: DotsDecorator(
                size: Size.square(9.0),
                activeSize: Size(18.0, 9.0),
                activeColor: ColorConstants.primary,
                spacing: EdgeInsets.all(3.0),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              Text(
                'Other Services',
                style: AppConstants.heading2.copyWith(fontSize: 18,color: ColorConstants.black,fontWeight: FontWeight.w600),
              ),
            ],),
            const SizedBox(height: 15,),
            Row(children: [
              Expanded(

                child: Container(
                  height: 110,
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration:BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5
                        )
                      ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/image/medical encyclopedia.png",height: 35,width: 35 ,),
                      Text('Medical\nEncyclopedia',textAlign: TextAlign.center, style: AppConstants.heading2.copyWith(fontSize: 12,color: ColorConstants.black,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: Container(
                  height: 110,
                  padding: const EdgeInsets.all(12.0),
                  decoration:BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5
                        )
                      ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/image/svgexport.png",height: 35,width: 35 ,),
                      Text('Health\nAdvice',textAlign: TextAlign.center, style: AppConstants.heading2.copyWith(fontSize: 12,color: ColorConstants.black,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: Container(
                  height: 110,
                  padding: const EdgeInsets.all(12.0),
                  decoration:BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5
                        )
                      ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 5,),
                      Image.asset("assets/image/nutrition.png",height: 35,width: 35 ,),
                      Expanded(child: Center(child: Text('Nutrition',textAlign: TextAlign.center, style: AppConstants.heading2.copyWith(fontSize: 12,color: ColorConstants.black,fontWeight: FontWeight.w600),))),
                    ],
                  ),
                ),
              ),
            ],),
            const SizedBox(height: 20,),
            Row(children: [
              Text(
                'Health Services',
                style: AppConstants.heading2.copyWith(fontSize: 18,color: ColorConstants.black,fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              Text(
                'See All',
                style: AppConstants.heading2.copyWith(fontSize: 14,color: ColorConstants.black,fontWeight: FontWeight.normal),
              ),

            ],),
            Expanded(child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                padding: const EdgeInsets.only(top: 10,bottom: 17),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 3),
                    decoration:BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    child: Row(
                      children: [
                      Image.asset("assets/image/Image.png",height: 100,width: 100,),
                      const SizedBox(width: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Medical Encyclopedia',textAlign: TextAlign.center, style: AppConstants.heading2.copyWith(fontSize: 15,color: CustomColor.fromHex("#22206B"),fontWeight: FontWeight.normal),),
                          Text('General Health',textAlign: TextAlign.center, style: AppConstants.heading2.copyWith(fontSize: 13,color: Colors.black54,fontWeight: FontWeight.normal),),
                        ],
                      ),
                     ],
                    ),
                  );
                }),)
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page Two'),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page Three'),
    );
  }
}
