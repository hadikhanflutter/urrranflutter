import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:text_to_speech/custom_theme/Audio_to_text.dart';
import 'package:text_to_speech/custom_theme/dark_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController = TextEditingController();
  FlutterTts flutterTts = FlutterTts();

//this function get voice
  Future<void> toSpeak(String text) async {
    await initSettings();
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setLanguage("en_US");
    await flutterTts.speak(text);
  }

  // this function stop the voice
  Future<void> stop() async {
    await flutterTts.stop();
  }

  //in this function we change the sound values and speech rate here set values

  Future<void> initSettings() async {
    await flutterTts.setVolume(volume);
    await flutterTts.setPitch(pitch);
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setLanguage(langCode);

    // await flutterTts.setVoice(voiceCode);
  }

  // here initialize variables
  double volume = 1.0;
  double pitch = 1.0;
  double speechRate = 0.5;
  List<String>? languages;
  String langCode = "en-US";
  String? chooseValue;
  List listItem = ['male', 'female'];

  //here set the language

  void setLanguage() async {
    languages = List<String>.from(await flutterTts.getLanguages);

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            child: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DarkThemeScreen()));
          },
          icon: Icon(Icons.sort_rounded),
        )),
        title: Text('Text To Speech'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //In this container we covert volumes
            Container(
              margin: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text(
                      'Volume',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Slider(
                    min: 0.0,
                    max: 1.0,
                    value: volume,
                    onChanged: (value) {
                      setState(() {
                        volume = value;
                      });
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Text(
                      double.parse((volume).toStringAsFixed(2)).toString(),
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),

            //In this conatainer we check pitch
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text(
                      'Pitch',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Slider(
                      min: 0.5,
                      max: 2.0,
                      value: pitch,
                      onChanged: (value) {
                        setState(() {
                          pitch = value;
                        });
                      }),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      double.parse((pitch).toStringAsFixed(2)).toString(),
                    ),
                  )
                ],
              ),
            ),

            //in this container we convert speech rate
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text(
                      'Speech Rate',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Slider(
                      min: 0.0,
                      max: 1.0,
                      value: speechRate,
                      onChanged: (value) {
                        setState(() {
                          speechRate = value;
                        });
                      }),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                      double.parse((speechRate).toStringAsFixed(2)).toString(),
                    ),
                  )
                ],
              ),
            ),

            // In this container we check languages
            if (languages != null)
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    const Text(
                      'Languages',
                      style: TextStyle(fontSize: 17),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    DropdownButton<String>(
                      focusColor: Colors.white,
                      value: langCode,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      iconEnabledColor: Colors.black,
                      items: languages!
                          .map<DropdownMenuItem<String>>((String? value) {
                        return DropdownMenuItem<String>(
                          value: value!,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          langCode = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),

            const SizedBox(
              height: 15,
            ),

            // here we use a text field to take a dta from user
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: textController,
                decoration: InputDecoration(
                    hintText: 'Enter Text Here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            //in this row we use two buttons
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      toSpeak(textController.text);
                    });
                  },
                  child: Text('Text to speak'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    stop();
                  },
                  child: Text('Stop'),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AudioToText()));
                },
                child: Text('Audio To Text'))
          ],
        ),
      ),
    );
  }
}
