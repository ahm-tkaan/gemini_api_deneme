import 'package:flutter/material.dart';
import 'package:gemini_api_deneme/components/first_user_selection.dart';
import 'package:gemini_api_deneme/components/second_user_selection.dart';
import 'package:gemini_api_deneme/views/result_screen.dart';

class MovieSelectionScreen extends StatefulWidget {
  const MovieSelectionScreen({Key? key}) : super(key: key);

  @override
  _MovieSelectionScreenState createState() => _MovieSelectionScreenState();
}

class _MovieSelectionScreenState extends State<MovieSelectionScreen> {
  List<String> musicList = [];
  int _currentStep = 0;

  bool isLoading = false;
  late List<Widget> myWidgets;

  changeStep() {
    setState(() {
      _currentStep++;
    });
  }

  onSubmit(val) {
    setState(() {
      musicList = [...musicList, ...val];
    });
    if (_currentStep < 2) {
      changeStep();
    }
  }

  fillMyWidgets() {
    myWidgets = [
      FirstUserMovieSelection(
        onSubmit: onSubmit,
      ),
      SecondUserSelection(
        onSubmit: onSubmit,
      ),
      ResultScreen(
        musicList: musicList,
      )
    ];
    setState(() {});
  }

  @override
  void initState() {
    fillMyWidgets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _currentStep = 0;
                musicList = [];
              });
            },
            icon: const Icon(Icons.replay),
          )
        ],
        iconTheme: IconThemeData(color: Colors.pink),
        title:  Text("Müzik Öneri Uygulaması",),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,


      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              myWidgets[_currentStep],
              if (_currentStep == 2)
                ResultScreen(
                  musicList: musicList,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
