import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StresBot extends StatefulWidget {
  const StresBot({Key? key}) : super(key: key);

  @override
  _StresBotState createState() => _StresBotState();
}

class _StresBotState extends State<StresBot> {
  List<ChatMessage> messages = [
    ChatMessage(
        messageContent: "Hai, selamat datang pada sesi menyikapi stres ",
        messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Stres merupakan perasaan tidak mampu dalam mengatasi tuntutan-tuntutan dari lingkungan sekitar",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Hampir setiap orang pernah merasakannya",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Apakah kamu pernah merasakannya juga?",
        messageType: "break"),
    ChatMessage(messageContent: "Contohnya?", messageType: "sender"),
    ChatMessage(messageContent: "Iya", messageType: "sender"),
    ChatMessage(
        messageContent:
            "Contohnya adalah ketika kamu merasa benar-benar tidak mampu atau kesulitan mengerjakan soal matematika di sekolah. Hingga tidak jarang menghasilkan nilai matematika yang jelek. Padahal, guru dan orang tua mu selalu menuntut mu untuk memiliki nilai yang bagus.",
        messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Apakah kamu pernah atau baru saja mengalami hal serupa?",
        messageType: "break"),
    ChatMessage(messageContent: "Tidak", messageType: "sender"),
    ChatMessage(messageContent: "Iya", messageType: "sender"),
    ChatMessage(
        messageContent: "Wahh selamat, kamu belum pernah merasakan stres",
        messageType: "receiver"),
  ];

  List<ChatMessage> contohnyaiya = [
    ChatMessage(
        messageContent: "Hai, selamat datang pada sesi menyikapi stres ",
        messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Stres merupakan perasaan tidak mampu dalam mengatasi tuntutan-tuntutan dari lingkungan sekitar",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Hampir setiap orang pernah merasakannya",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Apakah kamu pernah merasakannya juga?",
        messageType: "break"),
    ChatMessage(messageContent: "Contohnya?", messageType: "sender"),
    ChatMessage(messageContent: "Iya", messageType: "sender"),
    ChatMessage(
        messageContent:
            "Contohnya adalah ketika kamu merasa benar-benar tidak mampu atau kesulitan mengerjakan soal matematika di sekolah. Hingga tidak jarang menghasilkan nilai matematika yang jelek. Padahal, guru dan orang tua mu selalu menuntut mu untuk memiliki nilai yang bagus.",
        messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Apakah kamu pernah atau baru saja mengalami hal serupa?",
        messageType: "break"),
    ChatMessage(messageContent: "Tidak", messageType: "sender"),
    ChatMessage(messageContent: "Iya", messageType: "sender"),
    ChatMessage(
        messageContent:
            "Terkadang, apa yang kita harapkan, tidak sesuai dengan kenyataan",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Atau beban yang kita terima, terasa sangat berat",
        messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Tekanan dari lingkungan atau orang-orang di lingkungan sekitar, membuat kita merasa tidak mampu dalam menghadapi hal tersebut",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Apakah kamu ingin bercerita tentang perasaan mu?",
        messageType: "break"),
    ChatMessage(messageContent: "Tidak", messageType: "sender"),
    ChatMessage(messageContent: "Iya", messageType: "sender"),
  ];

  List<ChatMessage> iya1 = [
    ChatMessage(
        messageContent: "Hai, selamat datang pada sesi menyikapi stres ",
        messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Stres merupakan perasaan tidak mampu dalam mengatasi tuntutan-tuntutan dari lingkungan sekitar",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Hampir setiap orang pernah merasakannya",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Apakah kamu pernah merasakannya juga?",
        messageType: "break"),
    ChatMessage(messageContent: "Contohnya?", messageType: "sender"),
    ChatMessage(messageContent: "Iya", messageType: "sender"),
    ChatMessage(
        messageContent:
            "Terkadang, apa yang kita harapkan, tidak sesuai dengan kenyataan",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Atau beban yang kita terima, terasa sangat berat",
        messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Tekanan dari lingkungan atau orang-orang di lingkungan sekitar, membuat kita merasa tidak mampu dalam menghadapi hal tersebut",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Apakah kamu ingin bercerita tentang perasaan mu?",
        messageType: "break"),
    ChatMessage(messageContent: "Tidak", messageType: "sender"),
    ChatMessage(messageContent: "Iya", messageType: "sender"),
  ];

