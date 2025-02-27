import 'package:flutter/material.dart';
import 'package:portfolio/providers/screen_state.dart';
import 'package:portfolio/widgets/project_card.dart';
import 'package:provider/provider.dart';

class Projects extends StatefulWidget {
  final List<ProjectCard> projectCards;
  const Projects({super.key, required this.projectCards});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  final _scrollController = PageController(viewportFraction: 0.85);

  @override
  Widget build(BuildContext context) {
    return Consumer<ScreenState>(builder: (context, state, _) {
      return Column(
        children: [
          SizedBox(
            height: state.isTabScreen ? 700 : 640,
            child: PageView.builder(
              controller: _scrollController,
              itemCount: widget.projectCards.length,
              itemBuilder: (context, index) {
                return TweenAnimationBuilder(
                  tween: Tween(begin: 0.8, end: 1.0),
                  duration: const Duration(milliseconds: 300),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 32,
                        ),
                        child: widget.projectCards[index],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          _buildPageIndicator(),
        ],
      );
    });
  }

  Widget _buildPageIndicator() {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.projectCards.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _scrollController.animateToPage(
              entry.key,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
            child: Container(
              width: 12,
              height: 12,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(
                    _scrollController.hasClients &&
                            _scrollController.page?.round() == entry.key
                        ? 1.0
                        : 0.3,
                  )
                  // color: _scrollController.hasClients &&
                  //         _scrollController.page?.round() == entry.key
                  //     ? Colors.red // Different color for the current page
                  //     : Colors.white.withOpacity(0.3),
                  ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

// import 'package:flutter/material.dart';
// import 'package:portfolio/providers/screen_state.dart';
// import 'package:portfolio/widgets/project_card.dart';
// import 'package:provider/provider.dart';

// class Projects extends StatelessWidget {
//   final List<ProjectCard> projectCards;
//   const Projects({super.key, required this.projectCards});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ScreenState>(builder: (context, state, _) {
//       return SingleChildScrollView(
//         padding: EdgeInsets.all(state.isTabScreen ? 24.0 : 16.0),
//         child: Column(
//           children: [
//             GridView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: state.isTabScreen ? 2 : 1,
//                 mainAxisSpacing: 20,
//                 crossAxisSpacing: 20,
//                 childAspectRatio: state.isTabScreen ? 1.2 : 0.85,
//               ),
//               itemCount: projectCards.length,
//               itemBuilder: (context, index) => projectCards[index],
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
