import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nafs/home.dart';
import 'package:nafs/pages/riwayat_page.dart';
import 'package:nafs/riwayat_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:nafs/screening/screening.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:nafs/controllers/question_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:supercharged/supercharged.dart';

// class Result extends StatefulWidget {
//   const Result({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _ResultState creainsomniaQuestionsate() => _ResultState();
// }

// class _ResultState extends State<Result> {
//   static late double categoryInsomnia = 0,
//       categoryStress = 0,
//       categoryDepresi = 0,
//       categoryCemas = 0;
//   // skorStress = 0,
//   // skorDepresi = 0,
//   // skorCemas = 0,

//   static late String kategoriStress = "Normal",
//       kategoriDepresi = "Normal",
//       kategoriCemas = "Normal";

//   // _getResultStress() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   double resultStress = prefs.getDouble('resultStress') ?? 0;
//   //   return resultStress;
//   // }

//   // _getResultCemas() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   double resultCemas = prefs.getDouble('resultCemas') ?? 0;
//   //   return resultCemas;
//   // }

//   // _getResultDepresi() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   double resultDepresi = prefs.getDouble('resultDepresi') ?? 0;
//   //   return resultDepresi;
//   // }

//   // _getHasilDepresi() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   String hasilDepresi = prefs.getString('hasilDepresi') ?? 'Normal';
//   //   return hasilDepresi;
//   // }

//   // _getHasilCemas() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   String hasilCemas = prefs.getString('hasilCemas') ?? 'Normal';
//   //   return hasilCemas;
//   // }

//   // _getHasilStress() async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   String hasilStress = prefs.getString('hasilStress') ?? 'Normal';
//   //   return hasilStress;
//   // }

//   @override
//   void initState() {
//     super.initState();
//     // categoryDepresi = 0;
//     // categoryCemas = 0;
//     // categoryStress = 0;
//     // kategoriDepresi = "Normal";
//     // kategoriCemas = "Normal";
//     // kategoriStress = "Normal";

//     // _getResultCemas().then((value) {
//     //   setState(() {
//     //     categoryCemas = value;
//     //   });
//     // });
//     // _getResultStress().then((value) {
//     //   setState(() {
//     //     categoryStress = value;
//     //   });
//     // });
//     // _getResultDepresi().then((value) {
//     //   setState(() {
//     //     categoryDepresi = value;
//     //   });
//     // });

//     // _getHasilDepresi().then((value) {
//     //   setState(() {
//     //     kategoriDepresi = value;
//     //   });
//     // });
//     // _getHasilCemas().then((value) {
//     //   setState(() {
//     //     kategoriCemas = value;
//     //   });
//     // });
//     // _getHasilStress().then((value) {
//     //   setState(() {
//     //     kategoriStress = value;
//     //   });
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     int sum = 0;
//     // int index = 0;

//     // List<int> stressQuestions = [0, 5, 7, 10, 11, 13, 17];
//     // List<int> cemasQuestions = [1, 3, 6, 8, 14, 18, 19];
//     // List<int> depresiQuestions = [2, 4, 9, 12, 15, 16, 20];
//     // List<Color> colorList = [
//     //   Colors.red,
//     //   Colors.greenAccent.shade700,
//     //   Colors.blue.shade900
//     // ];

//     QuestionController _qnController = Get.put(QuestionController());
//     for (int e in _qnController.answers) {
//       // if (stressQuestions.contains(index)) {
//       //   skorStress += e;
//       // } else if (cemasQuestions.contains(index)) {
//       //   skorCemas += e;
//       // } else if (depresiQuestions.contains(index)) {
//       //   skorDepresi += e;
//       // }
//       sum += e;
//       // index++;
//     }

//     // _setResult() async {
//     //   SharedPreferences prefs = await SharedPreferences.getInstance();
//     //   double resultDepresi = categoryDepresi;
//     //   double resultCemas = categoryCemas;
//     //   double resultStress = categoryStress;

//     //   String hasilDepresi = kategoriDepresi;
//     //   String hasilCemas = kategoriCemas;
//     //   String hasilStress = kategoriStress;

//     //   await prefs.setDouble('resultDepresi', resultDepresi);
//     //   await prefs.setDouble('resultCemas', resultCemas);
//     //   await prefs.setDouble('resultStress', resultStress);

//     //   await prefs.setString('hasilDepresi', hasilDepresi);
//     //   await prefs.setString('hasilCemas', hasilCemas);
//     //   await prefs.setString('hasilStress', hasilStress);
//     // }

