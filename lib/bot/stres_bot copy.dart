import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class StresBot extends StatefulWidget {
  const StresBot({Key? key}) : super(key: key);

  @override
  _StresBotState createState() => _StresBotState();
}

class _StresBotState extends State<StresBot> {
  final Controller controller = Get.put(Controller());
  final TextEditingController textController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int> typing = [9, 11, 22, 23, 24, 25];
    return Material(
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 100,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  reverse: true,
                  child: Column(
                    children: <Widget>[
                      BubbleChatBot("Hai, selamat datang pada sesi menyikapi stres", 2, false, controller, 1, controller._isLoaded[0]),
                      BubbleChatBot("Stres merupakan perasaan tidak mampu dalam mengatasi tuntutan-tuntutan dari lingkungan sekitar", 6,
                          false, controller, 2, controller._isLoaded[0]),
                      BubbleChatBot("Hampir setiap orang pernah merasakannya", 10, false, controller, 3, controller._isLoaded[0]),
                      BubbleChatBot("Apakah kamu pernah merasakannya juga?", 14, true, controller, 4, controller._isLoaded[0]),
                      Obx(
                        () {
                          // print(controller._answer);
                          // print(controller._isLoaded);
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 5)
                                ? ContainerText(controller._answer[4], Alignment.topRight, Colors.purple.shade100)
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        builder: (_controller) => (_controller._answer.length >= 5)
                            ? (_controller._answer[4] == "Contohnya?")
                                ? Column(
                                    children: [
                                      BubbleChatBot(
                                        "Contohnya adalah ketika kamu merasa benar-benar tidak mampu atau kesulitan mengerjakan soal matematika di sekolah. Hingga tidak jarang menghasilkan nilai matematika yang jelek. Padahal, guru dan orang tua mu selalu menuntut mu untuk memiliki nilai yang bagus.",
                                        4,
                                        false,
                                        _controller,
                                        5,
                                        _controller._isLoaded[4],
                                      ),
                                      BubbleChatBot(
                                        "Apakah kamu pernah atau baru saja mengalami hal serupa?",
                                        12,
                                        true,
                                        _controller,
                                        6,
                                        _controller._isLoaded[4],
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            : SizedBox(),
                      ),
                      Obx(
                        () {
                          if (controller._isAnswered.value) {
                            if (controller._answer.length >= 7) {
                              if (controller._answer[6] != "") {
                                return ContainerText(controller._answer[6], Alignment.topRight, Colors.purple.shade100);
                              } else {
                                return SizedBox();
                              }
                            } else {
                              return SizedBox();
                            }
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        builder: (_controller) {
                          if (_controller._answer.length >= 7) {
                            return (controller._answer[6] == "Tidak")
                                ? BubbleChatBot(
                                    "Alhamdulillah, semoga harimu menyenangkan", 4, false, _controller, 7, _controller._isLoaded[6])
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer46iya",
                        builder: (_controller) {
                          if (_controller._answer.length >= 5) {
                            // print("test");
                            if (_controller._answer[4] == "Iya") {
                              return Column(
                                children: [
                                  BubbleChatBot(
                                    "Terkadang, apa yang kita harapkan, tidak sesuai dengan kenyataan",
                                    4,
                                    false,
                                    _controller,
                                    5,
                                    _controller._isLoaded[4],
                                  ),
                                  BubbleChatBot(
                                    "Atau beban yang kita terima, terasa sangat berat",
                                    8,
                                    false,
                                    _controller,
                                    6,
                                    _controller._isLoaded[4],
                                  ),
                                  BubbleChatBot(
                                    "Tekanan dari lingkungan atau orang-orang di lingkungan sekitar, membuat kita merasa tidak mampu dalam menghadapi hal tersebut",
                                    12,
                                    false,
                                    _controller,
                                    7,
                                    _controller._isLoaded[4],
                                  ),
                                  BubbleChatBot(
                                    "Apakah kamu ingin bercerita tentang perasaan mu",
                                    20,
                                    true,
                                    _controller,
                                    8,
                                    _controller._isLoaded[4],
                                  ),
                                ],
                              );
                            }
                          }
                          if (_controller._answer.length >= 7) {
                            // print("object");
                            if (_controller._answer[6] == "Iya") {
                              return Column(
                                children: [
                                  BubbleChatBot(
                                    "Terkadang, apa yang kita harapkan, tidak sesuai dengan kenyataan",
                                    4,
                                    false,
                                    _controller,
                                    7,
                                    _controller._isLoaded[6],
                                  ),
                                  BubbleChatBot(
                                    "Atau beban yang kita terima, terasa sangat berat",
                                    8,
                                    false,
                                    _controller,
                                    8,
                                    _controller._isLoaded[6],
                                  ),
                                  BubbleChatBot(
                                    "Tekanan dari lingkungan atau orang-orang di lingkungan sekitar, membuat kita merasa tidak mampu dalam menghadapi hal tersebut",
                                    12,
                                    false,
                                    _controller,
                                    9,
                                    _controller._isLoaded[6],
                                  ),
                                  BubbleChatBot(
                                    "Apakah kamu ingin bercerita tentang perasaan mu",
                                    18,
                                    true,
                                    _controller,
                                    10,
                                    _controller._isLoaded[6],
                                  ),
                                ],
                              );
                            } else {
                              return SizedBox();
                            }
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                          init: controller,
                          id: "question10",
                          builder: (controller) {
                            // print(controller._answer.length.toString() + "obx");
                            if (controller._isAnswered.value) {
                              return (controller._answer.length >= 9 && controller._answer.length < 11)
                                  ? ContainerText(controller._answer[8], Alignment.topRight, Colors.purple.shade100)
                                  : (controller._answer.length >= 11)
                                      ? ContainerText(controller._answer[10], Alignment.topRight, Colors.purple.shade100)
                                      : SizedBox();
                            } else {
                              return SizedBox();
                            }
                          }),
                      GetBuilder<Controller>(
                        id: "answer10iya",
                        init: controller,
                        builder: (_controller) {
                          if (_controller._answer.length >= 11) {
                            return (controller._answer[10] == "Iya")
                                ? BubbleChatBot(
                                    "Ceritakanlah, aku akan selalu mendengarkan mu", 4, true, _controller, 11, _controller._isLoaded[10])
                                : SizedBox();
                          } else if (_controller._answer.length >= 9 && _controller._answer.length <= 11) {
                            return (controller._answer[8] == "Iya")
                                ? BubbleChatBot(
                                    "Ceritakanlah, aku akan selalu mendengarkan mu", 4, true, _controller, 9, _controller._isLoaded[8])
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                          id: "question11",
                          init: controller,
                          builder: (controller) {
                            // print(controller._questionNum.toString() + "qnums");
                            if (controller._isAnswered.value) {
                              if (controller._answer.length >= 12) {
                                if (controller._answer[11] != "") {
                                  return ContainerText(controller._answer[11], Alignment.topRight, Colors.purple.shade100);
                                } else {
                                  return SizedBox();
                                }
                              } else {
                                return SizedBox();
                              }
                            } else {
                              return SizedBox();
                            }
                          }),
                      GetBuilder<Controller>(
                        id: "question9",
                        init: controller,
                        builder: (controller) {
                          if (controller._answer.length >= 10) {
                            if (controller._isAnswered.value) {
                              if (controller._answer[9] != "") {
                                return ContainerText(controller._answer[9], Alignment.topRight, Colors.purple.shade100);
                              } else {
                                return SizedBox();
                              }
                            } else {
                              return SizedBox();
                            }
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                          id: "answer10tidak_22",
                          init: controller,
                          builder: (_controller) {
                            if (_controller._answer.length >= 11) {
                              return (controller._answer[10] == "Tidak")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                            "Aku mengerti apa yang kamu rasakan", 4, false, _controller, 11, _controller._isLoaded[10]),
                                        BubbleChatBot("Pasti sangat tidak nyaman", 8, false, _controller, 12, _controller._isLoaded[10]),
                                        BubbleChatBot(
                                            "Tapi ingatlah, bahwa Allah tidak akan pernah membebani hambaNya melebihi kapasitas yang dimilikinya",
                                            12,
                                            false,
                                            _controller,
                                            13,
                                            _controller._isLoaded[10]),
                                        BubbleChatBot(
                                            "Seperti yang tertulis dalam surat  Al-Baqarah ayat 286 yang berbunyi 'Laa yukallifullahu nafsan illa wus`aha' (Allah tidak akan membebanimu melebihi kemampuanmu)",
                                            18,
                                            false,
                                            _controller,
                                            14,
                                            _controller._isLoaded[10]),
                                        BubbleChatBot(
                                            "Mungkin kamu merasa tidak mampu", 26, false, _controller, 15, _controller._isLoaded[10]),
                                        BubbleChatBot(
                                            "Ya, aku sangat memahami hal itu", 30, false, _controller, 16, _controller._isLoaded[10]),
                                        BubbleChatBot("Tapi ku mohon bertahanlah", 34, false, _controller, 17, _controller._isLoaded[10]),
                                        BubbleChatBot("Ini tidak akan lama", 38, false, _controller, 18, _controller._isLoaded[10]),
                                        BubbleChatBot("Ini hanya sementara", 42, false, _controller, 19, _controller._isLoaded[10]),
                                        BubbleChatBot("Kamu hanya mendapati saat-saat malam dalam kehidupanmu", 46, false, _controller, 20,
                                            _controller._isLoaded[10]),
                                        BubbleChatBot(
                                            "Bertahanlah, dan jadilah kuat hingga matahari kebahagiaan terbit kembali dalam hidupmu",
                                            52,
                                            false,
                                            _controller,
                                            21,
                                            _controller._isLoaded[10]),
                                        BubbleChatBot("Boleh kah aku mendampingimu untuk terus bertahan?", 58, true, _controller, 22,
                                            _controller._isLoaded[10]),
                                      ],
                                    )
                                  : SizedBox();
                            } else {
                              return SizedBox();
                            }
                          }),
                      GetBuilder<Controller>(
                        id: "answer10tidak_20",
                        init: controller,
                        builder: (_controller) {
                          if (_controller._answer.length >= 9) {
                            return (controller._answer[8] == "Tidak")
                                ? Column(
                                    children: [
                                      BubbleChatBot(
                                          "Aku mengerti apa yang kamu rasakan", 4, false, _controller, 9, _controller._isLoaded[8]),
                                      BubbleChatBot("Pasti sangat tidak nyaman", 8, false, _controller, 10, _controller._isLoaded[8]),
                                      BubbleChatBot(
                                          "Tapi ingatlah, bahwa Allah tidak akan pernah membebani hambaNya melebihi kapasitas yang dimilikinya",
                                          12,
                                          false,
                                          _controller,
                                          11,
                                          _controller._isLoaded[8]),
                                      BubbleChatBot(
                                          "Seperti yang tertulis dalam surat  Al-Baqarah ayat 286 yang berbunyi 'Laa yukallifullahu nafsan illa wus`aha' (Allah tidak akan membebanimu melebihi kemampuanmu)",
                                          18,
                                          false,
                                          _controller,
                                          12,
                                          _controller._isLoaded[8]),
                                      BubbleChatBot(
                                          "Mungkin kamu merasa tidak mampu", 26, false, _controller, 13, _controller._isLoaded[8]),
                                      BubbleChatBot(
                                          "Ya, aku sangat memahami hal itu", 30, false, _controller, 14, _controller._isLoaded[8]),
                                      BubbleChatBot("Tapi ku mohon bertahanlah", 34, false, _controller, 15, _controller._isLoaded[8]),
                                      BubbleChatBot("Ini tidak akan lama", 38, false, _controller, 16, _controller._isLoaded[8]),
                                      BubbleChatBot("Ini hanya sementara", 42, false, _controller, 17, _controller._isLoaded[8]),
                                      BubbleChatBot("Kamu hanya mendapati saat-saat malam dalam kehidupanmu", 46, false, _controller, 18,
                                          _controller._isLoaded[8]),
                                      BubbleChatBot(
                                          "Bertahanlah, dan jadilah kuat hingga matahari kebahagiaan terbit kembali dalam hidupmu",
                                          52,
                                          false,
                                          _controller,
                                          19,
                                          _controller._isLoaded[8]),
                                      BubbleChatBot("Boleh kah aku mendampingimu untuk terus bertahan?", 58, true, _controller, 20,
                                          _controller._isLoaded[8]),
                                    ],
                                  )
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        id: "answer11_23",
                        init: controller,
                        builder: (_controller) {
                          if (_controller._answer.length >= 12) {
                            return (controller._answer[11] != "")
                                ? Column(
                                    children: [
                                      BubbleChatBot(
                                          "Aku mengerti apa yang kamu rasakan", 4, false, _controller, 12, _controller._isLoaded[11]),
                                      BubbleChatBot("Pasti sangat tidak nyaman", 8, false, _controller, 13, _controller._isLoaded[11]),
                                      BubbleChatBot(
                                          "Tapi ingatlah, bahwa Allah tidak akan pernah membebani hambaNya melebihi kapasitas yang dimilikinya",
                                          12,
                                          false,
                                          _controller,
                                          14,
                                          _controller._isLoaded[11]),
                                      BubbleChatBot(
                                          "Seperti yang tertulis dalam surat  Al-Baqarah ayat 286 yang berbunyi 'Laa yukallifullahu nafsan illa wus`aha' (Allah tidak akan membebanimu melebihi kemampuanmu)",
                                          18,
                                          false,
                                          _controller,
                                          15,
                                          _controller._isLoaded[11]),
                                      BubbleChatBot(
                                          "Mungkin kamu merasa tidak mampu", 26, false, _controller, 16, _controller._isLoaded[11]),
                                      BubbleChatBot(
                                          "Ya, aku sangat memahami hal itu", 30, false, _controller, 17, _controller._isLoaded[11]),
                                      BubbleChatBot("Tapi ku mohon bertahanlah", 34, false, _controller, 18, _controller._isLoaded[11]),
                                      BubbleChatBot("Ini tidak akan lama", 38, false, _controller, 19, _controller._isLoaded[11]),
                                      BubbleChatBot("Ini hanya sementara", 42, false, _controller, 20, _controller._isLoaded[11]),
                                      BubbleChatBot("Kamu hanya mendapati saat-saat malam dalam kehidupanmu", 46, false, _controller, 21,
                                          _controller._isLoaded[11]),
                                      BubbleChatBot(
                                          "Bertahanlah, dan jadilah kuat hingga matahari kebahagiaan terbit kembali dalam hidupmu",
                                          52,
                                          false,
                                          _controller,
                                          22,
                                          _controller._isLoaded[11]),
                                      BubbleChatBot("Boleh kah aku mendampingimu untuk terus bertahan?", 58, true, _controller, 23,
                                          _controller._isLoaded[11]),
                                    ],
                                  )
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        id: "answer11_21",
                        init: controller,
                        builder: (_controller) {
                          if (_controller._answer.length >= 10) {
                            return (controller._answer[9] != "")
                                ? Column(
                                    children: [
                                      BubbleChatBot(
                                          "Aku mengerti apa yang kamu rasakan", 4, false, _controller, 10, _controller._isLoaded[9]),
                                      BubbleChatBot("Pasti sangat tidak nyaman", 8, false, _controller, 11, _controller._isLoaded[9]),
                                      BubbleChatBot(
                                          "Tapi ingatlah, bahwa Allah tidak akan pernah membebani hambaNya melebihi kapasitas yang dimilikinya",
                                          12,
                                          false,
                                          _controller,
                                          12,
                                          _controller._isLoaded[9]),
                                      BubbleChatBot(
                                          "Seperti yang tertulis dalam surat  Al-Baqarah ayat 286 yang berbunyi 'Laa yukallifullahu nafsan illa wus`aha' (Allah tidak akan membebanimu melebihi kemampuanmu)",
                                          18,
                                          false,
                                          _controller,
                                          13,
                                          _controller._isLoaded[9]),
                                      BubbleChatBot(
                                          "Mungkin kamu merasa tidak mampu", 26, false, _controller, 14, _controller._isLoaded[9]),
                                      BubbleChatBot(
                                          "Ya, aku sangat memahami hal itu", 30, false, _controller, 15, _controller._isLoaded[9]),
                                      BubbleChatBot("Tapi ku mohon bertahanlah", 34, false, _controller, 16, _controller._isLoaded[9]),
                                      BubbleChatBot("Ini tidak akan lama", 38, false, _controller, 17, _controller._isLoaded[9]),
                                      BubbleChatBot("Ini hanya sementara", 42, false, _controller, 18, _controller._isLoaded[9]),
                                      BubbleChatBot("Kamu hanya mendapati saat-saat malam dalam kehidupanmu", 46, false, _controller, 19,
                                          _controller._isLoaded[9]),
                                      BubbleChatBot(
                                          "Bertahanlah, dan jadilah kuat hingga matahari kebahagiaan terbit kembali dalam hidupmu",
                                          52,
                                          false,
                                          _controller,
                                          20,
                                          _controller._isLoaded[9]),
                                      BubbleChatBot("Boleh kah aku mendampingimu untuk terus bertahan?", 58, true, _controller, 21,
                                          _controller._isLoaded[9]),
                                    ],
                                  )
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        id: "question20",
                        init: controller,
                        builder: (controller) {
                          // print(controller._answer.length.toString());
                          if (controller._answer[controller._answer.length - 1] != "" &&
                              [20, 21, 22, 23].contains(controller._questionNum.value)) {
                            return ContainerText(
                                controller._answer[controller._answer.length - 1], Alignment.topRight, Colors.purple.shade100);
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        id: "answer20tidak",
                        init: controller,
                        builder: (_controller) {
                          if ([20, 21, 22, 23].contains(controller._questionNum.value)) {
                            return (controller._answer[controller._answer.length - 1] == "Tidak")
                                ? BubbleChatBot("Oke, kembalilah di lain waktu, aku akan selalu ada untuk mu", 4, false, _controller,
                                    controller._answer.length, _controller._isLoaded[controller._answer.length - 1])
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        id: "answer20iya",
                        init: controller,
                        builder: (_controller) {
                          if ([20, 21, 22, 23].contains(controller._questionNum.value)) {
                            return (controller._answer[_controller._answer.length - 1] == "Iya")
                                ? Column(
                                    children: [
                                      BubbleChatBot("Oh ya, aku ingin mengetahui harapanmu setelah ini", 4, false, _controller,
                                          _controller._answer.length, _controller._isLoaded[_controller._answer.length - 1]),
                                      BubbleChatBot("Apakah kamu ingin menuliskannya?", 8, true, _controller,
                                          _controller._answer.length + 1, _controller._isLoaded[_controller._answer.length - 1]),
                                    ],
                                  )
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        id: "answer21tidak",
                        init: controller,
                        builder: (_controller) {
                          if ([22, 23, 24, 25].contains(controller._questionNum.value)) {
                            return (controller._answer[_controller._answer.length - 1] == "Tidak")
                                ? BubbleChatBot("Tidak apa-apa, tapi aku akan selalu ada untuk mendengarkan mu", 4, false, _controller,
                                    _controller._answer.length, _controller._isLoaded[_controller._answer.length - 1])
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        id: "question21",
                        init: controller,
                        builder: (controller) {
                          // print(controller._answer.length.toString());
                          if (controller._answer[controller._answer.length - 1] != "" &&
                              [22, 23, 24, 25].contains(controller._questionNum.value)) {
                            return ContainerText(
                                controller._answer[controller._answer.length - 1], Alignment.topRight, Colors.purple.shade100);
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        id: "answer21iya",
                        init: controller,
                        builder: (_controller) {
                          // print(controller._questionNum.value.toString());
                          if ([22, 23, 24, 25].contains(controller._questionNum.value)) {
                            return (controller._answer[controller._answer.length - 1] == "Iya")
                                ? BubbleChatBot("Tulislah, aku mendengarkanmu", 4, true, _controller, controller._answer.length,
                                    _controller._isLoaded[controller._answer.length - 1])
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        id: "question22",
                        init: controller,
                        builder: (controller) {
                          // print(controller._answer.length.toString());
                          if (controller._answer[controller._answer.length - 1] != "" &&
                              [23, 24, 25, 26].contains(controller._questionNum.value)) {
                            return ContainerText(
                                controller._answer[controller._answer.length - 1], Alignment.topRight, Colors.purple.shade100);
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        id: "answer22",
                        init: controller,
                        builder: (_controller) {
                          // print(controller._questionNum.value.toString());
                          if ([23, 24, 25, 26].contains(controller._questionNum.value)) {
                            return (controller._answer[controller._answer.length - 1] != "")
                                ? Column(
                                    children: [
                                      BubbleChatBot("Aku selalu berharap yang terbaik untukmu", 4, false, _controller,
                                          controller._answer.length, _controller._isLoaded[controller._answer.length - 1]),
                                    ],
                                  )
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.white,
                      child: (controller._isQuestion.value)
                          ? (!typing.contains(controller._questionNum.value))
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller._isQuestion.value = false;
                                        controller._isAnswered.value = true;
                                        controller._isTyping.value = true;

                                        // print(i.toString() + "i");
                                        // print(controller._questionNum.value.toString() + "num");
                                        // print(controller._answer.length.toString() + "ans");
                                        // print(controller._isLoaded.length.toString() + "load");
                                        if (controller._questionNum.value == 4) {
                                          controller._answer.addAll(List<String>.filled(4, ""));
                                          controller._answer.insert(controller._questionNum.value, "Contohnya?");
                                          controller._isLoaded.addAll(List<bool>.filled(6, false));
                                          controller._isLoaded.insert(0, true);
                                          controller.update();
                                        } else {
                                          for (int i = 0; i <= controller._questionNum.value; i++) {
                                            if (i > controller._answer.length) {
                                              controller._answer.addAll(
                                                  List<String>.filled((controller._questionNum.value - controller._answer.length), ""));
                                              controller._isLoaded.addAll(
                                                  List<bool>.filled((controller._questionNum.value - controller._isLoaded.length), false));
                                            }
                                            if (i == controller._questionNum.value) {
                                              controller._answer.insert(controller._questionNum.value, "Tidak");
                                              if (i == 6) {
                                                controller._isLoaded.insert(4, true);
                                                controller.update();
                                              } else if (i == 8) {
                                                controller._isLoaded.insert(4, true);
                                                controller.update(["question10", "answer46iya", "answer10tidak_20"], true);
                                              } else if (i == 10) {
                                                controller._isLoaded.insert(6, true);
                                                controller.update(["question10", "answer46iya", "answer10tidak_22"], true);
                                              } else if (i == 20) {
                                                controller._isLoaded.insert(8, true);
                                                controller.update(["question20", "answer10tidak_20", "answer20tidak"], true);
                                              } else if (i == 21) {
                                                controller._isLoaded.insert(9, true);
                                                controller.update(["question20", "answer11_21", "answer20tidak"], true);
                                              } else if (i == 22) {
                                                if (controller._answer[20] == "Tidak") {
                                                  controller._isLoaded.insert(controller._answer.length - 1, false);
                                                  controller.update(["question21", "answer20tidak", "answer21tidak"], true);
                                                } else {
                                                  controller._isLoaded.insert(10, true);
                                                  controller.update(["question20", "answer10tidak_22", "answer20tidak"], true);
                                                }
                                              } else if (i == 23) {
                                                if (controller._answer[21] == "Tidak") {
                                                  controller._isLoaded.insert(controller._answer.length - 1, false);
                                                  controller.update(["question21", "answer20tidak", "answer21tidak"], true);
                                                } else {
                                                  controller._isLoaded.insert(11, true);
                                                  controller.update(["question20", "answer11_23", "answer20tidak"], true);
                                                }
                                              } else if (i == 24) {
                                                controller._isLoaded.insert(controller._answer.length - 1, false);
                                                controller.update(["question21", "answer20tidak", "answer21tidak"], true);
                                              } else if (i == 25) {
                                                controller._isLoaded.insert(controller._answer.length - 1, false);
                                                controller.update(["question21", "answer20tidak", "answer21tidak"], true);
                                              }
                                            }
                                          }
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                                        margin: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: (Colors.purple[100]),
                                        ),
                                        child: Text((controller._questionNum.value == 4) ? "Contohnya?" : "Tidak"),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.grey,
                                      onTap: () {
                                        // print(controller._questionNum.value.toString() + "num");
                                        controller._isQuestion.value = false;
                                        controller._isTyping.value = true;
                                        controller._isAnswered.value = true;
                                        if (controller._questionNum.value == 4) {
                                          controller._answer.addAll(List<String>.filled(4, ""));
                                          controller._answer.insert(controller._questionNum.value, "Iya");
                                          controller._isLoaded.addAll(List<bool>.filled(6, false));
                                          controller._isLoaded.insert(0, true);
                                          controller.update(["answer46iya"]);
                                        } else {
                                          for (int i = 0; i <= controller._questionNum.value; i++) {
                                            // print(i.toString() + "i");
                                            // print(controller._questionNum.value.toString() + "num");
                                            // print(controller._answer.length.toString() + "length");
                                            if (i > controller._answer.length) {
                                              controller._answer.addAll(
                                                  List<String>.filled((controller._questionNum.value - controller._answer.length), ""));
                                              controller._isLoaded.addAll(
                                                  List<bool>.filled((controller._questionNum.value - controller._isLoaded.length), false));
                                              // print(controller._isLoaded.length.toString());
                                            }
                                            if (i == controller._questionNum.value) {
                                              // print(i.toString() + "in");
                                              controller._answer.insert(controller._questionNum.value, "Iya");
                                              // print(controller._isLoaded.length.toString() + "load");
                                              // print(i.toString());
                                              // print(controller._answer);
                                              if (i == 6) {
                                                controller._isLoaded.insert(4, true);
                                                controller.update(["answer46iya"]);
                                                // controller.update();
                                              } else if (i == 8) {
                                                controller._isLoaded.insert(4, true);
                                                controller.update(["question10", "answer46iya", "answer10iya"], true);
                                              } else if (i == 10) {
                                                controller._isLoaded.insert(6, true);
                                                controller.update(["question10", "answer46iya", "answer10iya"], true);
                                              } else if (i == 20) {
                                                controller._isLoaded.insert(8, true);
                                                controller.update(["question20", "answer10tidak_20", "answer20iya"], true);
                                              } else if (i == 21) {
                                                controller._isLoaded.insert(9, true);
                                                controller.update(["question20", "answer11_21", "answer20iya"], true);
                                              } else if (i == 22) {
                                                if (controller._answer[20] == "Iya") {
                                                  controller._isLoaded.insert(controller._answer.length - 1, false);
                                                  controller._isTyping.value = true;

                                                  controller.update(["question21", "answer20iya", "answer21iya"], true);
                                                } else {
                                                  controller._isLoaded.insert(10, true);
                                                  controller.update(["question20", "answer10tidak_22", "answer20iya"], true);
                                                }
                                              } else if (i == 23) {
                                                print(controller._answer);
                                                if (controller._answer[21] == "Iya") {
                                                  print("object");
                                                  controller._isLoaded.insert(controller._answer.length - 1, false);
                                                  controller._isTyping.value = true;

                                                  controller.update(["question21", "answer20iya", "answer21iya"], true);
                                                } else {
                                                  controller._isLoaded.insert(11, true);
                                                  controller.update(["question20", "answer11_23", "answer20iya"], true);
                                                }
                                              } else if (i == 24) {
                                                controller._isLoaded.insert(controller._answer.length - 1, false);
                                                controller._isTyping.value = true;

                                                controller.update(["question21", "answer20iya", "answer21iya"], true);
                                              } else if (i == 25) {
                                                controller._isLoaded.insert(controller._answer.length - 1, false);
                                                controller._isTyping.value = true;

                                                controller.update(["question21", "answer20iya", "answer21iya"], true);
                                              }
                                            }
                                          }
                                        }
                                        // controller.update();
                                      },
                                      child: Container(
                                          padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                                          margin: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: (Colors.purple[100]),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(1, 1),
                                                blurRadius: 1,
                                                color: Colors.purple.shade100,
                                              ),
                                            ],
                                          ),
                                          child: Text("Iya")),
                                    )
                                  ],
                                )
                              : (typing.contains(controller._questionNum.value))
                                  ? ListTile(
                                      title: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(15)),
                                          color: Color.fromRGBO(220, 220, 220, 0.5),
                                        ),
                                        padding: EdgeInsets.only(left: 15),
                                        child: Form(
                                          key: _formKey,
                                          child: TextFormField(
                                            controller: textController,
                                            decoration: InputDecoration(
                                              hintText: "Masukkan Pesan Anda",
                                              hintStyle: TextStyle(color: Colors.black26),
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                            ),
                                            style: TextStyle(fontSize: 16, color: Colors.black),
                                            onChanged: (value) {},
                                            onTap: () {
                                              // if (controller._questionNum.value == 9) {
                                              //   controller._isLoaded.insert(0, true);
                                              //   controller._isLoaded.insert(8, true);
                                              // } else if (controller._questionNum.value == 11) {
                                              //   controller._isLoaded.insert(10, true);
                                              // }
                                              print(controller._questionNum.value.toString() + "qnNumType");
                                              // print(controller._isLoaded[controller._questionNum.value - 1].value.toString());

                                              if (typing.contains(controller._questionNum.value)) {
                                                if (controller._isLoaded.length == controller._questionNum.value + 1) {
                                                  print("object");
                                                  controller._isLoaded[controller._questionNum.value - 1] = true;
                                                } else {
                                                  controller._isLoaded.insert(controller._questionNum.value - 1, true);
                                                }
                                                print(controller._isLoaded);
                                                // controller._isLoaded.insert(0, true);
                                              }
                                            },
                                            onEditingComplete: () {},
                                            onFieldSubmitted: (value) {},
                                            onSaved: (value) {},
                                            // keyboardType: ,
                                          ),
                                        ),
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(
                                          Icons.send,
                                          size: 30.0,
                                          color: Colors.purple,
                                        ),
                                        onPressed: () {
                                          if (textController.text == "") {
                                            textController.text = "Lewati";
                                          }
                                          controller._isQuestion.value = false;
                                          controller._isAnswered.value = true;

                                          for (int i = 0; i <= controller._questionNum.value; i++) {
                                            // print(i.toString() + "i");
                                            // print(controller._questionNum.value.toString() + "num");
                                            // print(controller._answer.length.toString() + "ans");
                                            // print(controller._isLoaded.length.toString() + "load");
                                            if (i > controller._answer.length) {
                                              controller._answer.add("");
                                              controller._isLoaded.add(false);
                                            } else if (i == controller._questionNum.value) {
                                              controller._answer.insert(controller._questionNum.value, textController.text);
                                              if (i == 9) {
                                                print("object");
                                                controller.update(["question9", "answer11_21"], true);
                                              } else if (i == 11) {
                                                controller.update(["question11", "answer10iya", "answer11"], true);
                                              }

                                              if ([22, 23, 24, 25].contains(controller._questionNum.value)) {
                                                controller._isTyping.value = true;
                                                controller.update(["answer21iya", "question22", "answer22"], true);
                                              }
                                            }
                                          }
                                          // controller.update();
                                        },
                                      ),
                                    )
                                  : SizedBox()
                          : SizedBox(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BubbleChatBot extends StatelessWidget {
  final String text;
  final int duration;
  final bool question;
  final Controller controller;
  final int position;
  final bool isLoaded;

  BubbleChatBot(this.text, this.duration, this.question, this.controller, this.position, this.isLoaded) {}
  @override
  Widget build(BuildContext context) {
    if (isLoaded) {
      return ContainerText(text, Alignment.topLeft, Colors.grey.shade200);
    } else {
      return FutureBuilder(
        future: Future.delayed(Duration(seconds: duration), () {
          if (question) {
            controller._isQuestion.value = true;
            controller._questionNum.value = position;
          }
        }),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ContainerText(text, Alignment.topLeft, Colors.grey.shade200);
          } else {
            return FutureBuilder(
                future: Future.delayed(Duration(seconds: duration - 2)),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ContainerLoad();
                  } else {
                    return SizedBox();
                  }
                });
          }
        },
      );
    }
  }
}

class ContainerLoad extends StatelessWidget {
  const ContainerLoad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade200,
            ),
            padding: EdgeInsets.all(16),
            child: SpinKitThreeBounce(
              color: Colors.purple,
              size: 20,
            )),
      ),
    );
  }
}

class ContainerText extends StatelessWidget {
  const ContainerText(this.text, this.alignment, this.color);

  final String text;
  final Alignment alignment;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      child: Align(
        alignment: alignment,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          padding: EdgeInsets.all(16),
          child: Text(
            text,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}

class Controller extends GetxController {
  RxBool _isQuestion = false.obs;
  RxBool _isAnswered = false.obs;
  RxBool _isTyping = false.obs;
  RxList _isLoaded = [false].obs;
  RxInt _questionNum = 0.obs;
  RxList _answer = [""].obs;
}
