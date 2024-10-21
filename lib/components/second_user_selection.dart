import 'package:flutter/material.dart';
import 'package:gemini_api_deneme/components/textfield_component.dart';

class SecondUserSelection extends StatefulWidget {
  final Function(List arr) onSubmit;
  const SecondUserSelection({
    super.key,
    required this.onSubmit,
  });

  @override
  State<SecondUserSelection> createState() => _SecondUserSelectionState();
}

class _SecondUserSelectionState extends State<SecondUserSelection> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textController4 = TextEditingController();
    final TextEditingController textController5 = TextEditingController();
    final TextEditingController textController6 = TextEditingController();
    List<String> user2Musics = [];

    nextStep() {
      setState(() {
        user2Musics.addAll([
          textController4.text,
          textController5.text,
          textController6.text,
        ]);
      });
    }

    return Column(
      children: [
        const Text("Şarkılardan en az birini doldurunuz."),
        const SizedBox(height: 8.0),
        TextFieldComponent(
            label: '2. Kullanıcı için 1. şarkı', controller: textController4),
        const SizedBox(height: 8.0),
        TextFieldComponent(
            label: '2. Kullanıcı için 2. şarkı', controller: textController5),
        const SizedBox(height: 8.0),
        TextFieldComponent(
            label: '2. Kullanıcı için 3. şarkı', controller: textController6),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            nextStep();
            widget.onSubmit(user2Musics);
          },
          child: const Text("Müzik Öner"),
        ),
      ],
    );
  }
}