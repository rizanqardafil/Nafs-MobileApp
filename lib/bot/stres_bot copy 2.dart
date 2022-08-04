import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nafs/terapi_istighfar/istighfar_page.dart';
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
  Color color = Colors.transparent;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<int> typing = [3, 11, 13, 17, 21, 35, 40, 42, 44, 59, 66, 67, 83];
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/1bot.png"), fit: BoxFit.cover)),
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height - 100,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  reverse: true,
                  child: Column(
                    children: <Widget>[
                      BubbleChatBot("Assalamualaikum warahmatullahi wabarakatuh", 2, false, controller, 1, controller._isLoaded[0]),
                      BubbleChatBot("Hai, bagaimana kabarmu hari ini?", 6, true, controller, 2, controller._isLoaded[0]),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer1",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 3)
                                ? ContainerText(controller._answer[2], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question3baik",
                        builder: (_controller) => (_controller._answer.length >= 3)
                            ? (_controller._answer[2] == "Alhamdulillah baik")
                                ? Column(
                                    children: [
                                      BubbleChatBot(
                                        "Alhamdulillah, aku harap, keadaanmu baik selalu",
                                        4,
                                        false,
                                        _controller,
                                        3,
                                        _controller._isLoaded[3],
                                      ),
                                      BubbleChatBot(
                                        "Apakah kamu memiliki pikiran yang buruk terhadap sesuatu yang telah menimpamu?",
                                        8,
                                        true,
                                        _controller,
                                        10,
                                        _controller._isLoaded[3],
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            : SizedBox(),
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question3tidak",
                        builder: (_controller) => (_controller._answer.length >= 3)
                            ? (_controller._answer[2] == "Sedang tidak baik-baik saja")
                                ? Column(
                                    children: [
                                      BubbleChatBot(
                                        "Ceritakanlah keadaanmu lebih jauh saat ini",
                                        4,
                                        true,
                                        _controller,
                                        3,
                                        _controller._isLoaded[2],
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            : SizedBox(),
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer3tidak",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 4)
                                ? (controller._answer[3] != "")
                                    ? ContainerText(controller._answer[3], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question4tidak",
                        builder: (_controller) => (_controller._answer.length >= 4)
                            ? (_controller._answer[3] != "")
                                ? Column(
                                    children: [
                                      BubbleChatBot(
                                        "Tidak masalah untuk merasa tidak baik-baik saja",
                                        4,
                                        false,
                                        _controller,
                                        4,
                                        _controller._isLoaded[3],
                                      ),
                                      BubbleChatBot(
                                        "Mungkin kamu merasa penat, lelah, kesal, banyak pikiran, atau perasaan lainnya membuatmu stres",
                                        8,
                                        false,
                                        _controller,
                                        5,
                                        _controller._isLoaded[3],
                                      ),
                                      BubbleChatBot(
                                        "Its okay, itu nggak masalah",
                                        14,
                                        false,
                                        _controller,
                                        6,
                                        _controller._isLoaded[3],
                                      ),
                                      BubbleChatBot(
                                        "Karena terkadang, dunia ini tidak selalu sesuai dengan apa yang kita inginkan",
                                        18,
                                        false,
                                        _controller,
                                        7,
                                        _controller._isLoaded[3],
                                      ),
                                      BubbleChatBot(
                                        "Terkadang kita berpikir bahwa dunia ini tidak adil",
                                        24,
                                        false,
                                        _controller,
                                        8,
                                        _controller._isLoaded[3],
                                      ),
                                      BubbleChatBot(
                                        "Tidak berpihak kepada kita, baik itu keluarga, sekolah, masyarakat, dan lingkungan lainnya sekitar kita ",
                                        28,
                                        false,
                                        _controller,
                                        9,
                                        _controller._isLoaded[3],
                                      ),
                                      BubbleChatBot(
                                        "Apakah kamu memiliki pikiran yang buruk terhadap sesuatu yang telah menimpamu?",
                                        34,
                                        true,
                                        _controller,
                                        10,
                                        _controller._isLoaded[3],
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            : SizedBox(),
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer10",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 11)
                                ? (controller._answer[10] != "")
                                    ? ContainerText(controller._answer[10], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question10tidak",
                        builder: (_controller) => (_controller._answer.length >= 11)
                            ? (_controller._answer[10] == "Tidak")
                                ? Column(
                                    children: [
                                      BubbleChatBot(
                                        "Apa yang kamu pikirkan?",
                                        4,
                                        true,
                                        _controller,
                                        11,
                                        _controller._isLoaded[10],
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            : SizedBox(),
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question10iya",
                        builder: (_controller) => (_controller._answer.length >= 11)
                            ? (_controller._answer[10] == "Iya")
                                ? Column(
                                    children: [
                                      BubbleChatBot(
                                        "Maukah kamu menceritakannya kepadaku?",
                                        4,
                                        true,
                                        _controller,
                                        12,
                                        _controller._isLoaded[10],
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            : SizedBox(),
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer12",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 13)
                                ? (controller._answer[12] != "")
                                    ? ContainerText(controller._answer[12], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer11",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 12)
                                ? (controller._answer[11] != "")
                                    ? ContainerText(controller._answer[11], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question12iya",
                        builder: (_controller) => (_controller._answer.length >= 13)
                            ? (_controller._answer[12] == "Iya")
                                ? Column(
                                    children: [
                                      BubbleChatBot(
                                        "Ceritakanlah",
                                        4,
                                        true,
                                        _controller,
                                        13,
                                        _controller._isLoaded[12],
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            : SizedBox(),
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer12",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 14)
                                ? (controller._answer[13] != "")
                                    ? ContainerText(controller._answer[13], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question13iya",
                        builder: (_controller) => (_controller._answer.length >= 14)
                            ? (_controller._answer[13] != "")
                                ? Column(
                                    children: [
                                      BubbleChatBot(
                                        "Aku harap, hal tersebut tidak benar-benar terjadi dalam hidupmu",
                                        4,
                                        false,
                                        _controller,
                                        14,
                                        _controller._isLoaded[13],
                                      ),
                                      BubbleChatBot(
                                        "Pasti akan menderita sekali jika itu terjadi",
                                        8,
                                        false,
                                        _controller,
                                        15,
                                        _controller._isLoaded[13],
                                      ),
                                      BubbleChatBot(
                                        "Apakah pikiran tersebut mengganggu rutinitasmu?",
                                        12,
                                        true,
                                        _controller,
                                        16,
                                        _controller._isLoaded[13],
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            : SizedBox(),
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question12tidak",
                        builder: (_controller) => (_controller._answer.length >= 13)
                            ? (_controller._answer[12] == "Tidak")
                                ? Column(
                                    children: [
                                      BubbleChatBot(
                                        "Apakah pikiran tersebut mengganggu rutinitasmu?",
                                        4,
                                        true,
                                        _controller,
                                        16,
                                        _controller._isLoaded[12],
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            : SizedBox(),
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question12",
                        builder: (_controller) => (_controller._answer.length >= 12)
                            ? (_controller._answer[11] != "")
                                ? Column(
                                    children: [
                                      BubbleChatBot(
                                        "Apakah pikiran tersebut mengganggu rutinitasmu?",
                                        4,
                                        true,
                                        _controller,
                                        16,
                                        _controller._isLoaded[11],
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            : SizedBox(),
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer16",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 17)
                                ? (controller._answer[16] != "")
                                    ? ContainerText(controller._answer[16], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question17iya",
                        builder: (_controller) {
                          return (_controller._answer.length >= 17)
                              ? (_controller._answer[16] == "Iya")
                                  ? BubbleChatBot(
                                      "Rutinitas apa saja yang berubah?",
                                      4,
                                      true,
                                      _controller,
                                      17,
                                      _controller._isLoaded[16],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer17",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 18)
                                ? (controller._answer[17] != "")
                                    ? ContainerText(controller._answer[17], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question18",
                        builder: (_controller) {
                          return (_controller._answer.length >= 18)
                              ? (_controller._answer[17] != "")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Pikiran tersebut pasti sangat mengganggu kehidupanmu",
                                          4,
                                          false,
                                          _controller,
                                          18,
                                          _controller._isLoaded[17],
                                        ),
                                        BubbleChatBot(
                                          "Apakah kamu merasa sangat tertekan dengan keadaanmu saat ini?",
                                          8,
                                          true,
                                          _controller,
                                          20,
                                          _controller._isLoaded[17],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question17tidak",
                        builder: (_controller) {
                          return (_controller._answer.length >= 17)
                              ? (_controller._answer[16] == "Tidak")
                                  ? BubbleChatBot(
                                      "Apakah kamu merasa sangat tertekan dengan keadaanmu saat ini?",
                                      4,
                                      true,
                                      _controller,
                                      20,
                                      _controller._isLoaded[16],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer18",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 21)
                                ? (controller._answer[20] != "")
                                    ? ContainerText(controller._answer[20], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question19tidak",
                        builder: (_controller) {
                          return (_controller._answer.length >= 21)
                              ? (_controller._answer[20] == "Tidak")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Okey, semoga harimu indah selalu 😀",
                                          4,
                                          false,
                                          _controller,
                                          22,
                                          _controller._isLoaded[20],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question19iya",
                        builder: (_controller) {
                          return (_controller._answer.length >= 21)
                              ? (_controller._answer[20] == "Iya")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Permasalahan apa saja yang membuatmu tertekan?",
                                          4,
                                          true,
                                          _controller,
                                          21,
                                          _controller._isLoaded[20],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer19",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 22)
                                ? (controller._answer[21] != "")
                                    ? ContainerText(controller._answer[21], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question20",
                        builder: (_controller) {
                          return (_controller._answer.length >= 22)
                              ? (_controller._answer[21] != "")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Aku memahamimu, terkadang, apa yang kita harapkan, tidak sesuai dengan kenyataan",
                                          4,
                                          false,
                                          _controller,
                                          22,
                                          _controller._isLoaded[21],
                                        ),
                                        BubbleChatBot(
                                          "Atau beban yang kita terima, terasa sangat berat",
                                          10,
                                          false,
                                          _controller,
                                          23,
                                          _controller._isLoaded[21],
                                        ),
                                        BubbleChatBot(
                                          "Tekanan dari lingkungan sekitar, membuat kita merasa tidak mampu dalam menghadapi hal tersebut",
                                          14,
                                          false,
                                          _controller,
                                          24,
                                          _controller._isLoaded[21],
                                        ),
                                        BubbleChatBot(
                                          "Apakah kamu siap untuk tetap bertahan dalam situasi sulit ini?",
                                          20,
                                          true,
                                          _controller,
                                          25,
                                          _controller._isLoaded[21],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer25",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 26)
                                ? (controller._answer[25] != "")
                                    ? ContainerText(controller._answer[25], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question26iya",
                        builder: (_controller) {
                          return (_controller._answer.length >= 26)
                              ? (_controller._answer[25] == "Iya")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Semangat !!!",
                                          2,
                                          false,
                                          _controller,
                                          26,
                                          _controller._isLoaded[25],
                                        ),
                                        BubbleChatBot(
                                          "Yakinlah, setelah kesulitan ini, pasti ada kemudahan dibaliknya",
                                          8,
                                          false,
                                          _controller,
                                          27,
                                          _controller._isLoaded[25],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question26tidak",
                        builder: (_controller) {
                          return (_controller._answer.length >= 26)
                              ? (_controller._answer[25] == "Tidak")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Aku mengerti apa yang kamu rasakan",
                                          4,
                                          false,
                                          _controller,
                                          26,
                                          _controller._isLoaded[25],
                                        ),
                                        BubbleChatBot(
                                          "Pasti sangat tidak nyaman",
                                          8,
                                          false,
                                          _controller,
                                          27,
                                          _controller._isLoaded[25],
                                        ),
                                        BubbleChatBot(
                                          "Mungkin kamu merasa tidak mampu",
                                          12,
                                          false,
                                          _controller,
                                          28,
                                          _controller._isLoaded[25],
                                        ),
                                        BubbleChatBot(
                                          "Ya, aku sangat memahami hal itu",
                                          16,
                                          false,
                                          _controller,
                                          29,
                                          _controller._isLoaded[25],
                                        ),
                                        BubbleChatBot(
                                          "Tapi ku mohon bertahanlah",
                                          20,
                                          false,
                                          _controller,
                                          30,
                                          _controller._isLoaded[25],
                                        ),
                                        BubbleChatBot(
                                          "Ini tidak akan lama",
                                          24,
                                          false,
                                          _controller,
                                          31,
                                          _controller._isLoaded[25],
                                        ),
                                        BubbleChatBot(
                                          "Ini hanya sementara",
                                          28,
                                          false,
                                          _controller,
                                          32,
                                          _controller._isLoaded[25],
                                        ),
                                        BubbleChatBot(
                                          "Kamu hanya mendapati saat-saat malam dalam kehidupanmu",
                                          32,
                                          false,
                                          _controller,
                                          33,
                                          _controller._isLoaded[25],
                                        ),
                                        BubbleChatBot(
                                          "Bertahanlah, dan jadilah kuat hingga matahari kebahagiaan terbit kembali dalam hidupmu",
                                          38,
                                          false,
                                          _controller,
                                          34,
                                          _controller._isLoaded[25],
                                        ),
                                        BubbleChatBot(
                                          "Apa yang kamu harapkan setelah masa-masa sulit ini berlalu?",
                                          44,
                                          true,
                                          _controller,
                                          35,
                                          _controller._isLoaded[25],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer35",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 35)
                                ? (controller._answer[34] != "")
                                    ? ContainerText(controller._answer[34], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question36",
                        builder: (_controller) {
                          return (_controller._answer.length >= 35)
                              ? (_controller._answer[34] != "")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Aku selalu berharap yang terbaik untukmu",
                                          4,
                                          false,
                                          _controller,
                                          36,
                                          _controller._isLoaded[33],
                                        ),
                                        BubbleChatBot(
                                          "Mungkin Allah memberimu sedikit kesulitan, agar kamu bisa terus berkembang",
                                          8,
                                          false,
                                          _controller,
                                          37,
                                          _controller._isLoaded[33],
                                        ),
                                        BubbleChatBot(
                                          "Atau mungkin Allah sedang menyiapkan skenario yang lebih baik untuk mu",
                                          16,
                                          false,
                                          _controller,
                                          38,
                                          _controller._isLoaded[33],
                                        ),
                                        BubbleChatBot(
                                          "Apakah kamu sudah merasa lebih baik?",
                                          22,
                                          true,
                                          _controller,
                                          39,
                                          _controller._isLoaded[33],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer39",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 40)
                                ? (controller._answer[39] != "")
                                    ? ContainerText(controller._answer[39], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question39iya",
                        builder: (_controller) {
                          return (_controller._answer.length >= 40)
                              ? (_controller._answer[39] == "Iya")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Apa yang ingin kamu lakukan setelah ini?",
                                          4,
                                          true,
                                          _controller,
                                          40,
                                          _controller._isLoaded[39],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer40iya",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 41)
                                ? (controller._answer[40] != "")
                                    ? ContainerText(controller._answer[40], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question41iya",
                        builder: (_controller) => (_controller._answer.length >= 41)
                            ? (_controller._answer[40] != "")
                                ? Column(
                                    children: [
                                      BubbleChatBot(
                                        "Semangat !!!",
                                        4,
                                        false,
                                        _controller,
                                        41,
                                        _controller._isLoaded[40],
                                      ),
                                      BubbleChatBot(
                                        "Semoga kamu selalu diberi kemudahan",
                                        8,
                                        false,
                                        _controller,
                                        42,
                                        _controller._isLoaded[40],
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            : SizedBox(),
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question39tidak",
                        builder: (_controller) {
                          return (_controller._answer.length >= 40)
                              ? (_controller._answer[39] == "Tidak")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Apakah aku boleh menemanimu lebih lanjut?",
                                          4,
                                          true,
                                          _controller,
                                          41,
                                          _controller._isLoaded[39],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer41",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 42)
                                ? (controller._answer[41] != "")
                                    ? ContainerText(controller._answer[41], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question42tidak",
                        builder: (_controller) {
                          return (_controller._answer.length >= 42)
                              ? (_controller._answer[41] == "Tidak")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Apa yang ingin kamu lakukan setelah ini?",
                                          4,
                                          true,
                                          _controller,
                                          42,
                                          _controller._isLoaded[41],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer42",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 43)
                                ? (controller._answer[42] != "")
                                    ? ContainerText(controller._answer[42], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question43",
                        builder: (_controller) => (_controller._answer.length >= 43)
                            ? (_controller._answer[42] != "")
                                ? Column(
                                    children: [
                                      BubbleChatBot(
                                        "Semangat !!!",
                                        4,
                                        false,
                                        _controller,
                                        43,
                                        _controller._isLoaded[42],
                                      ),
                                      BubbleChatBot(
                                        "Semoga kamu selalu diberi kemudahan",
                                        8,
                                        false,
                                        _controller,
                                        44,
                                        _controller._isLoaded[42],
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            : SizedBox(),
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question42iya",
                        builder: (_controller) {
                          return (_controller._answer.length >= 42)
                              ? (_controller._answer[41] == "Iya")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Apakah kamu ingin mendengar cerita dariku?",
                                          4,
                                          true,
                                          _controller,
                                          43,
                                          _controller._isLoaded[41],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer43",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 44)
                                ? (controller._answer[43] != "")
                                    ? ContainerText(controller._answer[43], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question44tidak",
                        builder: (_controller) {
                          return (_controller._answer.length >= 44)
                              ? (_controller._answer[43] == "Tidak")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Apa yang ingin kamu lakukan setelah ini?",
                                          4,
                                          true,
                                          _controller,
                                          44,
                                          _controller._isLoaded[43],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer44tidak",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 45)
                                ? (controller._answer[44] != "")
                                    ? ContainerText(controller._answer[44], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question45tidak",
                        builder: (_controller) => (_controller._answer.length >= 45)
                            ? (_controller._answer[44] != "")
                                ? Column(
                                    children: [
                                      BubbleChatBot(
                                        "Semangat !!!",
                                        4,
                                        false,
                                        _controller,
                                        45,
                                        _controller._isLoaded[44],
                                      ),
                                      BubbleChatBot(
                                        "Semoga kamu selalu diberi kemudahan",
                                        8,
                                        false,
                                        _controller,
                                        45,
                                        _controller._isLoaded[44],
                                      ),
                                    ],
                                  )
                                : SizedBox()
                            : SizedBox(),
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question44iya",
                        builder: (_controller) {
                          return (_controller._answer.length >= 44)
                              ? (_controller._answer[43] == "Iya")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Apakah kamu pernah mendengar nama Sultan Muhammad Al-Fatih?",
                                          4,
                                          true,
                                          _controller,
                                          45,
                                          _controller._isLoaded[43],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer45tidak",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 46)
                                ? (controller._answer[45] != "")
                                    ? ContainerText(controller._answer[45], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question46",
                        builder: (_controller) {
                          return (_controller._answer.length >= 46)
                              ? (_controller._answer[45] != "")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Sultan Muhammad Al-Fatih merupakan Sultan Turki Utsmani yang berhasil menaklukkan benteng kostantinopel",
                                          4,
                                          false,
                                          _controller,
                                          46,
                                          _controller._isLoaded[45],
                                        ),
                                        BubbleChatBot(
                                          "Pada jalan penaklukan Konstantinopel, Sultan Muhammad Al-Fatih menemukan banyak tekanan.",
                                          10,
                                          false,
                                          _controller,
                                          47,
                                          _controller._isLoaded[45],
                                        ),
                                        BubbleChatBot(
                                          "Karena setelah beberapa bulan mengepung benteng Konstantinopel, tanda-tanda kemenangan belum juga muncul",
                                          16,
                                          false,
                                          _controller,
                                          48,
                                          _controller._isLoaded[45],
                                        ),
                                        BubbleChatBot(
                                          "Puncaknya pada saat armada lautnya mengalami kekalahan",
                                          20,
                                          false,
                                          _controller,
                                          49,
                                          _controller._isLoaded[45],
                                        ),
                                        BubbleChatBot(
                                          "Padahal, pasukannya sudah cukup kelelahan",
                                          24,
                                          false,
                                          _controller,
                                          50,
                                          _controller._isLoaded[45],
                                        ),
                                        BubbleChatBot(
                                          "Persediaan amunisi mulai berkurang",
                                          28,
                                          false,
                                          _controller,
                                          51,
                                          _controller._isLoaded[45],
                                        ),
                                        BubbleChatBot(
                                          "Persediaan makanan juga semakin menipis",
                                          32,
                                          false,
                                          _controller,
                                          52,
                                          _controller._isLoaded[45],
                                        ),
                                        BubbleChatBot(
                                          "Dan salah satu menterinya mendesak Sultan untuk mundur",
                                          36,
                                          false,
                                          _controller,
                                          56,
                                          _controller._isLoaded[45],
                                        ),
                                        BubbleChatBot(
                                          "Kondisi tersebut sangat sulit bukan?",
                                          40,
                                          false,
                                          _controller,
                                          57,
                                          _controller._isLoaded[45],
                                        ),
                                        BubbleChatBot(
                                          "Bisa jadi saat ini kamu juga mengalami tingkat kesulitan yang sama",
                                          44,
                                          false,
                                          _controller,
                                          58,
                                          _controller._isLoaded[45],
                                        ),
                                        BubbleChatBot(
                                          "Dalam kondisi tersebut, kira-kira, apa yang dilakukan oleh Sultan Muhammad Al-Fatih?",
                                          50,
                                          true,
                                          _controller,
                                          59,
                                          _controller._isLoaded[45],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer59",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 59)
                                ? (controller._answer[58] != "")
                                    ? ContainerText(controller._answer[58], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question60",
                        builder: (_controller) {
                          return (_controller._answer.length >= 59)
                              ? (_controller._answer[58] != "")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Sultan Muhammad Al-Fatih berusaha untuk bangkit dan menata kembali strateginya",
                                          4,
                                          false,
                                          _controller,
                                          59,
                                          _controller._isLoaded[57],
                                        ),
                                        BubbleChatBot(
                                          "Serta berusaha mencari celah untuk membalikkan keadaan",
                                          10,
                                          false,
                                          _controller,
                                          60,
                                          _controller._isLoaded[57],
                                        ),
                                        BubbleChatBot(
                                          "Sultan Muhammad Al-Fatih tidak menghiraukan bisikan-bisikan orang lain untuk mundur",
                                          14,
                                          false,
                                          _controller,
                                          61,
                                          _controller._isLoaded[57],
                                        ),
                                        BubbleChatBot(
                                          "Setelah berdoa dan berusaha, Sultan mengajukan ide yang belum pernah terpikirkan sebelumnya",
                                          20,
                                          false,
                                          _controller,
                                          62,
                                          _controller._isLoaded[57],
                                        ),
                                        BubbleChatBot(
                                          "Sultan memindahkan kapal-kapal melewati pegunungan ke daerah teluk, tempat yang sudah diamankan oleh lawannya",
                                          26,
                                          false,
                                          _controller,
                                          63,
                                          _controller._isLoaded[57],
                                        ),
                                        BubbleChatBot(
                                          "Hal itu sangat mengejutkan pihak lawan",
                                          32,
                                          false,
                                          _controller,
                                          64,
                                          _controller._isLoaded[57],
                                        ),
                                        BubbleChatBot(
                                          "Dan dengannya, Sultan dapat menaklukkan benteng konstantinopel",
                                          36,
                                          false,
                                          _controller,
                                          65,
                                          _controller._isLoaded[57],
                                        ),
                                        BubbleChatBot(
                                          "Kira-kira, hikmah apa yang kamu dapatkan dari kisah Sultan Muhammad Al-Fatih tersebut?",
                                          40,
                                          true,
                                          _controller,
                                          66,
                                          _controller._isLoaded[57],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer66",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 66)
                                ? (controller._answer[65] != "")
                                    ? ContainerText(controller._answer[65], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question67",
                        builder: (_controller) {
                          return (_controller._answer.length >= 66)
                              ? (_controller._answer[65] != "")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Apakah kamu mendapatkan pencerahan dari kisah tersebut?",
                                          4,
                                          true,
                                          _controller,
                                          67,
                                          _controller._isLoaded[63],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer67",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 67)
                                ? (controller._answer[66] != "")
                                    ? ContainerText(controller._answer[66], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question68",
                        builder: (_controller) {
                          return (_controller._answer.length >= 67)
                              ? (_controller._answer[66] != "")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Melalui sepotong kisah tersebut, terdapat beberapa hal yang dilakukan oleh Sultan ketika berada dalam kondisi tertekan, yaitu percaya (iman), bangkit (tidak berputus asa), dan berusaha (ikhtiar).",
                                          4,
                                          false,
                                          _controller,
                                          68,
                                          _controller._isLoaded[64],
                                        ),
                                        BubbleChatBot(
                                          "Sultan percaya bahwa cita-citanya akan terwujud, walaupun dengan cara yang tidak  mudah. ",
                                          12,
                                          false,
                                          _controller,
                                          69,
                                          _controller._isLoaded[64],
                                        ),
                                        BubbleChatBot(
                                          "Karena Sultan yakin, bahwa setelah kesulitan, pasti ada kemudahan",
                                          16,
                                          false,
                                          _controller,
                                          70,
                                          _controller._isLoaded[64],
                                        ),
                                        BubbleChatBot(
                                          "Seperti yang tertulis  dalam surat Al-Insyirah ayat 5 dan 6 yang artinya 'Maka sesungguhnya, bersama kesulitan, ada kemudahan. Sesungguhnya bersama kesullitan ada kemudahan'",
                                          22,
                                          false,
                                          _controller,
                                          70,
                                          _controller._isLoaded[64],
                                        ),
                                        BubbleChatBot(
                                          "Untuk kamu, yakinlah bahwa kesulitan yang kamu alami saat ini, adalah awal dari kemudahanmu di masa depan",
                                          28,
                                          false,
                                          _controller,
                                          71,
                                          _controller._isLoaded[64],
                                        ),
                                        BubbleChatBot(
                                          "Tekanan yang kamu rasakan saat ini adalah proses dirimu menuju perkembangan diri dan kedewasaan",
                                          34,
                                          false,
                                          _controller,
                                          72,
                                          _controller._isLoaded[64],
                                        ),
                                        BubbleChatBot(
                                          "Setelah itu, Sultan menguatkan keyakinan ini dengan memperbanyak ibadah dan doa, serta selalu berperasangka baik atas apa yang telah terjadi kepada Allah",
                                          40,
                                          false,
                                          _controller,
                                          73,
                                          _controller._isLoaded[64],
                                        ),
                                        BubbleChatBot(
                                          "Selain beribadah dan berdoa, Sultan juga berusaha dengan pikiran dan tenaganya.",
                                          48,
                                          false,
                                          _controller,
                                          74,
                                          _controller._isLoaded[64],
                                        ),
                                        BubbleChatBot(
                                          "Hingga akhirnya berhasil menaklukkan benteng Konstantinopel",
                                          52,
                                          false,
                                          _controller,
                                          75,
                                          _controller._isLoaded[64],
                                        ),
                                        BubbleChatBot(
                                          "Tidak cukup dengan keyakinan dan ibadah saja. Berbagai macam usaha juga harus kamu lakukan",
                                          58,
                                          false,
                                          _controller,
                                          76,
                                          _controller._isLoaded[64],
                                        ),
                                        BubbleChatBot(
                                          "Uraikan dan selesaikan msasalahmu satu persatu",
                                          62,
                                          false,
                                          _controller,
                                          77,
                                          _controller._isLoaded[64],
                                        ),
                                        BubbleChatBot(
                                          "Mintalah bantuan orang lain jika dibutuhkan",
                                          66,
                                          false,
                                          _controller,
                                          78,
                                          _controller._isLoaded[64],
                                        ),
                                        BubbleChatBot(
                                          "Proses jatuh bangun, bangkit tersungkur, ",
                                          70,
                                          false,
                                          _controller,
                                          79,
                                          _controller._isLoaded[64],
                                        ),
                                        BubbleChatBot(
                                          "Akan sepadan dengan kesuksesan yang akan kamu terima nanti, juga akan membuat dirimu terus berkembang dan lebih baik dari sebelumnya",
                                          76,
                                          false,
                                          _controller,
                                          80,
                                          _controller._isLoaded[64],
                                        ),
                                        BubbleChatBot(
                                          "Jangan merasa sia-sia terhadap apa yang sudah kamu usahakan, terhadap sakit yang kamu rasakan, terhadap waktu yang telah kamu luangkan",
                                          82,
                                          false,
                                          _controller,
                                          81,
                                          _controller._isLoaded[64],
                                        ),
                                        BubbleChatBot(
                                          "Bangkitlah walaupun dengan tertatih, berjalanlah walaupun dengan merintih, ",
                                          86,
                                          false,
                                          _controller,
                                          82,
                                          _controller._isLoaded[64],
                                        ),
                                        BubbleChatBot(
                                          "Setelah mendengar cerita ini, apa yang akan kamu lakukan selanjutnya?",
                                          90,
                                          true,
                                          _controller,
                                          83,
                                          _controller._isLoaded[64],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer83",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 83)
                                ? (controller._answer[82] != "")
                                    ? ContainerText(controller._answer[82], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question84",
                        builder: (_controller) {
                          return (_controller._answer.length >= 83)
                              ? (_controller._answer[82] != "")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Semangat!! Semoga apa yang telah terjadi, dapat menjadikanmu lebih kuat :)",
                                          4,
                                          false,
                                          _controller,
                                          84,
                                          _controller._isLoaded[79],
                                        ),
                                        BubbleChatBot(
                                          "Apakah kamu sudah merasa lebih baik?",
                                          8,
                                          true,
                                          _controller,
                                          85,
                                          _controller._isLoaded[79],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer85",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 86)
                                ? (controller._answer[85] != "")
                                    ? ContainerText(controller._answer[85], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                    : SizedBox()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question86iya",
                        builder: (_controller) {
                          return (_controller._answer.length >= 86)
                              ? (_controller._answer[85] == "Iya")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Alhamdulillah, semoga hari-harimu menyenangkan",
                                          4,
                                          false,
                                          _controller,
                                          86,
                                          _controller._isLoaded[85],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question86tidak",
                        builder: (_controller) {
                          return (_controller._answer.length >= 86)
                              ? (_controller._answer[85] == "Tidak")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Ingin mencoba terapi?",
                                          4,
                                          true,
                                          _controller,
                                          86,
                                          _controller._isLoaded[85],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "answer86",
                        builder: (controller) {
                          if (controller._isAnswered.value) {
                            return (controller._answer.length >= 87)
                                ? (controller._answer[86] == "Iya")
                                    ? (controller._answer[86] != "")
                                        ? ContainerText(controller._answer[86], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                        : SizedBox()
                                    : ContainerText(controller._answer[85], Alignment.topRight, Colors.purple.shade300, isAnswer: true)
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question87tidak",
                        builder: (_controller) {
                          return (_controller._answer.length >= 87)
                              ? (_controller._answer[86] == "Tidak")
                                  ? Column(
                                      children: [
                                        BubbleChatBot(
                                          "Oke, kembalilah jika kamu membutuhkan",
                                          4,
                                          false,
                                          _controller,
                                          87,
                                          _controller._isLoaded[86],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
                        },
                      ),
                      GetBuilder<Controller>(
                        init: controller,
                        id: "question87iya",
                        builder: (_controller) {
                          return (_controller._answer.length >= 87)
                              ? (_controller._answer[86] == "Iya")
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Text(
                                                "Istighfar Untuk Tenang",
                                                style: TextStyle(
                                                  color: Colors.black.withOpacity(1),
                                                  fontFamily: "Baloo Da",
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(8),
                                              width: MediaQuery.of(context).size.width / 1.75,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        "assets/decoration/card_terapi_decoration.png",
                                                      ),
                                                      fit: BoxFit.contain,
                                                      alignment: Alignment.topRight),
                                                  color: Color(0xffFCB887),
                                                  borderRadius: BorderRadius.circular(12)),
                                              child: NeumorphicButton(
                                                onPressed: () {
                                                  Get.to(() => IstighfarPage());
                                                },
                                                provideHapticFeedback: true,
                                                style: NeumorphicStyle(
                                                  shape: NeumorphicShape.concave,
                                                  boxShape: NeumorphicBoxShape.roundRect(
                                                    BorderRadius.circular(12),
                                                  ),
                                                  depth: 2,
                                                  lightSource: LightSource.topLeft,
                                                  color: Colors.transparent,
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.center,
                                                      child: Image.network(
                                                        "https://lh3.googleusercontent.com/pw/AM-JKLUBCFeepskBgsPyRBYVbzcouzBvR-lTgd1ax8QI64Y7X-aQYO7-TaR-w8iSukgvnGf7vEPSPPj4FGNKBTvjgwe0S2c80cCgZr9MOIlOfFDiMezmQaV34OHutqqXH8HXT009gFYWcA6I7fZSjARiy6eG=s947-no",
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  : SizedBox()
                              : SizedBox();
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
                      color: color,
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

                                        if (controller._questionNum.value == 2) {
                                          controller._answer.addAll(List<String>.filled(2, ""));
                                          controller._answer.insert(controller._questionNum.value, "Alhamdulillah baik");
                                          controller._isLoaded.addAll(List<bool>.filled(2, false));
                                          controller._isLoaded.insert(0, true);
                                          controller.update(["answer1", "question3baik"]);
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

                                              if (i == 10) {
                                                controller._isLoaded.insert(3, true);
                                                controller.update(["question3baik", "question4tidak", "question10tidak", "answer10"], true);
                                              } else if (i == 12) {
                                                controller._isLoaded.insert(10, true);
                                                controller.update(["answer12", "question12tidak"], true);
                                              } else if (i == 16) {
                                                controller._isLoaded.insert(11, true);
                                                controller._isLoaded.insert(12, true);
                                                controller._isLoaded.insert(13, true);
                                                controller.update(["answer16", "question17tidak"], true);
                                              } else if (i == 20) {
                                                controller._isLoaded.insert(16, true);
                                                controller._isLoaded.insert(17, true);
                                                controller.update(["answer18", "question19tidak"], true);
                                              } else if (i == 25) {
                                                controller._isLoaded.insert(21, true);
                                                controller.update(["answer25", "question26tidak"], true);
                                              } else if (i == 39) {
                                                controller._isLoaded.insert(33, true);
                                                controller.update(["answer39", "question39tidak"], true);
                                              } else if (i == 41) {
                                                controller._isLoaded.insert(39, true);
                                                controller.update(["answer41", "question42tidak"], true);
                                              } else if (i == 43) {
                                                controller._isLoaded.insert(41, true);
                                                controller.update(["answer43", "question44tidak"], true);
                                              } else if (i == 45) {
                                                controller._isLoaded.insert(43, true);
                                                controller.update(["answer45tidak", "question44iya", "question46"], true);
                                              } else if (i == 85) {
                                                controller._isLoaded.insert(79, true);
                                                controller.update(["answer85", "question86tidak"], true);
                                              } else if (i == 86) {
                                                controller._isLoaded.insert(85, true);
                                                controller.update(["answer86", "question87tidak"], true);
                                              }
                                            }
                                          }
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: (Colors.purple[300]),
                                        ),
                                        child: Text((controller._questionNum.value == 2) ? "Alhamdulillah baik" : "Tidak",
                                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal)),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.grey,
                                      onTap: () {
                                        controller._isQuestion.value = false;
                                        controller._isTyping.value = true;
                                        controller._isAnswered.value = true;
                                        if (controller._questionNum.value == 2) {
                                          controller._answer.addAll(List<String>.filled(2, ""));
                                          controller._answer.insert(controller._questionNum.value, "Sedang tidak baik-baik saja");
                                          controller._isLoaded.addAll(List<bool>.filled(2, false));
                                          controller._isLoaded.insert(0, true);
                                          controller.update(["answer1", "question3tidak"]);
                                        } else {
                                          for (int i = 0; i <= controller._questionNum.value; i++) {
                                            if (i > controller._answer.length) {
                                              controller._answer.addAll(
                                                  List<String>.filled((controller._questionNum.value - controller._answer.length), ""));
                                              controller._isLoaded.addAll(
                                                  List<bool>.filled((controller._questionNum.value - controller._isLoaded.length), false));
                                            }
                                            if (i == controller._questionNum.value) {
                                              controller._answer.insert(controller._questionNum.value, "Iya");
                                              if (i == 10) {
                                                controller._isLoaded.insert(3, true);
                                                controller.update(["question3baik", "question4tidak", "question10iya", "answer10"], true);
                                              } else if (i == 12) {
                                                controller._isLoaded.insert(10, true);
                                                controller.update(["answer12", "question12iya"], true);
                                              } else if (i == 16) {
                                                controller._isLoaded.insert(11, true);
                                                controller._isLoaded.insert(12, true);
                                                controller._isLoaded.insert(13, true);
                                                controller.update(["answer16", "question17iya"], true);
                                              } else if (i == 20) {
                                                controller._isLoaded.insert(16, true);
                                                controller._isLoaded.insert(17, true);
                                                controller.update(["answer18", "question19iya"], true);
                                              } else if (i == 25) {
                                                controller._isLoaded.insert(21, true);
                                                controller.update(["answer25", "question26iya"], true);
                                              } else if (i == 39) {
                                                controller._isLoaded.insert(33, true);
                                                controller.update(["answer39", "question39iya"], true);
                                              } else if (i == 41) {
                                                controller._isLoaded.insert(39, true);
                                                controller.update(["answer41", "question42iya"], true);
                                              } else if (i == 43) {
                                                controller._isLoaded.insert(41, true);
                                                controller.update(["answer43", "question44iya"], true);
                                              } else if (i == 45) {
                                                controller._isLoaded.insert(43, true);
                                                controller.update(["answer45tidak", "question44iya", "question46"], true);
                                              } else if (i == 85) {
                                                controller._isLoaded.insert(79, true);
                                                controller.update(["answer85", "question86iya"], true);
                                              } else if (i == 86) {
                                                controller._isLoaded.insert(85, true);
                                                controller.update(["answer86", "question87iya"], true);
                                              }
                                            }
                                          }
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: (Colors.purple[300]),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(1, 1),
                                              blurRadius: 1,
                                              color: Colors.purple.shade300,
                                            ),
                                          ],
                                        ),
                                        child: Text(
                                          (controller._questionNum.value == 2) ? "Sedang tidak baik-baik saja" : "Iya",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : (typing.contains(controller._questionNum.value))
                                  ? ListTile(
                                      title: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          color: Colors.white,
                                        ),
                                        padding: EdgeInsets.only(left: 15),
                                        child: Form(
                                          key: _formKey,
                                          child: TextFormField(
                                            controller: textController,
                                            decoration: InputDecoration(
                                              hintText: "Masukkan Pesan Anda",
                                              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                            ),
                                            style: TextStyle(fontSize: 16, color: Colors.black),
                                            onChanged: (value) {},
                                            onTap: () {
                                              if (typing.contains(controller._questionNum.value)) {
                                                if (controller._questionNum.value == 35) {
                                                  controller._isLoaded[25] = true;
                                                } else if (controller._questionNum.value == 59) {
                                                  controller._isLoaded[45] = true;
                                                } else if (controller._questionNum.value == 66) {
                                                  controller._isLoaded[57] = true;
                                                } else if (controller._questionNum.value == 67) {
                                                  controller._isLoaded[63] = true;
                                                  controller._isLoaded.insert(64, false);
                                                } else if (controller._questionNum.value == 83) {
                                                  controller._isLoaded[64] = true;
                                                } else if (controller._isLoaded.length == controller._questionNum.value + 1) {
                                                  controller._isLoaded[controller._questionNum.value - 1] = true;
                                                } else {
                                                  controller._isLoaded.insert(controller._questionNum.value - 1, true);
                                                }
                                              }
                                              color = Colors.white;
                                            },
                                            onEditingComplete: () {
                                              color = Colors.transparent;
                                            },
                                            onFieldSubmitted: (value) {
                                              color = Colors.transparent;
                                            },
                                            onSaved: (value) {
                                              color = Colors.transparent;
                                            },
                                          ),
                                        ),
                                      ),
                                      trailing: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius: BorderRadius.all(Radius.circular(15)),
                                        ),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.send,
                                            size: 30.0,
                                            color: Colors.purple[400],
                                          ),
                                          onPressed: () {
                                            color = Colors.transparent;
                                            if (textController.text == "") {
                                              textController.text = "Lewati";
                                            }
                                            controller._isQuestion.value = false;
                                            controller._isAnswered.value = true;

                                            for (int i = 0; i <= controller._questionNum.value; i++) {
                                              if (i == controller._questionNum.value) {
                                                if (controller._questionNum.value == 35) {
                                                  controller._answer.insert(34, textController.text);
                                                } else if (controller._questionNum.value == 59) {
                                                  controller._answer.insert(58, textController.text);
                                                } else if (controller._questionNum.value == 66) {
                                                  controller._answer.insert(65, textController.text);
                                                } else if (controller._questionNum.value == 67) {
                                                  controller._answer.insert(66, textController.text);
                                                } else if (controller._questionNum.value == 83) {
                                                  controller._answer.insert(82, textController.text);
                                                } else {
                                                  controller._answer.insert(controller._questionNum.value, textController.text);
                                                }
                                                if (i == 3) {
                                                  controller.update(["answer3tidak", "question4tidak"]);
                                                } else if (i == 11) {
                                                  controller.update(["question10tidak", "answer11", "question12"], true);
                                                } else if (i == 13) {
                                                  controller.update(["question12iya", "answer12", "question13iya"], true);
                                                } else if (i == 17) {
                                                  controller.update(["answer17", "question18"], true);
                                                } else if (i == 21) {
                                                  controller.update(["answer19", "question20"], true);
                                                } else if (i == 35) {
                                                  controller.update(["answer35", "question36"], true);
                                                } else if (i == 40) {
                                                  controller.update(["answer40iya", "question41iya"], true);
                                                } else if (i == 42) {
                                                  controller.update(["answer42", "question43"], true);
                                                } else if (i == 44) {
                                                  controller.update(["answer44tidak", "question45tidak"], true);
                                                } else if (i == 59) {
                                                  controller.update(["answer59", "question60"], true);
                                                } else if (i == 66) {
                                                  controller.update(["answer66", "question67"], true);
                                                } else if (i == 67) {
                                                  controller.update(["answer67", "question68"], true);
                                                } else if (i == 83) {
                                                  controller.update(["answer83", "question84"], true);
                                                }
                                              } else if (i > controller._answer.length) {
                                                controller._answer.add("");
                                                controller._isLoaded.add(false);
                                              }
                                            }
                                            textController.text = "";
                                          },
                                        ),
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
  const ContainerText(this.text, this.alignment, this.color, {this.isAnswer = false});

  final String text;
  final Alignment alignment;
  final Color color;
  final bool isAnswer;

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
            style: TextStyle(fontSize: 15, color: (isAnswer) ? Colors.white : Colors.black, fontWeight: FontWeight.normal),
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
