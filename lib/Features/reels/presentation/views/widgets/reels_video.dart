import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ReelsVideoWidget extends StatefulWidget {
  const ReelsVideoWidget({
    super.key,
    required this.videoID,
  });

  final String videoID;

  @override
  State<ReelsVideoWidget> createState() => _ReelsVideoWidgetState();
}

class _ReelsVideoWidgetState extends State<ReelsVideoWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    print("widget.videoID  => ");
    print(widget.videoID);
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoID,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        showLiveFullscreenButton: false,
        mute: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        onReady: () {
          print('Player is ready.++++++++++++++++');
        },
      ),
      builder: (context, player) {
        return Container(
          width: 30,
          height: MediaQuery.of(context).size.height,
          child: player,
        );
      },
    );
  }
}
