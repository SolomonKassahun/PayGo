import 'package:flutter/material.dart';
import 'package:pay_go/src/widget/customize_icon.dart';

class HomeStaticWidget extends StatelessWidget {
  const HomeStaticWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           Column(
                  // scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      child: Card(
                        // elevation: 4.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                child: 
                                Image.asset(
                                  'assets/images/gymhome.jpg',
                                  fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: 233.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  const   Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                         Text(
                                          "Quad Special Workout Gym",
                                          style:  TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff191D23)
                                          ),
                                        ),
                                        Row(
                                          children: [
                                             Icon(
                                              CustomIcons.approximate,
                                              color: Color(0xff696969),
                                              size: 12.0,
                                            ),
                                            Text(
                                              "3.4 km",
                                              style:  TextStyle(
                                                  color: Color(0xff696969),
                                                  fontSize: 12),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 8.0),
                                  const   Text(
                                    "Near Andhra Bank, Manikonda, Hyderabad",
                                      style:  TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0xff696969),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.grey,
                                      height: 0.25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                      const  Text(
                                          '₹45 / session',
                                          style:  TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff141414)
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "Book Slot",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff7E3AF2)),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                   Column(
                  // scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      child: Card(
                        // elevation: 4.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                child: 
                                Image.asset(
                                  'assets/images/image2.png',
                                  fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: 233.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  const   Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                         Text(
                                          "Sky Gym Center",
                                          style:  TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff191D23)
                                          ),
                                        ),
                                        Row(
                                          children: [
                                             Icon(
                                              CustomIcons.approximate,
                                              color: Color(0xff696969),
                                              size: 12.0,
                                            ),
                                            Text(
                                              "5.7 km",
                                              style:  TextStyle(
                                                  color: Color(0xff696969),
                                                  fontSize: 12),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 8.0),
                                  const   Text(
                                    "Near Andhra Bank, Manikonda, Hyderabad",
                                      style:  TextStyle(
                                        fontSize: 12.0,
                                        color: Color(0xff696969),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      color: Colors.grey,
                                      height: 0.25,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                      const  Text(
                                          '₹45 / session',
                                          style:  TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff141414)
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "Book Slot",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff7E3AF2)),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
      ],
    );
  }
}