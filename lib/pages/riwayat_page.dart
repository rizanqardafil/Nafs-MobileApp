import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:lottie/lottie.dart';
import 'package:nafs/models/Riwayats.dart';
import 'package:nafs/riwayat_services.dart';
import 'package:nafs/screening/start_screening.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({Key? key}) : super(key: key);

  @override
  _RiwayatPageState createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  List<bool> isExpanded = [true, false, false, false];
  List<Color> gradientColors = [
    const Color(0xffC490E4),
    const Color(0xffF6C6EA),
  ];

  bool showAvg = false;
  bool isDotted = false;

  ValueNotifier<List<Event>> _selectedEvents = ValueNotifier([]);
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    _selectedDay = _focusedDay;
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);
    return FutureBuilder(
      future: RiwayatServices.getRiwayat(user!.uid),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List riwayat = snapshot.data as List;
          riwayat.sort((riwayat1, riwayat2) => riwayat1.time.compareTo(riwayat2.time));
          if (riwayat.isEmpty) {
            return Container(
              color: Color.fromRGBO(142, 151, 253, 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Anda Belum Pernah Screening",
                    style: TextStyle(fontFamily: "Baloo Da", color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => StartScreening());
                      },
                      child: Text(
                        "Mulai Screening",
                        style: TextStyle(fontFamily: "Baloo Da", fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple[200],
                        onPrimary: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            if (_selectedEvents.value.isEmpty && _focusedDay == DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)) {
              List<Event> _getEventsForDay(DateTime day) {
                final _kEventSource = Map.fromIterable(riwayat,
                    key: (item) => DateTime(item.time.year, item.time.month, item.time.day),
                    value: (item) => List.generate(
                        3,
                        (index) => Event(((index == 0)
                            ? '${item.kategoricemas}'
                            : (index == 1)
                                ? '${item.kategoristress}'
                                : '${item.kategoridepresi}'))));

                final kEvents = LinkedHashMap<DateTime, List<Event>>(
                  equals: isSameDay,
                )..addAll(_kEventSource);

                return kEvents[DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)] ?? [];
              }

              _selectedEvents.value = _getEventsForDay(DateTime.now());
            }

            List<FlSpot>? pointsCemas = <FlSpot>[];
            List<FlSpot>? pointsStress = <FlSpot>[];
            List<FlSpot>? pointsDepresi = <FlSpot>[];
            // List<FlSpot>? pointsInsom = <FlSpot>[];
            for (var cemas in riwayat) {
              if (cemas.time.month == DateTime.now().month) {
                pointsCemas.add(FlSpot(cemas.time.day.toDouble(), cemas.cemas));
                pointsStress.add(FlSpot(cemas.time.day.toDouble(), cemas.stress));
                pointsDepresi.add(FlSpot(cemas.time.day.toDouble(), cemas.depresi));
              }
              // pointsInsom
              //     .add(FlSpot(cemas.time.day.toDouble(), cemas.insomnia));
            }
            if (pointsCemas.length == 1) {
              isDotted = true;
            } else {
              isDotted = false;
            }

            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ExpansionPanelList(
                dividerColor: Colors.grey,
                elevation: 1,
                children: [
                  ExpansionPanel(
                    body: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: TableCalendar<Event>(
                            headerStyle: HeaderStyle(
                              formatButtonVisible: false,
                            ),
                            availableGestures: AvailableGestures.horizontalSwipe,
                            firstDay: DateTime(DateTime.now().year, DateTime.now().month - 3, DateTime.now().day),
                            lastDay: DateTime(DateTime.now().year, DateTime.now().month + 3, DateTime.now().day),
                            focusedDay: _focusedDay,
                            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                            calendarFormat: _calendarFormat,
                            locale: "in_ID",
                            eventLoader: (DateTime day) {
                              final _kEventSource = Map.fromIterable(
                                riwayat,
                                key: (item) => DateTime(item.time.year, item.time.month, item.time.day),
                                value: (item) => List.generate(
                                  3,
                                  (index) => Event(
                                    ((index == 0)
                                        ? '${item.kategoricemas}'
                                        : (index == 1)
                                            ? '${item.kategoristress}'
                                            : '${item.kategoridepresi}'),
                                  ),
                                ),
                              );
                              final kEvents = LinkedHashMap<DateTime, List<Event>>(
                                equals: isSameDay,
                              )..addAll(_kEventSource);

                              return kEvents[DateTime(day.year, day.month, day.day)] ?? [];
                            },
                            startingDayOfWeek: StartingDayOfWeek.monday,
                            calendarStyle: CalendarStyle(
                              selectedDecoration: BoxDecoration(color: Colors.purple[700], shape: BoxShape.circle),
                              markerDecoration: BoxDecoration(
                                color: Colors.purple[300],
                                shape: BoxShape.circle,
                              ),
                              markersMaxCount: 1,
                              outsideDaysVisible: false,
                            ),
                            onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                              if (!isSameDay(_selectedDay, selectedDay)) {
                                setState(() {
                                  _selectedDay = selectedDay;
                                  _focusedDay = focusedDay;
                                });

                                List<Event> _getEventsForDay(DateTime day) {
                                  final _kEventSource = Map.fromIterable(riwayat,
                                      key: (item) => DateTime(item.time.year, item.time.month, item.time.day),
                                      value: (item) => List.generate(
                                          3,
                                          (index) => Event(((index == 0)
                                              ? '${item.kategoricemas}'
                                              : (index == 1)
                                                  ? '${item.kategoristress}'
                                                  : '${item.kategoridepresi}'))));

                                  final kEvents = LinkedHashMap<DateTime, List<Event>>(
                                    equals: isSameDay,
                                  )..addAll(_kEventSource);

                                  // print(kEvents);
                                  return kEvents[DateTime(day.year, day.month, day.day)] ?? [];
                                }

                                _selectedEvents.value = _getEventsForDay(selectedDay);
                              }
                            },
                            onPageChanged: (focusedDay) {
                              _focusedDay = focusedDay;
                            },
                          ),
                        ),
                        const SizedBox(height: 18.0),
                        Flexible(
                          fit: FlexFit.loose,
                          child: ValueListenableBuilder<List<Event>>(
                            valueListenable: _selectedEvents,
                            builder: (context, value, _) {
                              return (value.isEmpty)
                                  ? Container(
                                      margin: const EdgeInsets.only(bottom: 38.0),
                                      child: Column(
                                        children: [
                                          Lottie.asset("assets/lottie/cross.json", height: MediaQuery.of(context).size.height / 4),
                                          Text(
                                            "Tidak ada data",
                                            style: TextStyle(fontFamily: "Baloo Da", fontSize: 20, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(
                                      margin: const EdgeInsets.only(bottom: 38.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 4.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.red.shade200),
                                                        borderRadius: BorderRadius.circular(12.0),
                                                        color: Colors.red[100]),
                                                    width: 50,
                                                    child: Image.asset("assets/test1.png"),
                                                  ),
                                                  Text(
                                                    "Stres",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: "Baloo Da",
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                width: MediaQuery.of(context).size.width /
                                                        ((value[2].toString() == "Sangat Berat")
                                                            ? 1
                                                            : (value[2].toString() == "Berat")
                                                                ? 2
                                                                : (value[2].toString() == "Sedang")
                                                                    ? 3
                                                                    : (value[2].toString() == "Ringan")
                                                                        ? 4
                                                                        : 1) -
                                                    ((value[2].toString() == "Sangat Berat" || value[2].toString() == "Normal") ? 86 : 0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: (value[2].toString() == "Normal") ? Colors.black : Colors.red.shade200),
                                                    borderRadius: BorderRadius.circular(12.0),
                                                    color: (value[2].toString() == "Normal") ? Colors.transparent : Colors.red[100]),
                                                child: ListTile(
                                                  title: Text(
                                                    '${value[2]}',
                                                    style: TextStyle(
                                                        color: (value[2].toString() == "Normal") ? Colors.black : Colors.white,
                                                        fontFamily: "Baloo Da",
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 4.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.green.shade200),
                                                        borderRadius: BorderRadius.circular(12.0),
                                                        color: Colors.green[100]),
                                                    width: 50,
                                                    child: Image.asset("assets/test2.png"),
                                                  ),
                                                  Text(
                                                    "Depresi",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: "Baloo Da",
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                width: MediaQuery.of(context).size.width /
                                                        ((value[1].toString() == "Sangat Berat")
                                                            ? 1
                                                            : (value[1].toString() == "Berat")
                                                                ? 2
                                                                : (value[1].toString() == "Sedang")
                                                                    ? 3
                                                                    : (value[1].toString() == "Ringan")
                                                                        ? 4
                                                                        : 1) -
                                                    ((value[1].toString() == "Sangat Berat" || value[1].toString() == "Normal") ? 86 : 0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: (value[1].toString() == "Normal") ? Colors.black : Colors.green.shade200),
                                                    borderRadius: BorderRadius.circular(12.0),
                                                    color: (value[1].toString() == "Normal") ? Colors.transparent : Colors.green[100]),
                                                child: ListTile(
                                                  title: Text(
                                                    '${value[1]}',
                                                    style: TextStyle(
                                                        color: (value[1].toString() == "Normal") ? Colors.black : Colors.white,
                                                        fontFamily: "Baloo Da",
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    margin: const EdgeInsets.symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 4.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(color: Colors.purple.shade200),
                                                        borderRadius: BorderRadius.circular(12.0),
                                                        color: Colors.purple[100]),
                                                    width: 50,
                                                    child: Image.asset("assets/test3.png"),
                                                  ),
                                                  Text(
                                                    "Cemas",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: "Baloo Da",
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Container(
                                                width: MediaQuery.of(context).size.width /
                                                        ((value[0].toString() == "Sangat Berat")
                                                            ? 1
                                                            : (value[0].toString() == "Berat")
                                                                ? 2
                                                                : (value[0].toString() == "Sedang")
                                                                    ? 3
                                                                    : (value[0].toString() == "Ringan")
                                                                        ? 4
                                                                        : 1) -
                                                    ((value[0].toString() == "Sangat Berat" || value[0].toString() == "Normal") ? 86 : 0),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: (value[0].toString() == "Normal") ? Colors.black : Colors.purple.shade200),
                                                    borderRadius: BorderRadius.circular(12.0),
                                                    color: (value[0].toString() == "Normal") ? Colors.transparent : Colors.purple[100]),
                                                child: ListTile(
                                                  title: Text(
                                                    '${value[0]}',
                                                    style: TextStyle(
                                                        color: (value[0].toString() == "Normal") ? Colors.black : Colors.white,
                                                        fontFamily: "Baloo Da",
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                            },
                          ),
                        ),
                      ],
                    ),
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Riwayat Hasil Skrining Anda",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "Baloo Da",
                          ),
                        ),
                      );
                    },
                    isExpanded: isExpanded[0],
                  ),
                  ExpansionPanel(
                    body: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Center(
                                      child: Text(
                                        "Stres",
                                        style: TextStyle(fontFamily: "Baloo Da", fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Geser",
                                          style: TextStyle(fontFamily: "Baloo Da", fontSize: 14),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          size: 14,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                AspectRatio(
                                  aspectRatio: 1.75,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(18),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10, right: 20.0, left: 12.0, bottom: 12),
                                      child: LineChart(LineChartData(
                                        lineTouchData: LineTouchData(enabled: false),
                                        titlesData: FlTitlesData(
                                          show: true,
                                          bottomTitles: SideTitles(
                                            showTitles: true,
                                            reservedSize: 22,
                                            getTextStyles: (context, value) => const TextStyle(
                                                color: Color(0xff68737d),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Baloo Da"),
                                            getTitles: (value) {
                                              switch (value.toInt()) {
                                                case 1:
                                                  return '1';
                                                case 5:
                                                  return '5';
                                                case 10:
                                                  return '10';
                                                case 15:
                                                  return '15';
                                                case 20:
                                                  return '20';
                                                case 25:
                                                  return '25';
                                                case 31:
                                                  return '31';
                                              }
                                              return '';
                                            },
                                            margin: 0,
                                          ),
                                          leftTitles: SideTitles(
                                            showTitles: true,
                                            // rotateAngle: 90,
                                            getTextStyles: (context, value) => const TextStyle(
                                              color: Color(0xff67727d),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              fontFamily: "Baloo Da",
                                            ),
                                            getTitles: (value) {
                                              switch (value.toInt()) {
                                                case 0:
                                                  return 'Normal';
                                                case 1:
                                                  return 'Ringan';
                                                case 2:
                                                  return 'Sedang';
                                                case 3:
                                                  return 'Berat';
                                                case 4:
                                                  return 'Sangat Berat';
                                              }
                                              return '';
                                            },
                                            reservedSize: 58,
                                            margin: 14,
                                          ),
                                        ),
                                        borderData: FlBorderData(
                                          show: false,
                                        ),
                                        minX: 0,
                                        maxX: 31,
                                        minY: -1,
                                        maxY: 4,
                                        lineBarsData: [
                                          LineChartBarData(
                                            spots: pointsStress,
                                            isCurved: true,
                                            colors: gradientColors,
                                            barWidth: 5,

                                            isStrokeCapRound: true,
                                            dotData: FlDotData(
                                              show: isDotted,
                                            ),
                                            // belowBarData: BarAreaData(
                                            //   show: true,
                                            //   colors:
                                            //       gradientColors.map((color) => color.withOpacity(0.3)).toList(),
                                            // ),
                                          ),
                                        ],
                                      )),
                                    ),
                                  ),
                                ),
                                Text(
                                  DateFormat.yMMMM("id_ID").format(DateTime.now()),
                                  style: TextStyle(fontFamily: "Baloo Da"),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  "Depresi",
                                  style: TextStyle(fontFamily: "Baloo Da", fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                AspectRatio(
                                  aspectRatio: 1.75,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(18),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10, right: 20.0, left: 12.0, bottom: 12),
                                      child: LineChart(LineChartData(
                                        lineTouchData: LineTouchData(enabled: false),
                                        titlesData: FlTitlesData(
                                          show: true,
                                          bottomTitles: SideTitles(
                                            showTitles: true,
                                            reservedSize: 22,
                                            getTextStyles: (context, value) => const TextStyle(
                                                color: Color(0xff68737d),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Baloo Da"),
                                            getTitles: (value) {
                                              switch (value.toInt()) {
                                                case 1:
                                                  return '1';
                                                case 5:
                                                  return '5';
                                                case 10:
                                                  return '10';
                                                case 15:
                                                  return '15';
                                                case 20:
                                                  return '20';
                                                case 25:
                                                  return '25';
                                                case 31:
                                                  return '31';
                                              }
                                              return '';
                                            },
                                            margin: 0,
                                          ),
                                          leftTitles: SideTitles(
                                            showTitles: true,
                                            // rotateAngle: 90,
                                            getTextStyles: (context, value) => const TextStyle(
                                              color: Color(0xff67727d),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              fontFamily: "Baloo Da",
                                            ),
                                            getTitles: (value) {
                                              switch (value.toInt()) {
                                                case 0:
                                                  return 'Normal';
                                                case 1:
                                                  return 'Ringan';
                                                case 2:
                                                  return 'Sedang';
                                                case 3:
                                                  return 'Berat';
                                                case 4:
                                                  return 'Sangat Berat';
                                              }
                                              return '';
                                            },
                                            reservedSize: 58,
                                            margin: 14,
                                          ),
                                        ),
                                        borderData: FlBorderData(
                                          show: false,
                                        ),
                                        minX: 0,
                                        maxX: 31,
                                        minY: -1,
                                        maxY: 4,
                                        lineBarsData: [
                                          LineChartBarData(
                                            spots: pointsDepresi,
                                            isCurved: true,
                                            colors: gradientColors,
                                            barWidth: 5,
                                            isStrokeCapRound: true,
                                            dotData: FlDotData(
                                              show: isDotted,
                                            ),
                                            // belowBarData: BarAreaData(
                                            //   show: true,
                                            //   colors:
                                            //       gradientColors.map((color) => color.withOpacity(0.3)).toList(),
                                            // ),
                                          ),
                                        ],
                                      )),
                                    ),
                                  ),
                                ),
                                Text(
                                  DateFormat.yMMMM("id_ID").format(DateTime.now()),
                                  style: TextStyle(fontFamily: "Baloo Da"),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  "Cemas",
                                  style: TextStyle(fontFamily: "Baloo Da", fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                AspectRatio(
                                  aspectRatio: 1.75,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(18),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10, right: 20.0, left: 12.0, bottom: 12),
                                      child: LineChart(LineChartData(
                                        lineTouchData: LineTouchData(enabled: false),
                                        titlesData: FlTitlesData(
                                          show: true,
                                          bottomTitles: SideTitles(
                                            showTitles: true,
                                            reservedSize: 22,
                                            getTextStyles: (context, value) => const TextStyle(
                                                color: Color(0xff68737d),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                fontFamily: "Baloo Da"),
                                            getTitles: (value) {
                                              switch (value.toInt()) {
                                                case 1:
                                                  return '1';
                                                case 5:
                                                  return '5';
                                                case 10:
                                                  return '10';
                                                case 15:
                                                  return '15';
                                                case 20:
                                                  return '20';
                                                case 25:
                                                  return '25';
                                                case 31:
                                                  return '31';
                                              }
                                              return '';
                                            },
                                            margin: 0,
                                          ),
                                          leftTitles: SideTitles(
                                            showTitles: true,
                                            // rotateAngle: 90,
                                            getTextStyles: (context, value) => const TextStyle(
                                              color: Color(0xff67727d),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              fontFamily: "Baloo Da",
                                            ),
                                            getTitles: (value) {
                                              switch (value.toInt()) {
                                                case 0:
                                                  return 'Normal';
                                                case 1:
                                                  return 'Ringan';
                                                case 2:
                                                  return 'Sedang';
                                                case 3:
                                                  return 'Berat';
                                                case 4:
                                                  return 'Sangat Berat';
                                              }
                                              return '';
                                            },
                                            reservedSize: 58,
                                            margin: 14,
                                          ),
                                        ),
                                        borderData: FlBorderData(
                                          show: false,
                                        ),
                                        minX: 0,
                                        maxX: 31,
                                        minY: -1,
                                        maxY: 4,
                                        lineBarsData: [
                                          LineChartBarData(
                                            spots: pointsCemas
                                            // FlSpot(0, 3),
                                            // FlSpot(2.6, 2),
                                            // FlSpot(4.9, 5),
                                            // FlSpot(6.8, 3.1),
                                            // FlSpot(8, 4),
                                            // FlSpot(9.5, 3),
                                            // FlSpot(11, 4),
                                            ,
                                            isCurved: true,

                                            colors: gradientColors,
                                            barWidth: 5,
                                            isStrokeCapRound: true,
                                            dotData: FlDotData(
                                              show: isDotted,
                                            ),
                                            // belowBarData: BarAreaData(
                                            //   show: true,
                                            //   colors:
                                            //       gradientColors.map((color) => color.withOpacity(0.3)).toList(),
                                            // ),
                                          ),
                                        ],
                                      )),
                                    ),
                                  ),
                                ),
                                Text(
                                  DateFormat.yMMMM("id_ID").format(DateTime.now()),
                                  style: TextStyle(fontFamily: "Baloo Da"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Grafik Hasil Skrining Anda",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "Baloo Da",
                          ),
                        ),
                      );
                    },
                    isExpanded: isExpanded[1],
                  ),

                  // ExpansionPanel(
                  //   body: Container(
                  //     padding: EdgeInsets.all(10),
                  //     child: Column(
                  //       children: [
                  //         AspectRatio(
                  //           aspectRatio: 1.75,
                  //           child: Container(
                  //             decoration: const BoxDecoration(
                  //               borderRadius: BorderRadius.all(
                  //                 Radius.circular(18),
                  //               ),
                  //             ),
                  //             child: Padding(
                  //               padding: const EdgeInsets.only(
                  //                   top: 10,
                  //                   right: 20.0,
                  //                   left: 12.0,
                  //                   bottom: 12),
                  //               child: LineChart(LineChartData(
                  //                 lineTouchData:
                  //                     LineTouchData(enabled: false),
                  //                 titlesData: FlTitlesData(
                  //                   show: true,
                  //                   bottomTitles: SideTitles(
                  //                     showTitles: true,
                  //                     reservedSize: 22,
                  //                     getTextStyles: (context, value) =>
                  //                         const TextStyle(
                  //                             color: Color(0xff68737d),
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 14,
                  //                             fontFamily: "Baloo Da"),
                  //                     getTitles: (value) {
                  //                       switch (value.toInt()) {
                  //                         case 1:
                  //                           return '1';
                  //                         case 5:
                  //                           return '5';
                  //                         case 10:
                  //                           return '10';
                  //                         case 15:
                  //                           return '15';
                  //                         case 20:
                  //                           return '20';
                  //                         case 25:
                  //                           return '25';
                  //                         case 31:
                  //                           return '31';
                  //                       }
                  //                       return '';
                  //                     },
                  //                     margin: 0,
                  //                   ),
                  //                   leftTitles: SideTitles(
                  //                     showTitles: true,
                  //                     // rotateAngle: 90,
                  //                     getTextStyles: (context, value) =>
                  //                         const TextStyle(
                  //                       color: Color(0xff67727d),
                  //                       fontWeight: FontWeight.bold,
                  //                       fontSize: 12,
                  //                       fontFamily: "Baloo Da",
                  //                     ),
                  //                     getTitles: (value) {
                  //                       switch (value.toInt()) {
                  //                         case 0:
                  //                           return 'Normal';
                  //                         case 1:
                  //                           return 'Ringan';
                  //                         case 2:
                  //                           return 'Sedang';
                  //                         case 3:
                  //                           return 'Berat';
                  //                         case 4:
                  //                           return 'Sangat Berat';
                  //                       }
                  //                       return '';
                  //                     },
                  //                     reservedSize: 58,
                  //                     margin: 14,
                  //                   ),
                  //                 ),
                  //                 borderData: FlBorderData(
                  //                   show: false,
                  //                 ),
                  //                 minX: 0,
                  //                 maxX: 31,
                  //                 minY: -1,
                  //                 maxY: 4,
                  //                 lineBarsData: [
                  //                   LineChartBarData(
                  //                     spots: pointsInsom,
                  //                     isCurved: true,
                  //                     colors: gradientColors,
                  //                     barWidth: 5,
                  //                     isStrokeCapRound: true,
                  //                     dotData: FlDotData(
                  //                       show: true,
                  //                     ),
                  //                     // belowBarData: BarAreaData(
                  //                     //   show: true,
                  //                     //   colors:
                  //                     //       gradientColors.map((color) => color.withOpacity(0.3)).toList(),
                  //                     // ),
                  //                   ),
                  //                 ],
                  //               )),
                  //             ),
                  //           ),
                  //         ),
                  //         Text(
                  //           DateFormat.yMMMM().format(riwayat[0].time),
                  //           style: TextStyle(fontFamily: "Baloo Da"),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //   headerBuilder: (BuildContext context, bool isExpanded) {
                  //     return Container(
                  //       padding: EdgeInsets.all(10),
                  //       child: Text(
                  //         "Grafik Kondisi Insomniamu",
                  //         style: TextStyle(
                  //           color: Colors.black,
                  //           fontSize: 18,
                  //           fontFamily: "Baloo Da",
                  //         ),
                  //       ),
                  //     );
                  //   },
                  //   isExpanded: isExpanded[3],
                  // ),
                ],
                expansionCallback: (int item, bool status) {
                  setState(() {
                    isExpanded[item] = !isExpanded[item];
                  });
                },
              ),
            );
          }
        } else {
          return SpinKitCircle(
            color: Colors.purple,
            size: 50,
          );
        }
      },
    );
  }
}

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}
