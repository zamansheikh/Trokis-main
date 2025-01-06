import 'package:trokis/core/app_route/app_routes.dart';
import '../../../core/exports/exports.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  OnboardScreenState createState() => OnboardScreenState();
}

class OnboardScreenState extends State<OnboardScreen> {
  final PageController _pageController = PageController();

  var inticatorIndex = 1.obs;

  RxList<Map<String, dynamic>> textList = [
    {
      'topText': "Welcome to TROKIS",
    },
    {
      'topText': "Real-Time Tracking",
    },
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault.h),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 132.h),
              Flexible(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    inticatorIndex.value = index + 1;
                  },
                  itemCount: textList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Dimensions.radiusDefault.r),
                          ),
                          child: Image.asset(
                            "assets/images/onboarding${index + 1}.png",
                            width: double.infinity,
                            height: 435.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                              text: '${textList[index]['topText']}',
                              fontsize: 18.h,
                              fontWeight: FontWeight.w500,
                              bottom: 8.h,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 24.h),
              Obx(
                () => Center(
                  child: SizedBox(
                    height: 6.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: textList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: Container(
                            height: 9.h,
                            width:
                                inticatorIndex.value == index + 1 ? 25.w : 15.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                inticatorIndex.value == index + 1 ? 50.r : 12.r,
                              ),
                              color: inticatorIndex.value == index + 1
                                  ? AppColors.primaryColor
                                  : Colors.black26,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              if (inticatorIndex.value == textList.length)
                CustomButton(
                  isNetworkNeed: false,
                  onTap: () {
                    if (inticatorIndex.value < textList.length) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Get.toNamed(AppRoutes.signinScreen);
                    }
                  },
                  text: 'Get Started',
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () {}, child: Text('Skip')),
                    CustomButton(
                      width: 100.w,
                      isNetworkNeed: false,
                      onTap: () {
                        if (inticatorIndex.value < textList.length) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Get.toNamed(AppRoutes.signinScreen);
                        }
                      },
                      text: 'Next',
                    ),
                  ],
                ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