//     if (sum.isBetween(0, 9)) {
//       categoryDepresi = 0;
//       kategoriDepresi = "Normal";
//     } else if (sum.isBetween(10, 13)) {
//       categoryDepresi = 1;
//       kategoriDepresi = "Ringan";
//     } else if (sum.isBetween(14, 20)) {
//       categoryDepresi = 2;
//       kategoriDepresi = "Sedang";
//     } else if (sum.isBetween(21, 27)) {
//       categoryDepresi = 3;
//       kategoriDepresi = "Berat";
//     } else if (sum >= 28) {
//       categoryDepresi = 4;
//       kategoriDepresi = "Sangat Berat";
//     }

//     if (sum.isBetween(0, 7)) {
//       categoryCemas = 0;
//       kategoriCemas = "Normal";
//     } else if (sum.isBetween(8, 9)) {
//       categoryCemas = 1;
//       kategoriCemas = "Ringan";
//     } else if (sum.isBetween(10, 14)) {
//       categoryCemas = 2;
//       kategoriCemas = "Sedang";
//     } else if (sum.isBetween(15, 19)) {
//       categoryCemas = 3;
//       kategoriCemas = "Berat";
//     } else if (sum >= 20) {
//       categoryCemas = 4;
//       kategoriCemas = "Sangat Berat";
//     }

//     if (sum.isBetween(0, 14)) {
//       categoryStress = 0;
//       kategoriStress = "Normal";
//     } else if (sum.isBetween(15, 18)) {
//       categoryStress = 1;
//       kategoriStress = "Ringan";
//     } else if (sum.isBetween(19, 25)) {
//       categoryStress = 2;
//       kategoriStress = "Sedang";
//     } else if (sum.isBetween(26, 33)) {
//       categoryStress = 3;
//       kategoriStress = "Berat";
//     } else if (sum >= 34) {
//       categoryStress = 4;
//       kategoriStress = "Sangat Berat";
//     }

//     // if (sum.isBetween(0, 7)) {
//     //   categoryInsomnia = 1;
//     // } else if (sum.isBetween(8, 14)) {
//     //   categoryInsomnia = 2;
//     // } else if (sum.isBetween(15, 21)) {
//     //   categoryInsomnia = 3;
//     // } else if (sum.isBetween(22, 28)) {
//     //   categoryInsomnia = 4;
//     // } else if (sum >= 34) {
//     //   categoryInsomnia = 5;
//     // }

//     // Map<String, double> dataMap = {
//     //   "Depresi": categoryDepresi,
//     //   "Cemas": categoryCemas,
//     //   "Stress": categoryStress,
//     //   // "Insomnia": 2,
//     // };

