import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yellowclass/component/video_player.dart';

class VideoCard extends StatelessWidget {
  const VideoCard(
      {Key? key,
      required this.name,
      required this.coverPicture,
      required this.videoUrl,
      required this.isPlaying})
      : super(key: key);

  final String name;
  final String coverPicture;
  final String videoUrl;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    // print(coverPicture);
    // print(videoUrl);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        height: 240,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 6),
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(coverPicture), fit: BoxFit.cover),
              ),
              child: isPlaying
                  ? null
                  : CustomVideoPlayer(
                      url: videoUrl,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                name,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, letterSpacing: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
