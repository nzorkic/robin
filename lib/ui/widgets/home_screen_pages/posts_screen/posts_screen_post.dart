// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'posts_screen_carousel.dart';

class PostsScreenPost extends StatelessWidget {
  const PostsScreenPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: 40,
                        height: 40,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://picsum.photos/seed/23/600',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const Text('Nikola Zorkic'),
                  ],
                ),
                Align(
                  alignment: const Alignment(0, 0),
                  child: IconButton(
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.border_vertical,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            PostsScreenCarousel(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_red_eye),
                      onPressed: () => {},
                    ),
                    const Text('2'),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.location_on),
                  onPressed: () => {},
                ),
                IconButton(
                  icon: const Icon(Icons.message),
                  onPressed: () => {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Align(
                    alignment: Alignment(-1, 0),
                    child: Text('Belgrade, 2h ago'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                        'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
