import 'package:flutter/material.dart';
import 'package:hestia22/screens/schedule/schedule_screen.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    Container(
                      height: size.width * 0.39,
                      child: Row(
                        children: [
                          const TimeLine(),
                          const SizedBox(
                            width: 20,
                          ),
                          EventCard(
                            size: size,
                            time: '08:00 - 10:00',
                            eventName: 'Pubg Tourney',
                            description: 'IEDC Room',
                          ),
                        ],
                      ),
                    ),
                    
                  ],
                ),
              );
  }
}