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

  String? extractVideoId(String url) {
    final RegExp regExp = RegExp(r'\/shorts\/([a-zA-Z0-9_-]+)');
    final match = regExp.firstMatch(url);

    if (match != null && match.groupCount > 0) {
      return match.group(1);
    }
    return null; // Return null if no match is found
  }

  @override
  void initState() {
    print("widget.videoID  => ");
    print(extractVideoId(widget.videoID));
    _controller = YoutubePlayerController(
      initialVideoId: extractVideoId(widget.videoID) ?? '',
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
