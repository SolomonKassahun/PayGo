import 'package:flutter/material.dart';
import 'package:pay_go/src/screens/gym.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const GymScreen()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/gym.jpg",
                    width: 50,
                    height: 50,
                  ),
                  const Text(
                    "Gym",
                    style: TextStyle(color: Color(0xff555555), fontSize: 14),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Image.asset(
                  "assets/images/swimming.jpg",
                  width: 50,
                  height: 50,
                ),
                const Text(
                  "Swimming",
                  style: TextStyle(color: Color(0xff555555), fontSize: 14),
                )
              ],
            ),
            Column(
              children: [
                Image.asset(
                  "assets/images/badimation.jpg",
                  width: 50,
                  height: 50,
                ),
                const Text(
                  "Badminton",
                  style: TextStyle(color: Color(0xff555555), fontSize: 14),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/yoga.jpg",
                  width: 50,
                  height: 50,
                ),
                const Text(
                  "Yoga",
                  style: TextStyle(color: Color(0xff555555), fontSize: 14),
                )
              ],
            ),
            Column(
              children: [
                Image.asset(
                  "assets/images/sumba.jpg",
                  width: 50,
                  height: 50,
                ),
                const Text(
                  "Zumba",
                  style: TextStyle(color: Color(0xff555555), fontSize: 14),
                )
              ],
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "View all",
                  style: TextStyle(
                    color: Color(0xff7E3AF2),
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xff7E3AF2),
                    decorationThickness: 1.0,
                    decorationStyle: TextDecorationStyle.solid,
                    height: 2,
                  ),
                ))
          ],
        )
      ],
    );
  }
}
