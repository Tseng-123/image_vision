import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Player extends StatefulWidget {
  final String url;

  const Player({Key? key, required this.url}) : super(key: key);

  @override
  PlayerState createState() => PlayerState();
}

class PlayerState extends State<Player> {
  bool _showControls = false;
  bool _isPlaying = false;
  double _progress = 0.0;
  late Duration _duration;

  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..addListener(() {
        final bool isPlaying = _controller!.value.isPlaying;
        final Duration duration = _controller!.value.duration;
        final Duration position = _controller!.value.position;
        final double progress =
            position.inMilliseconds / duration.inMilliseconds;

        setState(() {
          _isPlaying = isPlaying;
          _duration = duration;
          _progress = progress;
        });
      })
      ..initialize().then((_) {
        setState(() {
          _duration = _controller!.value.duration;
        });
        _controller!.play(); // 自动播放
      })
      ..setLooping(true); // 循环播放
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
  }

  void _togglePlayPause() {
    if (_isPlaying) {
      _controller!.pause();
    } else {
      _controller!.play();
    }
  }

  void _seek(double progress) {
    final Duration position = _duration * progress;
    _controller!.seekTo(position);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleControls,
      child: MouseRegion(
        onHover: (event) {
          _showControls = true;
          setState(() {});
        },
        onExit: (event) {
          _showControls = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              ),
            ),
            // Positioned.fill(child: VideoPlayer(_controller!)),
            if (_showControls)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                        color: Colors.white,
                        onPressed: _togglePlayPause,
                      ),
                      Slider(
                        value: _progress,
                        onChanged: _seek,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
