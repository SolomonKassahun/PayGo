import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../service/database.dart';
import '../widget/customize_icon.dart';
import '../widget/sport_menu_widget.dart';

class GymScreen extends StatefulWidget {
  const GymScreen({super.key});

  @override
  State<GymScreen> createState() => _GymScreenState();
}

class _GymScreenState extends State<GymScreen> {
  late Stream<QuerySnapshot> gymHousesStream;
  late Stream<QuerySnapshot> locationsStream;
  @override
  void initState() {
    gymHousesStream = DatabaseMethods().getGymHouse();
    locationsStream = DatabaseMethods().getLocation();

    super.initState();
  }


  Widget locationWidget() {
    return StreamBuilder<QuerySnapshot>(
      stream: locationsStream,
      builder: (context, snapshot) {
    
        if (snapshot.hasError) {
          return const  Text("");
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                     snapshot.data?.docs.isNotEmpty == true ? snapshot.data!.docs.first['city'] : "",

                    style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff242424),
                        fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.expand_more,size: 20,)
                ],
              ),
              Text(
                  snapshot.data?.docs.isNotEmpty == true ? snapshot.data!.docs.first['streatAddress'] : "",

                // snapshot.data!.docs.first['streatAddress'] ?? "" ,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xff555555),
                ),
              ),
            ],
          );

        }
      },
    );
  }

  Widget gymHouseWidget() {
    return StreamBuilder<QuerySnapshot>(
      stream: gymHousesStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Text('Error occurred. Try again!!');
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .78,
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doc = snapshot.data!.docs[index];
                return Column(
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
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width,
                                  height: 233.0,
                                  imageUrl: doc['image'],
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 233.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) => const Center(
                                      child: SpinKitCircle(
                                    color: Colors.black,
                                  )),
                                  errorWidget: (context, url, error) =>
                                         Image.asset(
                                  'assets/images/gymhome.jpg',
                                  fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: 233.0,
                                ),
                                ),
                                // Image.asset(
                                //   'assets/images/gymhome.jpg',
                                //   fit: BoxFit.cover,
                                // width: MediaQuery.of(context).size.width,
                                // height: 233.0,
                                // ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          doc['title'],
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff191D23)
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              CustomIcons.approximate,
                                              color: Color(0xff696969),
                                              size: 12.0,
                                            ),
                                            Text(
                                              "${doc['distance']} km",
                                              style: const TextStyle(
                                                  color: Color(0xff696969),
                                                  fontSize: 12),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      doc['subtitle'],
                                      style: const TextStyle(
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
                                        Text(
                                          '₹${doc['price']} / session',
                                          style: const TextStyle(
                                            fontSize: 14.0,
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
                    const SizedBox(
                height: 20.0,
              ),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }

  ScrollController scrollController = ScrollController();
int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
      double bottomNavBarHeight = kBottomNavigationBarHeight; 

    return Scaffold(
        backgroundColor: const Color(0xffF7F9FB),
        appBar: AppBar(
          title: locationWidget(),
        ),
        bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff7E3AF2),
        unselectedItemColor: const  Color(0xff6B7280),
        unselectedLabelStyle: const TextStyle(color: Color(0xff6B7280),),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: currentIndex,
        
        items: const [
          BottomNavigationBarItem(icon:  Icon(Icons.home),label: "Home"),
                    BottomNavigationBarItem(icon:  Icon(Icons.pie_chart),label: "Bookings",),

          BottomNavigationBarItem(icon:  Icon(Icons.explore),label: "Explore"),
                    BottomNavigationBarItem(icon:  Icon(Icons.person),label: "Profile")


        ]),
        body: SingleChildScrollView(
          controller: scrollController,
           physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
        padding: EdgeInsets.only(bottom: bottomNavBarHeight),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: SportMenuWidget(),
                ),
                const SizedBox(
                  height: 10,
                ),
                gymHouseWidget(),
                   const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ));
  }
}
