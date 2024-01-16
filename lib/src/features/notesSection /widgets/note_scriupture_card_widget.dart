import 'package:daily_devotional/src/features/homeSection/models/home_model.dart';
import 'package:daily_devotional/src/features/homeSection/providers/text_to_audio_provider.dart';
import 'package:daily_devotional/src/utils/route_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../constants/appcolors.dart';
import '../../../constants/image_constants.dart';
import '../../../helpers/snak_bar_widget.dart';
import '../../notesSection /screens/add_note_screen.dart';

class NoteScriptureCardWidget extends StatefulWidget {
  final String? scriptureText;

  const NoteScriptureCardWidget({Key? key, required this.scriptureText})
      : super(key: key);

  @override
  State<NoteScriptureCardWidget> createState() =>
      _NoteScriptureCardWidgetState();
}

class _NoteScriptureCardWidgetState extends State<NoteScriptureCardWidget> {
  @override
  void initState() {
    context.read<TextToAudioProvider>().configureTts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TextToAudioProvider>(
        builder: (context, textToAudioProvider, __) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Container(
              //   height: 300,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: AppColors.secondaryColor),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    Text(
                      "Scripture",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 19,
                          decoration: TextDecoration.none,
                          color: AppColors.blackColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: widget.scriptureText.toString(),
                              // "Blessed is the man Who walks not in the counsel of the ungodly, nor stands in the path of sinners, Nor sits in the seat of the scornful; But his delight is in the law of the Lord, And in His law he meditates day and night. He shall be like a tree Planted by the rivers of water, that brings forth its fruit in its season, Whose leaf also shall not wither; And whatever he does shall prosper.",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 15,
                                      decoration: TextDecoration.none,
                                      color: AppColors.blackColor)),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 80,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: AppColors.primaryLightColor.withOpacity(0.2)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(33),
                                  color: AppColors.primaryColor),
                              child: Center(
                                  child: textToAudioProvider.ttsState.name ==
                                          TtsState.playing.name
                                      ? InkWell(
                                          onTap: () {
                                            textToAudioProvider.stopSpeaking();
                                          },
                                          child: const Icon(
                                            Icons.pause,
                                            color: AppColors.whiteColorFull,
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            textToAudioProvider.speakText(widget
                                                .scriptureText
                                                .toString());
                                          },
                                          child: const Icon(
                                            Icons.play_arrow,
                                            color: AppColors.whiteColorFull,
                                          ),
                                        )
                                  //SvgPicture.asset(ImageConstants.play),
                                  ),
                            ),
                          ),
                          Expanded(
                              flex: 13,
                              child: Column(
                                children: [
                                  _progressBar(textToAudioProvider.endOffSet,
                                      widget.scriptureText.toString()),
                                  const SizedBox(
                                    height: 27,
                                  )
                                ],
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

Widget _progressBar(int end, String text) => Container(
    alignment: Alignment.topCenter,
    padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
    child: LinearProgressIndicator(
      backgroundColor: AppColors.primaryLightColor,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
      value: end / text!.length,
      borderRadius: BorderRadius.circular(9),
    ));