//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               // Container(
//               //   margin:
//               //       EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 40),
//               //   padding: EdgeInsets.all(22),
//               //   decoration: BoxDecoration(
//               //     color: Colors.white,
//               //     borderRadius: BorderRadius.circular(20),
//               //     boxShadow: [
//               //       BoxShadow(
//               //         offset: Offset(0, 10),
//               //         blurRadius: 50,
//               //         color: Color(0xA15AD9).withOpacity(0.25),
//               //       ),
//               //     ],
//               //   ),
//               //   child: Text(
//               //     "Skor Hasil : ${sum}",
//               //     style: TextStyle(color: Colors.purple, fontSize: 16),
//               //   ),
//               // ),
//               // ElevatedButton(
//               //   style: ElevatedButton.styleFrom(
//               //     primary: Colors.purple,
//               //     shadowColor: Colors.purple.withOpacity(0.25),
//               //     elevation: 1,
//               //     shape: StadiumBorder(),
//               //     side: BorderSide(color: Colors.white),
//               //   ),
//               //   onPressed: () => Get.to(Home()),
//               //   child: Text("Selanjutnya"),
//               // ),
//             ],
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.4,
//             margin: EdgeInsets.only(right: 20, left: 20),
//             padding: EdgeInsets.only(right: 25, top: 25, bottom: 10, left: 25),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(0, 10),
//                   blurRadius: 50,
//                   color: Color(0xA15AD9).withOpacity(0.25),
//                 ),
//               ],
//             ),
//             child: BarChart(
//               BarChartData(
//                 alignment: BarChartAlignment.spaceEvenly,
//                 maxY: 5,
//                 minY: 0,
//                 // groupsSpace: 30,
//                 barTouchData: BarTouchData(enabled: false),
//                 titlesData: FlTitlesData(
//                   bottomTitles: SideTitles(
//                     showTitles: true,
//                     getTextStyles: (value) =>
//                         const TextStyle(color: Colors.black, fontSize: 14),
//                     margin: 10,
//                     getTitles: (double id) => BarData.barData
//                         .firstWhere((element) => element.id == id.toInt())
//                         .name,
//                   ),
//                   leftTitles: SideTitles(
//                       // showTitles: true,
//                       // getTextStyles: (value) =>
//                       //     const TextStyle(color: Colors.black, fontSize: 10),
//                       // rotateAngle: 90,
//                       // interval: BarData.interval.toDouble(),
//                       // margin: 10,
//                       // reservedSize: 30,
//                       // getTitles: (double value) =>
//                       //     value == 0 ? '0' : '${value.toInt()}',
//                       ),
//                 ),
//                 // gridData: FlGridData(
//                 //   checkToShowHorizontalLine: (value) =>
//                 //       value % BarData.interval == 0,
//                 //   getDrawingHorizontalLine: (value) {
//                 //     if (value == 0) {
//                 //       return FlLine(
//                 //         color: const Color(0xff363753),
//                 //         strokeWidth: 3,
//                 //       );
//                 //     } else {
//                 //       return FlLine(
//                 //         color: const Color(0xff2a2747),
//                 //         strokeWidth: 0.8,
//                 //       );
//                 //     }
//                 //   },
//                 // ),
//                 barGroups: BarData.barData
//                     .map(
//                       (data) => BarChartGroupData(
//                         x: data.id,
//                         barRods: [
//                           BarChartRodData(
//                             y: data.y,
//                             width: 40,
//                             colors: [data.color],
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(6),
//                               topRight: Radius.circular(6),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                     .toList(),
//               ),
//             ),
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height / 5,
//             margin: EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 40),
//             padding: EdgeInsets.all(22),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(0, 10),
//                   blurRadius: 50,
//                   color: Color(0xA15AD9).withOpacity(0.25),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Container(
//                       width: 20,
//                       height: 20,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.red,
//                         boxShadow: [
//                           BoxShadow(
//                             offset: Offset(0, 10),
//                             blurRadius: 50,
//                             color: Colors.red.withOpacity(0.25),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       "Depresi",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       ":",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       kategoriDepresi,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Container(
//                       width: 20,
//                       height: 20,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.green,
//                         boxShadow: [
//                           BoxShadow(
//                             offset: Offset(0, 10),
//                             blurRadius: 50,
//                             color: Colors.green.withOpacity(0.25),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       "Cemas ",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       ":",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       kategoriCemas,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Container(
//                       width: 20,
//                       height: 20,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.blue.shade900,
//                         boxShadow: [
//                           BoxShadow(
//                             offset: Offset(0, 10),
//                             blurRadius: 50,
//                             color: Colors.blue.withOpacity(0.25),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       "Stress  ",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       ":",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       kategoriStress,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(right: 20),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.purple,
//                 shadowColor: Colors.purple.withOpacity(0.25),
//                 elevation: 1,
//                 shape: StadiumBorder(),
//                 side: BorderSide(color: Colors.white),
//               ),
//               onPressed: () {
//                 // _setResult();
//                 Get.off(() => Home());
//               },
//               child: Text("Beranda"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Data {
//   final int id;
//   final String name;
//   final double y;
//   final Color color;
//   final String kategori;

//   const Data({
//     required this.name,
//     required this.id,
//     required this.y,
//     required this.color,
//     required this.kategori,
//   });
// }

// class BarData {
//   static int interval = 1;

//   static List<Data> barData = [
//     Data(
//       id: 0,
//       name: 'Depresi',
//       // y: Result.skorDepresi,
//       y: _ResultState.categoryDepresi,
//       color: Colors.red,
//       kategori: _ResultState.kategoriDepresi,
//     ),
//     Data(
//       name: 'Cemas',
//       id: 1,
//       // y: Result.skorCemas,
//       y: _ResultState.categoryCemas,
//       color: Colors.greenAccent.shade700,
//       kategori: _ResultState.kategoriCemas,
//     ),
//     Data(
//       name: 'Stress',
//       id: 2,
//       // y: Result.skorStress,
//       y: _ResultState.categoryStress,
//       color: Colors.blue.shade900,
//       kategori: _ResultState.kategoriStress,
//     ),
//   ];
// }

// Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: <Widget>[
//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //   children: [
//           //     Container(
//           //       margin:
//           //           EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 40),
//           //       padding: EdgeInsets.all(22),
//           //       decoration: BoxDecoration(
//           //         color: Colors. white,
//           //         borderRadius: BorderRadius.circular(20),
//           //         boxShadow: [
//           //           BoxShadow(
//           //             offset: Offset(0, 10),
//           //             blurRadius: 50,
//           //             color: Color(0xA15AD9).withOpacity(0.25),
//           //           ),
//           //         ],
//           //       ),
//           //       child: Text(
//           //         "Skor Insomnia : ${suminsom}",
//           //         style: TextStyle(color: Colors.purple, fontSize: 16),
//           //       ),
//           //     ),
//           //     Container(
//           //       margin:
//           //           EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 40),
//           //       padding: EdgeInsets.all(22),
//           //       decoration: BoxDecoration(
//           //         color: Colors.white,
//           //         borderRadius: BorderRadius.circular(20),
//           //         boxShadow: [
//           //           BoxShadow(
//           //             offset: Offset(0, 10),
//           //             blurRadius: 50,
//           //             color: Color(0xA15AD9).withOpacity(0.25),
//           //           ),
//           //         ],
//           //       ),
//           //       child: Text(
//           //         "Skor Hasil : ${sum}",
//           //         style: TextStyle(color: Colors.purple, fontSize: 16),
//           //       ),
//           //     ),
//           //   ],
//           // ),
//           Container(
//             height: MediaQuery.of(context).size.height * 0.4,
//             margin: EdgeInsets.only(right: 20, left: 20),
//             padding: EdgeInsets.only(right: 25, top: 25, bottom: 10, left: 25),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(0, 10),
//                   blurRadius: 50,
//                   color: Color(0xA15AD9).withOpacity(0.25),
//                 ),
//               ],
//             ),
//             child: BarChart(
//               BarChartData(
//                 alignment: BarChartAlignment.spaceEvenly,
//                 maxY: 5,
//                 minY: 0,
//                 borderData: FlBorderData(
//                   show: false,
//                 ),
//                 // groupsSpace: 30,
//                 barTouchData: BarTouchData(enabled: false),
//                 titlesData: FlTitlesData(
//                   bottomTitles: SideTitles(
//                     showTitles: true,
//                     getTextStyles: (value) => const TextStyle(
//                         color: Colors.black,
//                         fontSize: 14,
//                         fontFamily: "Baloo Da"),
//                     margin: 10,
//                     getTitles: (double id) => BarData.barData
//                         .firstWhere((element) => element.id == id.toInt())
//                         .name,
//                   ),
//                   leftTitles: SideTitles(),
//                 ),
//                 barGroups: BarData.barData
//                     .map(
//                       (data) => BarChartGroupData(
//                         x: data.id,
//                         barRods: [
//                           BarChartRodData(
//                             y: data.y,
//                             width: 20,
//                             colors: [data.color],
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(6),
//                               topRight: Radius.circular(6),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                     .toList(),
//               ),
//             ),
//           ),
//           Container(
//             height: MediaQuery.of(context).size.height / 5,
//             margin: EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 40),
//             padding: EdgeInsets.all(22),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(0, 10),
//                   blurRadius: 50,
//                   color: Color(0xA15AD9).withOpacity(0.25),
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Container(
//                       width: 20,
//                       height: 20,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.red,
//                         boxShadow: [
//                           BoxShadow(
//                             offset: Offset(0, 10),
//                             blurRadius: 50,
//                             color: Colors.red.withOpacity(0.25),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       "Depresi   ",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       ":",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       kategoriDepresi,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Container(
//                       width: 20,
//                       height: 20,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.green,
//                         boxShadow: [
//                           BoxShadow(
//                             offset: Offset(0, 10),
//                             blurRadius: 50,
//                             color: Colors.green.withOpacity(0.25),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       "Cemas    ",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       ":",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       kategoriCemas,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Container(
//                       width: 20,
//                       height: 20,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.blue.shade900,
//                         boxShadow: [
//                           BoxShadow(
//                             offset: Offset(0, 10),
//                             blurRadius: 50,
//                             color: Colors.blue.withOpacity(0.25),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       "Stress     ",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       ":",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       kategoriStress,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Container(
//                       width: 20,
//                       height: 20,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.black,
//                         boxShadow: [
//                           BoxShadow(
//                             offset: Offset(0, 10),
//                             blurRadius: 50,
//                             color: Colors.blue.withOpacity(0.25),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       "Insomnia",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       ":",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Text(
//                       kategoriInsomnia,
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(right: 20),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.purple,
//                 shadowColor: Colors.purple.withOpacity(0.25),
//                 elevation: 1,
//                 shape: StadiumBorder(),
//                 side: BorderSide(color: Colors.white),
//               ),
//               onPressed: () {
//                 // _setResult();
//                 Get.off(() => Home());
//               },
//               child: Text("Beranda"),
//             ),
//           ),
//         ],
//       ),
//     );

class Result extends StatelessWidget {
  // const Result({
  //   Key? key,
  // }) : super(key: key);

  double categoryInsomnia = 0, categoryStress = 0, categoryDepresi = 0, categoryCemas = 0;

  String kategoriInsomnia = "Normal", kategoriStress = "Normal", kategoriDepresi = "Normal", kategoriCemas = "Normal";

  @override
  Widget build(BuildContext context) {
    int sum = 0;
    // int suminsom = 0;
    // List<int> insomniaQuestions = [1, 4, 7, 10, 12, 19, 27];
    QuestionController _qnController = Get.put(QuestionController());
    for (int i = 0; i < _qnController.answers.length; i++) {
      // if (insomniaQuestions.contains(i)) {
      //   suminsom += _qnController.answers[i];
      // } else {
      //   sum += _qnController.answers[i];
      // }
      sum += _qnController.answers[i];
    }

    if (sum.isBetween(10, 13)) {
      categoryDepresi = 1;
      kategoriDepresi = "Ringan";
    } else if (sum.isBetween(14, 20)) {
      categoryDepresi = 2;
      kategoriDepresi = "Sedang";
    } else if (sum.isBetween(21, 27)) {
      categoryDepresi = 3;
      kategoriDepresi = "Berat";
    } else if (sum >= 28) {
      categoryDepresi = 4;
      kategoriDepresi = "Sangat Berat";
    }

    if (sum.isBetween(8, 9)) {
      categoryCemas = 1;
      kategoriCemas = "Ringan";
    } else if (sum.isBetween(10, 14)) {
      categoryCemas = 2;
      kategoriCemas = "Sedang";
    } else if (sum.isBetween(15, 19)) {
      categoryCemas = 3;
      kategoriCemas = "Berat";
    } else if (sum >= 20) {
      categoryCemas = 4;
      kategoriCemas = "Sangat Berat";
    }

    if (sum.isBetween(15, 18)) {
      categoryStress = 1;
      kategoriStress = "Ringan";
    } else if (sum.isBetween(19, 25)) {
      categoryStress = 2;
      kategoriStress = "Sedang";
    } else if (sum.isBetween(26, 33)) {
      categoryStress = 3;
      kategoriStress = "Berat";
    } else if (sum >= 34) {
      categoryStress = 4;
      kategoriStress = "Sangat Berat";
    }

    // if (suminsom.isBetween(8, 14)) {
    //   categoryInsomnia = 1;
    //   kategoriInsomnia = "Ringan";
    // } else if (suminsom.isBetween(15, 21)) {
    //   categoryInsomnia = 2;
    //   kategoriInsomnia = "Sedang";
    // } else if (suminsom.isBetween(22, 28)) {
    //   categoryInsomnia = 3;
    //   kategoriInsomnia = "Berat";
    // }
    // print(suminsom);
    // print(sum);

    User? user = Provider.of<User?>(context);
    RiwayatServices.saveRiwayat(user!.uid, this).then((value) => Get.offAll(() => Home(2)));
    return Container(
      color: Colors.white,
      child: Lottie.asset(
        "assets/lottie/loader.json",
      ),
    );
  }
}

class Data {
  final int id;
  final String name;
  final double y;
  final Color color;
  final String kategori;

  const Data({
    required this.name,
    required this.id,
    required this.y,
    required this.color,
    required this.kategori,
  });
}

// class BarData {
//   static int interval = 1;

//   static List<Data> barData = [
//     Data(
//       id: 0,
//       name: 'Depresi',
//       y: Result.categoryDepresi,
//       color: Colors.red,
//       kategori: Result.kategoriDepresi,
//     ),
//     Data(
//       name: 'Cemas',
//       id: 1,
//       y: Result.categoryCemas,
//       color: Colors.greenAccent.shade700,
//       kategori: Result.kategoriCemas,
//     ),
//     Data(
//       name: 'Stress',
//       id: 2,
//       y: Result.categoryStress,
//       color: Colors.blue.shade900,
//       kategori: Result.kategoriStress,
//     ),
//     Data(
//       name: 'Insomnia',
//       id: 3,
//       y: Result.categoryInsomnia,
//       color: Colors.black,
//       kategori: Result.kategoriInsomnia,
//     ),
//   ];
// }