  List<ChatMessage> iya2 = [
    ChatMessage(
        messageContent: "Hai, selamat datang pada sesi menyikapi stres ",
        messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Stres merupakan perasaan tidak mampu dalam mengatasi tuntutan-tuntutan dari lingkungan sekitar",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Hampir setiap orang pernah merasakannya",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Apakah kamu pernah merasakannya juga?",
        messageType: "break"),
    ChatMessage(messageContent: "Contohnya?", messageType: "sender"),
    ChatMessage(messageContent: "Iya", messageType: "sender"),
    ChatMessage(
        messageContent:
            "Terkadang, apa yang kita harapkan, tidak sesuai dengan kenyataan",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Atau beban yang kita terima, terasa sangat berat",
        messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Tekanan dari lingkungan atau orang-orang di lingkungan sekitar, membuat kita merasa tidak mampu dalam menghadapi hal tersebut",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Apakah kamu ingin bercerita tentang perasaan mu?",
        messageType: "break"),
    ChatMessage(messageContent: "Tidak", messageType: "sender"),
    ChatMessage(messageContent: "Iya", messageType: "sender"),
    ChatMessage(
        messageContent: "Ceritakanlah, aku akan selalu, mendengarkanmu",
        messageType: "ngetik"),
    ChatMessage(messageContent: "Cerita", messageType: "hasil"),
    ChatMessage(
        messageContent: "Aku mengerti apa yang kamu rasakan",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Pasti sangat tidak nyaman", messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Tapi ingatlah, bahwa Allah tidak akan pernah membebani hamba-Nya melebihi kapasitas yang dimilikinya",
        messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Seperti yang tertulis dalam surat  Al-Baqarah ayat 286 yang artinya",
        messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Allah tidak membebani seseorang melainkan sesuai dengan kesanggupannya. Dia mendapat (pahala) dari (kebajikan) yang dikerjakannya dan dia mendapat (siksa) dari (kejahatan) yang diperbuatnya. (Mereka berdoa), “Ya Tuhan kami, janganlah Engkau hukum kami jika kami lupa atau kami melakukan kesalahan. Ya Tuhan kami, janganlah Engkau bebani kami dengan beban yang berat sebagaimana Engkau bebankan kepada orang-orang sebelum kami. Ya Tuhan kami, janganlah Engkau pikulkan kepada kami apa yang tidak sanggup kami memikulnya. Maafkanlah kami, ampunilah kami, dan rahmatilah kami. Engkaulah pelindung kami, maka tolonglah kami menghadapi orang-orang kafir.",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Mungkin kamu merasa tidak mampu",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Ya, aku sangat memahami hal itu",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Tapi ku mohon bertahanlah", messageType: "receiver"),
    ChatMessage(messageContent: "Ini tidak akan lama", messageType: "receiver"),
    ChatMessage(messageContent: "Ini hanya sementara", messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Kamu hanya mendapati saat-saat malam dalam kehidupanmu",
        messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Bertahanlah, dan jadilah kuat hingga matahari kebahagiaan terbit kembali dalam hidupmu",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Boleh kah aku mendampingimu untuk terus bertahan?",
        messageType: "break"),
  ];

