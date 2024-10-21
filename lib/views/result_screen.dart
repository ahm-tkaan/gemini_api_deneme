import 'package:flutter/material.dart';
import 'package:gemini_api_deneme/MovieSelectionScreen.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ResultScreen extends StatefulWidget {
  final List<String> musicList;

  const ResultScreen({
    super.key,
    required this.musicList,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String generatedText = "";
  bool isLoading = true;
  final model = GenerativeModel(
    model: "gemini-pro",
    apiKey: "     gemini api giriniz     ",
  );

  _getMovieSuggestion() async {
    final content = [
      Content.text(
          'Buradaki ${widget.musicList.join(", ")} müzikleri seviyorum. Bana bunların ortak noktalarından oluşan 5 tane müzik önerir misin? Bu müziklerin tarzına odaklanmalısın. Yanına basitçe neden önerdiğini belirt. Numaralandırarak ilet.')
    ];
    final response = await model.generateContent(content);
    setState(() {
      generatedText = response.text!;
      isLoading = false;
    });
  }

  @override
  void initState() {
    _getMovieSuggestion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading && widget.musicList.isNotEmpty
        ? const Center(child: CircularProgressIndicator())
        : widget.musicList.isNotEmpty
            ? buildResult()
            : Container();
  }

  SingleChildScrollView buildResult() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2),
                  color: Colors.greenAccent[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  "Sonuç Ekranı",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 2),
                    color: Colors.greenAccent[100],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    generatedText,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MovieSelectionScreen(),
                    ),
                  );
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.greenAccent),
                ),
                child: const Text(
                  "Başa Dön",
                  style:  TextStyle(fontSize: 20),
                ),

              ),



            ]),
      ),
    );
  }
}
