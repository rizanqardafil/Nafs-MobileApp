import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nafs/terapi_istighfar/istighfar_page.dart';

class SliderWidget extends StatefulWidget {
  final double sliderHeight;
  final int min;
  final int max;
  final fullWidth;
  double value;

  SliderWidget({this.sliderHeight = 48, this.max = 10, this.min = 0, this.fullWidth = false, this.value = 0});

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _value = 0;
  Color color = Colors.green.shade300;
  List<bool> sud = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    double paddingFactor = .2;

    if (this.widget.fullWidth) paddingFactor = .3;

    return SafeArea(child: Scaffold(body: newMethod(paddingFactor, context)));
  }

  Column newMethod(double paddingFactor, BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Ringan",
              style: TextStyle(fontFamily: "Baloo Da", fontSize: 14),
            ),
            Text(
              "Sedang",
              style: TextStyle(fontFamily: "Baloo Da", fontSize: 14),
            ),
            Text(
              "Berat",
              style: TextStyle(fontFamily: "Baloo Da", fontSize: 14),
            ),
          ],
        ),
        // Container(
        //   width: double.infinity,
        //   margin: EdgeInsets.symmetric(horizontal: 8),
        //   padding: EdgeInsets.symmetric(horizontal: 8),
        //   height: (this.widget.sliderHeight),
        //   decoration: new BoxDecoration(
        //     borderRadius: new BorderRadius.all(
        //       Radius.circular((this.widget.sliderHeight * .3)),
        //     ),
        //     gradient: new LinearGradient(colors: [
        //       const Color(0xff16C79A),
        //       const Color(0xFFFAFF00),
        //       const Color(0xFFFF0000),
        //     ], stops: [
        //       0.0,
        //       0.5,
        //       1.0
        //     ], tileMode: TileMode.clamp),
        //   ),
        //   child: Padding(
        //     padding: EdgeInsets.fromLTRB(this.widget.sliderHeight * paddingFactor, 2, this.widget.sliderHeight * paddingFactor, 2),
        //     child: Row(
        //       children: <Widget>[
        //         Text(
        //           '${this.widget.min}',
        //           textAlign: TextAlign.center,
        //           style: TextStyle(
        //             fontSize: this.widget.sliderHeight * .3,
        //             fontWeight: FontWeight.w700,
        //             color: Colors.white,
        //           ),
        //         ),
        //         SizedBox(
        //           width: this.widget.sliderHeight * .1,
        //         ),
        //         Expanded(
        //           child: Center(
        //             child: SliderTheme(
        //               data: SliderTheme.of(context).copyWith(
        //                 activeTrackColor: Colors.white.withOpacity(1),
        //                 inactiveTrackColor: Colors.white.withOpacity(.5),
        //                 trackHeight: 4.0,
        //                 thumbColor: Colors.white,
        //                 thumbShape: CustomSliderThumbCircle(
        //                   thumbRadius: this.widget.sliderHeight * .4,
        //                   min: this.widget.min,
        //                   max: this.widget.max,
        //                   color: color,
        //                 ),
        //                 overlayColor: Colors.white.withOpacity(.4),
        //                 //valueIndicatorColor: Colors.white,
        //                 activeTickMarkColor: Colors.white,
        //                 inactiveTickMarkColor: Colors.white,
        //               ),
        //               child: Slider(
        //                 value: _value,
        //                 min: 0,
        //                 max: 100,
        //                 divisions: 10,
        //                 onChanged: (value) {
        //                   setState(() {
        //                     _value = value;
        //                     for (int i = 0; i <= 10; i++) {
        //                       sud[i] = false;
        //                     }
        //                     if (value == 0) {
        //                       color = Colors.green.shade300;
        //                       sud[0] = true;
        //                     } else if (value == 10) {
        //                       color = Colors.green.shade400;
        //                       sud[1] = true;
        //                     } else if (value == 20) {
        //                       color = Colors.green.shade500;
        //                       sud[2] = true;
        //                     } else if (value == 30) {
        //                       color = Colors.green.shade600;
        //                       sud[3] = true;
        //                     } else if (value == 40) {
        //                       color = Colors.yellow.shade600;
        //                       sud[4] = true;
        //                     } else if (value == 50) {
        //                       color = Colors.yellow.shade700;
        //                       sud[5] = true;
        //                     } else if (value == 60) {
        //                       color = Colors.yellow.shade800;
        //                       sud[6] = true;
        //                     } else if (value == 70) {
        //                       color = Colors.yellow.shade900;
        //                       sud[7] = true;
        //                     } else if (value == 80) {
        //                       color = Colors.red.shade500;
        //                       sud[8] = true;
        //                     } else if (value == 90) {
        //                       color = Colors.red.shade700;
        //                       sud[9] = true;
        //                     } else if (value == 100) {
        //                       color = Colors.red.shade900;
        //                       sud[10] = true;
        //                     }
        //                   });
        //                 },
        //               ),
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           width: this.widget.sliderHeight * .1,
        //         ),
        //         Text(
        //           '${this.widget.max}',
        //           textAlign: TextAlign.center,
        //           style: TextStyle(
        //             fontSize: this.widget.sliderHeight * .3,
        //             fontWeight: FontWeight.w700,
        //             color: Colors.white,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        Row(
          children: [
            container(context, Colors.green.shade300, 0),
            container(context, Colors.green.shade400, 1),
            container(context, Colors.green.shade500, 2),
            container(context, Colors.green.shade600, 3),
            container(context, Colors.yellow.shade600, 4),
            container(context, Colors.yellow.shade700, 5),
            container(context, Colors.yellow.shade800, 6),
            container(context, Colors.yellow.shade900, 7),
            container(context, Colors.red.shade500, 8),
            container(context, Colors.red.shade700, 9),
            container(context, Colors.red.shade900, 10),
          ],
        ),

        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Tenang",
              style: TextStyle(fontFamily: "Baloo Da", fontSize: 14),
            ),
            Text(
              "Stres",
              style: TextStyle(fontFamily: "Baloo Da", fontSize: 14, color: Colors.transparent),
            ),
            Text(
              "Stres",
              style: TextStyle(fontFamily: "Baloo Da", fontSize: 14),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SUD(
                  context,
                  0,
                  "Sangat tenang dan tidak merasa tertekan sama sekali",
                  Colors.green.shade300,
                  sud[0],
                ),
                // Divider(
                //   color: Colors.grey,
                //   thickness: 0.25,
                // ),
                SUD(
                  context,
                  1,
                  "Perasaan pada dasarnya baik, masih fokus dan tidak ada distress yang parah",
                  Colors.green.shade400,
                  sud[1],
                ),
                // Divider(
                //   color: Colors.grey,
                //   thickness: 0.25,
                // ),
                SUD(
                  context,
                  2,
                  "Sedikit merasa sedih /distress, namun tidak begitu disadari",
                  Colors.green.shade500,
                  sud[2],
                ),
                // Divider(
                //   color: Colors.grey,
                //   thickness: 0.25,
                // ),
                SUD(
                  context,
                  3,
                  "Agak khawatir/ kesal, namun masih bisa diatasi dengan baik",
                  Colors.green.shade600,
                  sud[3],
                ),
                // Divider(
                //   color: Colors.grey,
                //   thickness: 0.25,
                // ),
                SUD(
                  context,
                  4,
                  "Merasa cemas dan khawatir ringan hingga sedang",
                  Colors.yellow.shade600,
                  sud[4],
                ),
                // Divider(
                //   color: Colors.grey,
                //   thickness: 0.25,
                // ),
                SUD(
                  context,
                  5,
                  "Merasa kesal dan tidak nyaman, namun masih bisa diatasi dengan baik",
                  Colors.yellow.shade700,
                  sud[5],
                ),
                // Divider(
                //   color: Colors.grey,
                //   thickness: 0.25,
                // ),
                SUD(
                  context,
                  6,
                  "Merasa tidak nyaman dalam rentang sedang hingga kuat",
                  Colors.yellow.shade800,
                  sud[6],
                ),
                // Divider(
                //   color: Colors.grey,
                //   thickness: 0.25,
                // ),
                SUD(
                  context,
                  7,
                  "Ketidaknyamanan mendominasi pikiran, berjuang untuk bisa mengatasinya hingga kembali normal",
                  Colors.yellow.shade900,
                  sud[7],
                ),
                // Divider(
                //   color: Colors.grey,
                //   thickness: 0.25,
                // ),
                SUD(
                  context,
                  8,
                  "Khawatir dan panik, kehilangan fokus dan merasa cemas di tubuh",
                  Colors.red.shade500,
                  sud[8],
                ),
                // Divider(
                //   color: Colors.grey,
                //   thickness: 0.25,
                // ),
                SUD(
                  context,
                  9,
                  "Sangat cemas, putus asa, tidak berdaya dan tidak mampu menanganinya",
                  Colors.red.shade700,
                  sud[9],
                ),
                // Divider(
                //   color: Colors.grey,
                //   thickness: 0.25,
                // ),
                SUD(
                  context,
                  10,
                  "Sangat distress sampai tidak dapat berfungsi secara normal dan mungkin merasa berada di ambang kehancuran",
                  Colors.red.shade900,
                  sud[10],
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Get.off(() => IstighfarPage());
            print(_value ~/ 10);
            Navigator.pop(context, _value ~/ 10);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 1,
                  color: Colors.blue,
                ),
              ],
            ),
            child: Text(
              "Simpan",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Baloo Da",
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector container(BuildContext context, Color color, int num) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = num.toDouble() * 10;
          for (int i = 0; i <= 10; i++) {
            sud[i] = false;
          }
          if (num == 0) {
            color = Colors.green.shade300;
            sud[0] = true;
          } else if (num == 1) {
            color = Colors.green.shade400;
            sud[1] = true;
          } else if (num == 2) {
            color = Colors.green.shade500;
            sud[2] = true;
          } else if (num == 3) {
            color = Colors.green.shade600;
            sud[3] = true;
          } else if (num == 4) {
            color = Colors.yellow.shade600;
            sud[4] = true;
          } else if (num == 5) {
            color = Colors.yellow.shade700;
            sud[5] = true;
          } else if (num == 6) {
            color = Colors.yellow.shade800;
            sud[6] = true;
          } else if (num == 7) {
            color = Colors.yellow.shade900;
            sud[7] = true;
          } else if (num == 8) {
            color = Colors.red.shade500;
            sud[8] = true;
          } else if (num == 9) {
            color = Colors.red.shade700;
            sud[9] = true;
          } else if (num == 10) {
            color = Colors.red.shade900;
            sud[10] = true;
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.75),
          border: Border.all(color: (sud[num]) ? color : Colors.white, width: (sud[num]) ? 4 : 0),
        ),
        width: MediaQuery.of(context).size.width / 11,
        child: Center(
          child: Text(
            num.toString(),
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Baloo Da",
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector SUD(BuildContext context, int num, String text, Color color, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            _value = num.toDouble() * 10;
            for (int i = 0; i <= 10; i++) {
              sud[i] = false;
            }
            sud[num] = true;
            if (num == 0) {
              this.color = Colors.green.shade300;
            } else if (num == 1) {
              this.color = Colors.green.shade400;
            } else if (num == 2) {
              this.color = Colors.green.shade500;
            } else if (num == 3) {
              this.color = Colors.green.shade600;
            } else if (num == 4) {
              this.color = Colors.yellow.shade600;
            } else if (num == 5) {
              this.color = Colors.yellow.shade700;
            } else if (num == 6) {
              this.color = Colors.yellow.shade800;
            } else if (num == 7) {
              this.color = Colors.yellow.shade900;
            } else if (num == 8) {
              this.color = Colors.red.shade500;
            } else if (num == 9) {
              this.color = Colors.red.shade700;
            } else if (num == 10) {
              this.color = Colors.red.shade900;
            }
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 1,
              color: (isSelected) ? color.withOpacity(0.5) : Colors.transparent,
            ),
          ],
        ),
        child: ListTile(
          leading: Container(
            height: 30,
            width: 30,
            // margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Center(
              child: Text(
                num.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Baloo Da",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          title: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Baloo Da",
              // fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;
  final Color color;

  const CustomSliderThumbCircle({
    required this.thumbRadius,
    this.min = 0,
    this.max = 10,
    required this.color,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = color //Thumb Background Color
      ..style = PaintingStyle.fill;

    TextSpan span = new TextSpan(
      style: new TextStyle(
        fontSize: thumbRadius * .8,
        fontWeight: FontWeight.w700,
        color: sliderTheme.thumbColor, //Text Color of Value on Thumb
      ),
      text: getValue(value),
    );

    TextPainter tp = new TextPainter(text: span, textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter = Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    canvas.drawCircle(center, thumbRadius * .9, paint);
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }
}