  int i = 0;
  int duration = 2;
  bool yes = false;
  ScrollController _scrollController = new ScrollController();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      if (messages[i].messageType == "break") {
        if (yes) {
          // setState(() {
          //   duration = 2;
          //   i++;
          //   yes = false;
          // });
          duration = 2;
          i++;
          yes = false;
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        }
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      } else if (messages[i].messageType == "ngetik") {
        if (yes) {
          // setState(() {
          //   duration = 2;
          //   i++;
          //   yes = false;
          // });
          duration = 2;
          i++;
          yes = false;
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        }
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      } else {
        // setState(() {
        //   duration = 2;
        //   i++;
        // });
        duration = 2;
        i++;
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 85,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: i + 1,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                itemBuilder: (context, index) {
                  return (messages[index].messageType == "sender")
                      ? SizedBox()
                      : FutureBuilder(
                          future: Future.delayed(Duration(seconds: 2)),
                          builder: (_, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Container(
                                padding: EdgeInsets.only(
                                    left: 14, right: 14, top: 10, bottom: 10),
                                child: Align(
                                  alignment: (messages[index].messageType ==
                                              "receiver" ||
                                          messages[index].messageType ==
                                              "break" ||
                                          messages[index].messageType ==
                                              "ngetik"
                                      ? Alignment.topLeft
                                      : Alignment.topRight),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: (messages[index].messageType ==
                                                  "receiver" ||
                                              messages[index].messageType ==
                                                  "break" ||
                                              messages[index].messageType ==
                                                  "ngetik"
                                          ? Colors.grey.shade200
                                          : Colors.purple[100]),
                                    ),
                                    padding: EdgeInsets.all(16),
                                    child: Text(
                                      messages[index].messageContent,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                padding: EdgeInsets.only(
                                    left: 14, right: 14, top: 10, bottom: 10),
                                child: Align(
                                  alignment: (messages[index].messageType ==
                                              "receiver" ||
                                          messages[index].messageType ==
                                              "break" ||
                                          messages[index].messageType ==
                                              "ngetik"
                                      ? Alignment.topLeft
                                      : Alignment.topRight),
                                  child: Container(
                                      width: 75,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: (messages[index].messageType ==
                                                    "receiver" ||
                                                messages[index].messageType ==
                                                    "break" ||
                                                messages[index].messageType ==
                                                    "ngetik"
                                            ? Colors.grey.shade200
                                            : Colors.purple[100]),
                                      ),
                                      padding: EdgeInsets.all(16),
                                      child: SpinKitThreeBounce(
                                        color: Colors.purple,
                                        size: 20,
                                      )),
                                ),
                              );
                            }
                          });
                },
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.white,
                  child: (messages[i].messageType == "break")
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  duration = 2;
                                  yes = true;
                                  messages[i + 1].messageType = "send";
                                });
                                _scrollController.jumpTo(
                                    _scrollController.position.maxScrollExtent);
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 14, right: 14, top: 10, bottom: 10),
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: (Colors.purple[100]),
                                ),
                                child: Text((i == 3) ? "Contohnya?" : "Tidak"),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 14, right: 14, top: 10, bottom: 10),
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // color: (Colors.purple[100]),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    color: Colors.purple.shade100,
                                  ),
                                ],
                              ),
                              child: InkWell(
                                splashColor: Colors.grey,
                                onTap: () {
                                  setState(() {
                                    duration = 2;
                                    yes = true;
                                    if (i == 3) {
                                      messages = iya1;
                                      messages[i + 2].messageType = "send";
                                    } else if (i == 7) {
                                      messages = contohnyaiya;
                                      messages[4].messageType = "send";
                                      messages[9].messageType = "send";
                                      messages[15].messageType = "send";
                                    } else if (i == 9) {
                                      messages = iya2;
                                      messages[5].messageType = "send";
                                      messages[11].messageType = "send";
                                    }
                                  });
                                  _scrollController.jumpTo(_scrollController
                                      .position.maxScrollExtent);
                                },
                                child: Text("Iya"),
                              ),
                            )
                          ],
                        )
                      : (messages[i].messageType == "ngetik")
                          ? ListTile(
                              title: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Color.fromRGBO(220, 220, 220, 1),
                                ),
                                padding: EdgeInsets.only(left: 15),
                                child: TextFormField(
                                  controller: controller,
                                  decoration: InputDecoration(
                                    hintText: "Masukkan Pesan Anda",
                                    hintStyle: TextStyle(color: Colors.black26),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                  onChanged: (value) {},
                                ),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.send,
                                  size: 30.0,
                                  color: Colors.purple,
                                ),
                                onPressed: () {
                                  setState(() {
                                    duration = 2;
                                    yes = true;
                                    messages[i + 1].messageContent =
                                        controller.text;
                                    messages[i + 1].messageType = "send";
                                  });
                                  _scrollController.jumpTo(_scrollController
                                      .position.maxScrollExtent);
                                },
                              ),
                            )
                          : SizedBox(),
                )),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}
