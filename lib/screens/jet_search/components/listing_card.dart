import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
        width: double.infinity,
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
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 15),
      child: Card(
        elevation: 5,
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
                        bottom: 10,
                        right: MediaQuery.of(context).size.width * 0.35,
                        child: buildIndicator())
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kText('Legacy 600',
                                fontSize: 14, fontWeight: FontWeight.bold),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: kText('From \$10,000', fontSize: 14),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/svg/seater.svg'),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: kText('13 seater',
                                        fontSize: 13,
                                        color: const Color(0xff666666)),
                                  ),
                                  SvgPicture.asset('assets/svg/star.svg'),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: kText('4.5 Rating',
                                        fontSize: 13,
                                        color: const Color(0xff666666)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 3.0),
                        child: Card(
                          elevation: 0,
                          color: const Color(0xffe0dfdf),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 10, bottom: 5, top: 5, left: 10),
                            child: kText('Adamawa', fontSize: 14),
                          ),
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
