// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nafs/auth_services.dart';
import 'package:nafs/models/Users.dart';
import 'package:nafs/on_boarding/on_boarding_page.dart';
import 'package:nafs/pages/artikel_page.dart';
import 'package:nafs/pages/home_page.dart';
import 'package:nafs/pages/konseling_page.dart';
// import 'package:nafs/screening/result.dart';
import 'package:nafs/pages/riwayat_page.dart';
import 'package:nafs/profile.dart';
import 'package:nafs/profile_register.dart';
import 'package:nafs/screening/start_screening.dart';
import 'package:nafs/pages/terapi_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nafs/user_services.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home(this.index);
  final int index;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int bottomNavBarIndex;
  late PageController pageController;
  Users? users;

  @override
  void initState() {
    super.initState();

    bottomNavBarIndex = widget.index;
    pageController = PageController(initialPage: widget.index);

    // WidgetsBinding.instance!.addPostFrameCallback((_) async {
    //   await showDialog(
    //     context: context,
    //     builder: (context) {
    //       return AlertDialog(
    //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //         elevation: 16,
    //         content: Text(
    //           "1.	Aplikasi ini merupakan bentuk penanganan awal untuk mengelola kondisi mental Anda.\n2.	Dilarang untuk menyebarluaskan apapun yang ada di dalam Aplikasi ini.\n3.	Kami selalu menjaga kerahasiaan data yang kamu masukkan.\n4.	Aplikasi ini berada di dalam pengawasan Akademisi dan Praktisi Psikolog.",
    //           style: TextStyle(
    //             fontFamily: "Baloo Da",
    //           ),
    //         ),
    //         actions: [
    //           GestureDetector(
    //             onTap: () {
    //               Navigator.pop(context);
    //             },
    //             child: Column(
    //               children: [
    //                 Divider(
    //                   color: Colors.grey,
    //                 ),
    //                 TextButton(
    //                   onPressed: () {
    //                     Navigator.pop(context);
    //                   },
    //                   child: Text(
    //                     'OK',
    //                     style: TextStyle(
    //                       fontSize: 16,
    //                       color: Colors.blue,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    UserServices.getUser(user!.uid).then(
      (value) {
        try {
          users = value;
        } catch (e) {}
      },
    );

    return Material(
      child: SafeArea(
        child: Scaffold(
          drawerEnableOpenDragGesture: false,
          drawer: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // padding: EdgeInsets.zero,
              children: [
                Column(
                  children: [
                    ListTile(
                      title: const Text('Tentang Kami'),
                      trailing: Icon(Icons.info_outline),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              elevation: 16,
                              child: SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed lorem velit, laoreet at placerat sed, rutrum eu est. Sed nec ante ut lacus pulvinar rhoncus. Donec magna magna, posuere nec odio sit amet, aliquet sagittis sem. Quisque malesuada mi in mauris aliquet, sit amet faucibus turpis ultrices. Nullam vitae mi sit amet turpis hendrerit tempor. Curabitur laoreet nulla ut metus porttitor, et porttitor justo ullamcorper. Donec mattis ullamcorper felis id ultricies. Maecenas efficitur dui eget odio aliquam, eu porttitor nibh cursus. Proin et nibh eget purus tempus interdum. Phasellus a cursus elit. Phasellus maximus posuere mi. Aliquam id purus rutrum, tempus dui eget, fringilla sem. Etiam eget tincidunt mauris, dignissim luctus massa. Curabitur tristique libero id risus efficitur, ut interdum velit fermentum. Etiam nec est volutpat, aliquet lorem vitae, vulputate ipsum. Nulla facilisi. Maecenas non tincidunt felis. Ut consectetur libero ipsum, non tempor velit lobortis vel. Curabitur maximus eget ipsum in aliquam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nullam blandit vitae dolor sed efficitur. Nunc aliquet, tortor at ullamcorper placerat, mi lorem ornare erat, at vestibulum tortor erat at nibh.",
                                        style: TextStyle(fontFamily: "Baloo Da"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Bantuan'),
                      trailing: Icon(Icons.help_center_outlined),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Penilaian dan Ulasan'),
                      trailing: Icon(Icons.star_border_outlined),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Pengaturan'),
                      trailing: Icon(Icons.settings_outlined),
                      onTap: () {},
                    ),
                  ],
                ),
                ListTile(
                  title: const Text('Keluar'),
                  trailing: Icon(Icons.logout_outlined),
                  onTap: () {
                    Get.offAll((() => OnBoarding()));
                    AuthServices.signOut();
                  },
                ),
              ],
            ),
          ),

          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            actions: [
              FutureBuilder(
                future: UserServices.getUser(user.uid),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      Users data = snapshot.data as Users;
                      return IconButton(
                        icon: Image.network(data.profilePicture),
                        onPressed: () {
                          Get.to(() => ProfilePage());
                        },
                      );
                    } else {
                      return IconButton(
                        icon: Image.network("https://drive.google.com/uc?export=download&id=1GBxj98H6KD8wSMWiRQzgBIAQAhbAkMFZ"),
                        onPressed: () {
                          Get.to(() => ProfilePage());
                        },
                      );
                    }
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  bottomNavBarIndex = index;
                  pageController.jumpToPage(index);
                });
              },
              elevation: 0,
              // backgroundColor: Colors.transparent,
              // selectedItemColor: Colors.purple,
              // unselectedItemColor: Color(0xFFE5E5E5),
              currentIndex: bottomNavBarIndex,
              items: [
                BottomNavigationBarItem(
                  title: Text(
                    "Terapi",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Baloo Da",
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  icon: Container(
                    // margin: EdgeInsets.only(bottom: 6),
                    // height: 20,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: (bottomNavBarIndex == 0) ? Colors.purple[100] : Colors.transparent),
                    child: Icon(
                      Icons.self_improvement_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text(
                    "Konseling",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Baloo Da",
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  icon: Container(
                    // margin: EdgeInsets.only(bottom: 6),
                    // height: 20,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: (bottomNavBarIndex == 1) ? Colors.purple[100] : Colors.transparent),
                    child: Icon(
                      Icons.emoji_emotions_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text(
                    "Beranda",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Baloo Da",
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  icon: Container(
                    // margin: EdgeInsets.only(bottom: 6),
                    // height: 20,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: (bottomNavBarIndex == 2) ? Colors.purple[100] : Colors.transparent),
                    child: Icon(
                      Icons.home_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text(
                    "Artikel",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Baloo Da",
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  icon: Container(
                    // margin: EdgeInsets.only(bottom: 6),
                    // height: 20,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: (bottomNavBarIndex == 3) ? Colors.purple[100] : Colors.transparent),
                    child: Icon(
                      Icons.article_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  title: Text(
                    "Riwayat",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Baloo Da",
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  icon: Container(
                    // margin: EdgeInsets.only(bottom: 6),
                    // height: 20,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: (bottomNavBarIndex == 4) ? Colors.purple[100] : Colors.transparent),
                    child: Icon(
                      Icons.history,
                      color: Colors.black,
                    ),
                  ),
                ),
              ]),
          // CurvedNavigationBar(
          //   animationDuration: const Duration(milliseconds: 500),
          //   animationCurve: Curves.linear,
          //   height: 50,
          //   // backgroundColor: Color.fromRGBO(142, 151, 253, 1),
          //   backgroundColor: Colors.white,
          //   // buttonBackgroundColor: Color.fromRGBO(142, 151, 253, 1),

          //   items: <Widget>[
          //     Icon(Icons.home, size: 30),
          //     SvgPicture.asset("assets/icons/iconterapi.svg"),
          //     SvgPicture.asset("assets/icons/iconartikel.svg"),
          //   ],
          //   onTap: (index) {
          //     setState(() {
          //       bottomNavIndex = index;
          //       // pageController.animateToPage(index,
          //       //     duration: Duration(milliseconds: 600),
          //       //     curve: Curves.decelerate);
          //       pageController.jumpToPage(index);
          //     });
          //   },
          // ),
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            pageSnapping: true,
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                bottomNavBarIndex = index;
              });
            },
            children: [
              TerapiPage(),
              KonselingPage(),
              HomePage(),
              ArtikelPage(),
              RiwayatPage(),
            ],
          ),
        ),
      ),
    );
  }
}
