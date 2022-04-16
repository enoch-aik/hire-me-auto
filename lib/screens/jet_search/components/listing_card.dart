import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hire_me_auto/src/constants/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ListingCard extends StatefulWidget {
  const ListingCard({Key? key}) : super(key: key);

  @override
  State<ListingCard> createState() => _ListingCardState();
}

class _ListingCardState extends State<ListingCard> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget showImage({imageUrl}) {
      return SizedBox(
        width: 382.w,
        height: 248.h,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    List<String> carouselImageUrl = [
      'assets/images/private_jet.png',
      'assets/images/private_jet2.png',
      'assets/images/private_jet3.png',
      'assets/images/private_jet4.png'
    ];

    Widget buildIndicator() => AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: carouselImageUrl.length,
          effect: const JumpingDotEffect(
              dotColor: Colors.white,
              activeDotColor: Colors.black,
              dotHeight: 9,
              dotWidth: 9),
        );
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 21.h, horizontal: 16.w),
      child: Card(
        elevation: 4.h,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    CarouselSlider.builder(
                        itemCount: carouselImageUrl.length,
                        itemBuilder: (context, index, realIndex) {
                          final urlImage = carouselImageUrl[index];
                          return showImage(imageUrl: urlImage);
                        },
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              activeIndex = index;
                            });
                          },
                          autoPlay: true,
                          autoPlayCurve: Curves.easeInToLinear,
                          pageSnapping: true,
                          viewportFraction: 1,
                        )),
                    Positioned(
                        bottom: 20.h,
                        right: MediaQuery.of(context).size.width * 0.35,
                        child: buildIndicator())
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 12.w, top: 12.h, bottom: 11.5.h, right: 15.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: kText('Legacy 600',
                                fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: kText('From \$10,000', fontSize: 14.sp),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/seater.svg',
                                  width: 15.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 9.w, right: (2.5).w),
                                  child: kText('13 seater',
                                      fontSize: 14.sp,
                                      color: const Color(0xff666666)),
                                ),
                                SvgPicture.asset(
                                  'assets/svg/star.svg',
                                  width: (22.83).w,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: (4.59).w),
                                  child: kText('4.5 Rating',
                                      fontSize: 14.sp,
                                      color: const Color(0xff666666)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Card(
                        elevation: 0,
                        color: const Color(0xffe0dfdf),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 6.h,
                            horizontal: 17.w,
                          ),
                          child: kText('Adamawa', fontSize: 14),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              child: SvgPicture.asset(
                'assets/svg/like.svg',
                height: 53,
              ),
              right: MediaQuery.of(context).size.width * 0.06,
              top: 15,
            )
          ],
        ),
      ),
    );
  }
}
