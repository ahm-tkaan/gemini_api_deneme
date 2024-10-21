import 'package:flutter/material.dart';
import 'package:gemini_api_deneme/components/textfield_component.dart';

class FirstUserMovieSelection extends StatefulWidget {
  final Function(List arr) onSubmit;

  const FirstUserMovieSelection({
    super.key,
    required this.onSubmit,
  });

  @override
  State<FirstUserMovieSelection> createState() =>
      _FirstUserMovieSelectionState();
}

class _FirstUserMovieSelectionState extends State<FirstUserMovieSelection> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textController1 = TextEditingController();
    final TextEditingController textController2 = TextEditingController();
    final TextEditingController textController3 = TextEditingController();
    List<String> user1Musics = [];

    nextStep() {
      setState(() {
        user1Musics.addAll([
          textController1.text,
          textController2.text,
          textController3.text,
        ]);
      });
    }

    return Column(
      children: [
        const SizedBox(height: 50.0),
        const Text("Şarkılardan en az birini doldurunuz.", style:TextStyle(fontSize: 20),),
        const SizedBox(height: 50.0),
        TextFieldComponent(
            label: '1. Kullanıcı için 1. şarkı', controller: textController1),
        const SizedBox(height: 8.0),
        TextFieldComponent(
            label: '1. Kullanıcı için 2. şarkı', controller: textController2),
        const SizedBox(height: 8.0),
        TextFieldComponent(
            label: '1. Kullanıcı için 3. şarkı', controller: textController3),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            nextStep();
            widget.onSubmit(user1Musics);
          },
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.greenAccent),
          ),
          child: const Text("İleri",style: TextStyle(fontSize: 25),),
        ),
      ],
    );
  }
}