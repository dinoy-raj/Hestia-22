// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
// import '../../main.dart';
// import 'home.dart';
//
// Widget filterPage(BuildContext context)
// {
//   double screenHeight = MediaQuery.of(context).size.height;
//   double screenWidth = MediaQuery.of(context).size.width;
//   return  Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(bottom: screenHeight * .07),
//           child: Center(
//             child: AnimatedContainer(
//               duration: const Duration(seconds: 1),
//               curve: Curves.fastLinearToSlowEaseIn,
//               height: HomeState.filPressed ? screenHeight * .4 : 0,
//               width: screenWidth * .85,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(15),
//                 child: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
//                   child: AnimatedContainer(
//                     duration: const Duration(seconds: 1),
//                     curve: Curves.fastLinearToSlowEaseIn,
//                     height: HomeState.filPressed ? screenHeight * .4 : 0,
//                     width: screenWidth * .85,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Colors.black.withOpacity(.8)),
//                     child: SingleChildScrollView(
//                       physics: const BouncingScrollPhysics(),
//                       child: AnimatedPadding(
//                         duration: const Duration(seconds: 1),
//                         curve: Curves.decelerate,
//                         padding: HomeState.filPressed
//                             ? const EdgeInsets.all(15)
//                             : const EdgeInsets.all(0),
//                         child: AnimatedOpacity(
//                           duration: const Duration(seconds: 1),
//                           curve: Curves.decelerate,
//                           opacity: HomeState.filPressed? 1 : 0,
//                           child: Column(
//                             mainAxisAlignment:
//                             MainAxisAlignment.center,
//                             crossAxisAlignment:
//                             CrossAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 height: screenHeight * .05,
//                                 width: screenWidth * .85,
//                                 child: Row(
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.spaceAround,
//                                   crossAxisAlignment:
//                                   CrossAxisAlignment.center,
//                                   children: [
//                                     AnimatedOpacity(
//                                       duration: const Duration(
//                                           seconds: 1),
//                                       curve: Curves.decelerate,
//                                       opacity: HomeState.filPressed ? 1 : 0,
//                                       child: Container(
//                                           height:
//                                           screenHeight * .04,
//                                           width: screenWidth * .34,
//                                           decoration: BoxDecoration(
//                                               border: Border.all(
//                                                   color: Constants
//                                                       .iconAc),
//                                               borderRadius:
//                                               BorderRadius
//                                                   .circular(5)),
//                                           child: ElevatedButton(
//                                               onPressed: () {
//                                                 HomeState.filPressed = false;
//                                               },
//                                               style: ButtonStyle(
//                                                 backgroundColor:
//                                                 MaterialStateProperty
//                                                     .all(Colors
//                                                     .transparent),
//                                               ),
//                                               child: const Text(
//                                                 "Clear",
//                                                 style: TextStyle(
//                                                     color: Constants
//                                                         .color2,
//                                                     fontFamily:
//                                                     'Helvetica',
//                                                     fontWeight:
//                                                     FontWeight
//                                                         .bold),
//                                               ))),
//                                     ),
//                                     AnimatedOpacity(
//                                       duration: const Duration(
//                                           seconds: 1),
//                                       curve: Curves.decelerate,
//                                       opacity: HomeState.filPressed ? 1 : 0,
//                                       child: SizedBox(
//                                           height:
//                                           screenHeight * .04,
//                                           width: screenWidth * .34,
//                                           child: ElevatedButton(
//                                               onPressed: () {
//                                                 setState(() {
//                                                   HomeState.filPressed = false;
//                                                   if (showIndex ==
//                                                       0) {
//                                                     show.sort((a, b) => a[
//                                                     'name']
//                                                         .compareTo(b[
//                                                     'name']));
//                                                   } else if (showIndex ==
//                                                       1) {
//                                                     show.sort((a, b) => int
//                                                         .parse(b[
//                                                     'price'])
//                                                         .compareTo(int
//                                                         .parse(a[
//                                                     'price'])));
//                                                   } else {
//                                                     show.sort((a, b) => int
//                                                         .parse(a[
//                                                     'date'])
//                                                         .compareTo(int
//                                                         .parse(b[
//                                                     'date'])));
//                                                   }
//                                                 });
//                                               },
//                                               style: ButtonStyle(
//                                                   overlayColor:
//                                                   MaterialStateProperty
//                                                       .all(Colors
//                                                       .black
//                                                       .withOpacity(
//                                                       .5)),
//                                                   backgroundColor:
//                                                   MaterialStateProperty
//                                                       .all(Constants
//                                                       .iconAc)),
//                                               child: const Text(
//                                                 "Apply",
//                                                 style: TextStyle(
//                                                     color: Constants
//                                                         .color2,
//                                                     fontFamily:
//                                                     'Helvetica',
//                                                     fontWeight:
//                                                     FontWeight
//                                                         .bold),
//                                               ))),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: screenHeight * .3,
//                                 width: screenWidth * .85,
//                                 child: ListView.builder(
//                                     physics:
//                                     const BouncingScrollPhysics(),
//                                     itemCount: Sort1.length,
//                                     scrollDirection: Axis.vertical,
//                                     itemBuilder:
//                                         (BuildContext context,
//                                         index) {
//                                       return AnimatedPadding(
//                                         duration: const Duration(
//                                             seconds: 1),
//                                         curve: Curves.decelerate,
//                                         padding: EdgeInsets.only(
//                                           top: HomeState.filPressed
//                                               ? (screenHeight * .02)
//                                               : 0,
//                                         ),
//                                         child: GestureDetector(
//                                           onTap: () {
//                                             setState(() {
//                                               showIndex = index;
//                                             });
//                                           },
//                                           child: AnimatedContainer(
//                                             duration:
//                                             const Duration(
//                                                 seconds: 1),
//                                             curve:
//                                             Curves.decelerate,
//                                             height:
//                                             screenHeight * .06,
//                                             decoration:
//                                             BoxDecoration(
//                                               borderRadius:
//                                               BorderRadius
//                                                   .circular(10),
//                                               color: showIndex ==
//                                                   index
//                                                   ? Constants.iconAc
//                                                   : Colors.grey
//                                                   .withOpacity(
//                                                   .1),
//                                             ),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                               MainAxisAlignment
//                                                   .center,
//                                               children: [
//                                                 Text(
//                                                   Sort1[index],
//                                                   style: const TextStyle(
//                                                       color: Colors
//                                                           .white,
//                                                       fontFamily:
//                                                       'Helvetica',
//                                                       fontSize: 15
//                                                     //fontWeight: FontWeight.bold
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     }),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
// }
