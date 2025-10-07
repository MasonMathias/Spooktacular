import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Act9',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Act9'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final AudioPlayer _bgm;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _bgm = AudioPlayer()..setReleaseMode(ReleaseMode.loop)..setVolume(0.1);
  }

  Future<void> _startBgm() async {
    if (_started) return;
    _started = true;
    await _bgm.play(AssetSource('audio/halloweenbgm.mp3'));
  }

  Future<void> _playSfx(String asset) async {
    final p = AudioPlayer();
    p.setVolume(0.4);
    await p.play(AssetSource(asset));
    p.onPlayerComplete.first.then((_) => p.dispose());
  }

  @override
  void dispose() { _bgm.dispose(); super.dispose(); }

  Widget _tile(String path, String audiopath) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _playSfx(audiopath),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.asset(path),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            tooltip: 'Play music',
            icon: const Icon(Icons.music_note),
            onPressed: _startBgm,
          ),
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _startBgm,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    _tile('assets/images/halloweenghost.png', 'audio/goodbutton.mp3'),
                    const SizedBox(width: 12),
                    _tile('assets/images/halloweenghost2.png', 'audio/ghastscream.mp3'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Row(
                  children: [
                    _tile('assets/images/halloweenpumpkin.png', 'audio/ghastscream.mp3'),
                    const SizedBox(width: 12),
                    _tile('assets/images/halloweenpumpkin2.png', 'audio/ghastscream.mp3'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
