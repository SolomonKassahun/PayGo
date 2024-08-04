import 'package:flutter/material.dart';
import 'package:pay_go/src/model/sport_menu_model.dart';

class SportMenuWidget extends StatelessWidget {
  const SportMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<SportMenuModel> sportMenuList = [
      SportMenuModel(
          backgroundColor: const Color(0xFF7C3AED),
          textColor: Colors.white,
          width: 70,
          height: 34,
          text: "Gym"),
            SportMenuModel(
          backgroundColor:  Colors.white,
          textColor: Colors.black,
          width: 99,
          height: 34,
          text: "Swimming"),
          SportMenuModel(
          backgroundColor:  Colors.white,
          textColor: Colors.black,
          width: 78,
          height: 34,
          text: "Cricket"),
            SportMenuModel(
          backgroundColor:  Colors.white,
          textColor: Colors.black,
          width: 64,
          height: 34,
          text: "Yoga"),
                      SportMenuModel(
          backgroundColor:  Colors.white,
          textColor: Colors.black,
          width: 76,
          height: 34,
          text: "Zumba")
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: sportMenuList.map((e) => Row(
      children: [
        Container(
                height: e.height,
                width: e.width,
                decoration: BoxDecoration(
                  color: e.backgroundColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child:  Center(
                  child: Text(
                    e.text,
                    style: TextStyle(
                      color: e.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
               const SizedBox(
            width: 15,
          ),
      ],
    ),).toList(),
  ),
    );
  }
}
