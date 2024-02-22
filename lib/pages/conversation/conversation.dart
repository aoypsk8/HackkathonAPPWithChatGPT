import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toturial/controllers/generate_controller.dart';
import 'package:flutter_toturial/pages/widgets/textFont.dart';
import 'package:flutter_toturial/utils/colors.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  bool loading = false;
  bool loadingSpeaker = false;
  var lessonData = "";
  bool _isInit = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();
  final GenerateController _generateController = Get.put(GenerateController());

  final List<Map<String, String>> _messages = [];
  FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    if (!_isInit) {
      setState(() {
        loading = true;
      });
      Future.microtask(() async {
        String result = await _generateController.getTextGenerate(
          "can you teach me about $lessonData",
          "User1",
        );
        setState(() {
          loading = false;
          _messages.insert(0, {'text': result, 'sender': 'User2'});
          _isInit = true; // Set to true after execution
        });
      });
    }
  }

  void _handleSubmitted(String text) async {
    if (_formKey.currentState!.validate()) {
      _textController.clear();
      setState(() {
        loading = true;
      });
      final sender = _messages.isEmpty || _messages.first['sender'] == 'User2'
          ? 'User1'
          : 'User2';
      setState(() {
        _messages.insert(0, {'text': text, 'sender': sender});
      });
      if (sender == "User1") {
        String result = await _generateController.getTextGenerate(text, sender);
        setState(() {
          loading = false;
        });
        setState(() {
          _messages.insert(0, {'text': result, 'sender': 'User2'});
        });
        await speaker(result);
      }
    }
  }

  speaker(String text) async {
    setState(() {
      loadingSpeaker = true;
    });

    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(0.8);
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.speak(text);

    setState(() {
      loadingSpeaker = false;
    });
  }

  final stt.SpeechToText _speech = stt.SpeechToText();
  void startListening() {
    _speech.listen(
      onResult: (result) {
        setState(() {
          _textController.text = result.recognizedWords;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextFont(
          text: "Chat",
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: cr_3c9,
        elevation: 5,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (_, int index) => _buildMessage(_messages[index]),
              ),
            ),
            (loading == true)
                ? Padding(
                    padding: const EdgeInsets.all(25),
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: cr_3c9,
                      size: 60,
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 0.5,
                width: double.infinity,
                decoration: const BoxDecoration(color: cr_3c9),
              ),
            ),
            Container(
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(Map<String, String> message) {
    final bool isCurrentUser = message['sender'] == 'User1';
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment:
                isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                width: 280,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isCurrentUser ? cr_3c9 : Colors.black26,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                // child: TextFont(
                //   text: message['text'] ?? '',
                //   fontSize: 15,
                //   color: isCurrentUser ? Colors.white : Colors.black,
                //   maxLines: 1000,
                // ),
                // ignore: deprecated_member_use
                child: TyperAnimatedTextKit(
                  repeatForever: false,
                  text: [message['text'] ?? ''],
                  textStyle: TextStyle(
                    fontSize: 15.0,
                    color: isCurrentUser ? Colors.white : Colors.black,
                  ),
                  speed: const Duration(milliseconds: 50),
                  onTap: () {},
                ),
              ),
            ],
          ),
          isCurrentUser
              ? Container()
              : Positioned(
                  top: 10,
                  right: 100,
                  child: InkWell(
                    onTap: () {},
                    child: (loading == true)
                        ? LoadingAnimationWidget.staggeredDotsWave(
                            color: cr_3c9,
                            size: 30,
                          )
                        : const Icon(
                            Icons.sensors_rounded,
                          ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: cr_f2f2, width: 1.5),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: cr_f63, width: 1.5),
    );

    bool isValidate = true;
    return IconTheme(
      data: const IconThemeData(color: cr_3c9),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Flexible(
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 20,
                    ),
                    border: InputBorder.none,
                    hintText: "ສົ່ງຂໍ້ຄວາມ",
                    hintStyle: GoogleFonts.notoSansLao(),
                    filled: true,
                    enabledBorder: border,
                    focusedBorder: border,

                    //! error border
                    errorStyle: GoogleFonts.notoSansLao(color: cr_f63),
                    focusedErrorBorder: errorBorder,
                    errorBorder: errorBorder,
                  ),
                  validator: isValidate
                      ? FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ])
                      // ignore: dead_code
                      : null,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.mic_sharp),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ],
        ),
      ),
    );
  }
}
