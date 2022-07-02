import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yellowclass/data.dart';
import 'package:yellowclass/component/video_card.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final ValueNotifier<bool> isScrolling = ValueNotifier<bool>(false);
  final ValueNotifier<double> scrollOffset = ValueNotifier<double>(0);
  final ScrollController scroller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(Icons.play_arrow_rounded),
        ),
        leadingWidth: 15,
        backgroundColor: Colors.black54,
        title: Text("Autoplay Youtube",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500, letterSpacing: 1)),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollStartNotification) {
            isScrolling.value = true;
          }
          if (scrollNotification is ScrollUpdateNotification) {
            scrollOffset.value = scroller.offset;
          }
          if (scrollNotification is ScrollEndNotification) {
            isScrolling.value = false;
          }
          return true;
        },
        child: ListView.builder(
            controller: scroller,
            itemBuilder: (context, i) {
              int index = i % data.length;
              return ValueListenableBuilder<bool>(
                valueListenable: isScrolling,
                builder: (context, isScrolling, _) {
                  return ValueListenableBuilder<double>(
                      valueListenable: scrollOffset,
                      builder: (context, scrollOffset, _) {
                        bool play = false;
                        if (scrollOffset == 0 && i == 0) {
                          play = true;
                        } else if (scrollOffset == 0 && i == 1) {
                          play = false;
                        } else {
                          if (i == scrollOffset ~/ 240 + 1) {
                            play = true;
                          } else {
                            play = false;
                          }
                        }
                        return VideoCard(
                          name: data[index]['title'],
                          coverPicture: data[index]['coverPicture'],
                          videoUrl: data[index]['videoUrl'],
                          isPlaying: isScrolling || !play,
                        );
                      });
                },
              );
            }),
      ),
    );
  }
}
