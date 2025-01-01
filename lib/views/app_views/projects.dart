import 'package:flutter/material.dart';
import 'package:portfolio/model/project_details.dart';

import 'package:portfolio/widgets/project_card.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

class Projects extends StatelessWidget {
  const Projects({super.key, required this.projectCards});

  final List<ProjectCard> projectCards;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: StackedCardCarousel(
        // initialOffset: 10,
        spaceBetweenItems: 600,
        // type: StackedCardCarouselType.cardsStack,
        type: StackedCardCarouselType.cardsStack,
        items: projectCards,
      ),
    );

    //   return Container(
    //     child: VerticalCardPager(
    //       titles: projects.map((e) => e.title.toUpperCase()).toList(),
    //       textStyle: const TextStyle(
    //           color: Color(0xFFDE846B), fontWeight: FontWeight.bold),
    //       images: projects
    //           .map((e) => Hero(
    //                 tag: e.title.toUpperCase(),
    //                 child: ClipRRect(
    //                   borderRadius: BorderRadius.circular(20.0),
    //                   child: Image.network(
    //                     e.imagePath,
    //                     fit: BoxFit.cover,
    //                   ),
    //                 ),
    //               ))
    //           .toList(),
    //       onPageChanged: (page) {},
    //       onSelectedItem: (index) {
    //         // Navigator.push(
    //         //   context,
    //         //   MaterialPageRoute(
    //         //       builder: (context) => DetailView(
    //         //             champion: champions[index],
    //         //           )),
    //         // );
    //       },
    //     ),
    //   );
    // }
  }
}
