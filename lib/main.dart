import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophonePage());
}

class XylophonePage extends StatelessWidget {
  const XylophonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[300],
        body: SafeArea(child: XylophoneWidget()),
        appBar: AppBar(
          title: const Text(
            'Xylophone App',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          backgroundColor: Colors.blue[800],
          centerTitle: true,
        ),
      ),
    );
  }
}

class XylophoneWidget extends StatelessWidget {
  const XylophoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:
                [
                  [1, Colors.purple],
                  [2, Colors.blue],
                  [3, Colors.blue.shade200],
                  [4, Colors.green],
                  [5, Colors.yellow],
                  [6, Colors.orange],
                  [7, Colors.red],
                ].map((list) {
                  final number = list[0] as int;
                  final color = list[1] as Color;
                  return Expanded(
                    child: XylophoneButton(
                      player: player,
                      number: number,
                      color: color,
                    ),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}

class XylophoneButton extends StatelessWidget {
  const XylophoneButton({
    super.key,
    required this.player,
    required this.number,
    required this.color,
  });

  final AudioPlayer player;
  final int number;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: FilledButton(
        onPressed: () {
          player.play(AssetSource('note$number.wav'));
        },
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(color),
          minimumSize: WidgetStateProperty.all(const Size(200, 50)),
        ),
        child: null,
      ),
    );
  }
}
