import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widget/category_widget.dart';
import '../widget/home_state_widget.dart';

class DatabaseMethods {
  Stream<QuerySnapshot> getLocation() {
    return FirebaseFirestore.instance.collection("paygo").snapshots();
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Stream<QuerySnapshot> locationsStream;

  @override
  void initState() {
    super.initState();
    locationsStream = DatabaseMethods().getLocation();
  }

  Widget locationWidget() {
    return StreamBuilder<QuerySnapshot>(
      stream: locationsStream,
      builder: (context, snapshot) {
        // if (!snapshot.hasData) {
        //   return const  Center(child: CircularProgressIndicator());
        // } else
        
        if (snapshot.hasError) {
          return const Text("");
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                snapshot.data?.docs.isNotEmpty == true
                    ? snapshot.data!.docs.first['city']
                    : "",
                style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff242424),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                snapshot.data?.docs.isNotEmpty == true
                    ? snapshot.data!.docs.first['streatAddress']
                    : "",
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xff555555),
                ),
              ),
            ],
          );
          // return ListView.builder(
          //   itemCount: snapshot.data!.docs.length,
          //   itemBuilder: (context, index) {
          //     DocumentSnapshot doc = snapshot.data!.docs[index];
          //     return ListTile(
          //       title: Text(doc['city']),
          //     );
          //   },
          // );
        }
      },
    );
  }

  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final textFieldWidth = screenWidth > 311 ? 311.0 : screenWidth * 0.9;
    double bottomNavBarHeight = kBottomNavigationBarHeight; //
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xff7E3AF2),
          unselectedItemColor: const Color(0xff6B7280),
          unselectedLabelStyle: const TextStyle(
            color: Color(0xff6B7280),
          ),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart),
              label: "Bookings",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: "Explore"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
      appBar: AppBar(
        backgroundColor: const Color(0xffF1E7FF),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: locationWidget()),
            Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/coin.jpg',
                      width: 20,
                      height: 20,
                    ),
                    const Text(
                      "Points",
                      style: TextStyle(color: Color(0xff555555), fontSize: 11),
                    )
                  ],
                ),
                const Text(
                  "3,725",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: controller,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
              bottom:
                  bottomNavBarHeight), // Add padding equal to the height of the BottomNavigationBar
          child: Column(
            children: [
              Container(
                height: 234,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color(0xffF1E7FF),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 23.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hello, karthik!',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .7,
                        child: const Text(
                          "What would you like to do today?",
                          style: TextStyle(
                              color: Color(0xff7E3AF2),
                              fontSize: 28,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 44.0,
                            width: textFieldWidth,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Find a nearby activity',
                                hintStyle: const TextStyle(
                                    color: Colors.grey, fontSize: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.search),
                              ),
                            ),
                          ),
                          const Icon(Icons.tune)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const CategoryWidget(),
              const SizedBox(
                height: 50.0,
              ),
              const HomeStaticWidget(),
              const SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
