import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PostsScreenCarousel extends StatelessWidget {
  PostsScreenCarousel({Key? key}) : super(key: key);

  final List<String> _images = [
    'https://picsum.photos/seed/788/300',
    'https://picsum.photos/seed/789/300',
    'https://picsum.photos/seed/790/300',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: _images.map((img) {
        return Image.network(
          img,
          width: double.infinity,
          fit: BoxFit.cover,
        );
      }).toList(),
      options: CarouselOptions(
        height: 250,
        viewportFraction: 1,
        enableInfiniteScroll: false,
      ),
    );
  }
}
