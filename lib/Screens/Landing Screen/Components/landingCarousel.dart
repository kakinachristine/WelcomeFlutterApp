import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:welcomeapp/Screens/Landing Screen/landingStyle.dart';
import 'package:welcomeapp/Utils/colors.dart';
import 'package:welcomeapp/Utils/constants.dart';

class LandingCarousel extends StatefulWidget {
  const LandingCarousel({super.key});

  @override
  State<LandingCarousel> createState() => _LandingCarouselState();
}

class _LandingCarouselState extends State<LandingCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carousel Slider
        CarouselSlider(
          options: CarouselOptions(
            height: 300,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: LandingCarouselItems.items.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      item['image']!,
                      height: 150,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      item['title']!,
                      style: LandingStyles.carouselTitle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['paragraph']!,
                      style: LandingStyles.carouselParagraph,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),

        const SizedBox(height: 5),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            LandingCarouselItems.items.length,
                (index) => Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? AppColors.primary
                    : Colors.grey[300],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
