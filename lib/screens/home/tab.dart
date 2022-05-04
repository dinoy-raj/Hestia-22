// import 'package:flutter/material.dart';
// import 'package:hestia22/screens/home/home.dart';
//
// import '../../main.dart';
//
// Widget categoryPage(BuildContext context) {
//   double screenHeight = MediaQuery.of(context).size.height;
//   double screenWidth = MediaQuery.of(context).size.width;
//   return AnimatedPadding(
//     duration: const Duration(seconds: 1),
//     curve: Curves.fastLinearToSlowEaseIn,
//     padding: HomeState.start
//         ? const EdgeInsets.only(left: 20, right: 20)
//         : const EdgeInsets.only(left: 0, right: 0),
//     child: Container(
//       height: screenHeight * .1,
//       width: screenWidth,
//       decoration: const BoxDecoration(),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 13.0, bottom: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text(
//                   "Categories",
//                   style: TextStyle(
//                     fontFamily: 'Helvetica',
//                     fontWeight: FontWeight.bold,
//                     color: Constants.iconIn,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: screenHeight * .045,
//             width: screenWidth,
//             child: ShaderMask(
//               shaderCallback: (Rect bounds) {
//                 return LinearGradient(
//                   colors: [Colors.white, Colors.white.withOpacity(0.05)],
//                   stops: const [0.8, 1],
//                   tileMode: TileMode.mirror,
//                 ).createShader(bounds);
//               },
//               child: ListView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   scrollDirection: Axis.horizontal,
//                   itemCount: HomeState.category.length,
//                   itemBuilder: (BuildContext context, index) {
//                     return GestureDetector(
//                       onTap: () {
//
//                         setState(() {
//                           HomeState.catSelect = index;
//                         });
//
//                       },
//                       child: AnimatedOpacity(
//                         duration: const Duration(seconds: 1),
//                         curve: Curves.decelerate,
//                         opacity: HomeState.start ? 1 : 0,
//                         child: AnimatedPadding(
//                           padding: HomeState.start
//                               ? const EdgeInsets.only(right: 8)
//                               : const EdgeInsets.only(right: 15),
//                           curve: Curves.decelerate,
//                           duration: const Duration(seconds: 1),
//                           child: AnimatedContainer(
//                             duration: const Duration(seconds: 1),
//                             curve: Curves.decelerate,
//                             height: screenHeight * .02,
//                             width: 100,
//                             decoration: BoxDecoration(
//                               color: HomeState.catSelect == index
//                                   ? Constants.color1
//                                   : Colors.grey.withOpacity(.1),
//                               border: Border.all(
//                                   color: HomeState.catSelect == index
//                                       ? Constants.iconAc
//                                       : Colors.transparent),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 HomeState.category[index],
//                                 style: TextStyle(
//                                   color: HomeState.catSelect == index
//                                       ? Colors.white
//                                       : Constants.iconIn,
//                                   fontFamily: 'Helvetica',
//                                   fontWeight: HomeState.catSelect == index
//                                       ? FontWeight.bold
//                                       : FontWeight.normal,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
