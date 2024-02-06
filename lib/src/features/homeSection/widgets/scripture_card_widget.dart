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

class ScriptureCardWidget extends StatefulWidget {
  final DevotionalModel? devotionalModel;

  const ScriptureCardWidget({Key? key, required this.devotionalModel})
      : super(key: key);

  @override
  State<ScriptureCardWidget> createState() => _ScriptureCardWidgetState();
}

class _ScriptureCardWidgetState extends State<ScriptureCardWidget> {
  @override
  void initState() {
    context.read<TextToAudioProvider>().configureTts();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                              text:
                                  widget.devotionalModel!.scripture.toString(),
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
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Prayer",
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
                              text: widget.devotionalModel!.prayer.toString(),
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
                      height: 20,
                    ),
                    Text(
                      "Action",
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
                              text: widget.devotionalModel!.action.toString(),
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
                    // const SizedBox(
                    //   height: 7,
                    // ),
                    // Text(
                    //   "(Psalms 1:1-3 NKJV)",
                    //   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    //       fontSize: 14,
                    //       decoration: TextDecoration.none,
                    //       color: AppColors.blackColor),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            GoRouter.of(context)
                                .push(AddNoteScreen.route, extra: {
                              RouteConstants.scriptureText:
                                  widget.devotionalModel!.scripture.toString()
                            });
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(ImageConstants.add),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Add Note",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: 12,
                                        decoration: TextDecoration.none,
                                        color: AppColors.blackColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                              text: widget.devotionalModel!.scripture
                                      .toString() +
                                  "\n\n\n" +
                                  "Prayer" +
                                  "\n\n\n" +
                                  widget.devotionalModel!.prayer.toString() +
                                  "\n\n\n" +
                                  "Action" +
                                  "\n\n\n" +
                                  widget.devotionalModel!.action.toString(),
                            )).whenComplete(() {
                              showSuccessSnackBarMessage(
                                  message: "Text copied to clipboard");
                            });
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(ImageConstants.copy),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Copy",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: 12,
                                        decoration: TextDecoration.none,
                                        color: AppColors.blackColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Share.share(
                              widget.devotionalModel!.scripture.toString() +
                                  "\n\n\n" +
                                  "Prayer" +
                                  "\n\n\n" +
                                  widget.devotionalModel!.prayer.toString() +
                                  "\n\n\n" +
                                  "Action" +
                                  "\n\n\n" +
                                  widget.devotionalModel!.action.toString(),
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(ImageConstants.share),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Share",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: 12,
                                        decoration: TextDecoration.none,
                                        color: AppColors.blackColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
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
                                                    .devotionalModel!.scripture
                                                    .toString() +
                                                "Prayer" +
                                                widget.devotionalModel!.prayer
                                                    .toString() +
                                                "Action" +
                                                widget.devotionalModel!.action
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
                                  _progressBar(
                                      textToAudioProvider.endOffSet,
                                      widget.devotionalModel!.scripture
                                          .toString()),
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
