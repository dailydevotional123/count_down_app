import 'package:flutter/material.dart';

import '../../../constants/appcolors.dart';
import '../../../helpers/local_database_helper/drift_helper.dart';

class NotesCardWidget extends StatelessWidget {
  final NoteData noteData;

  const NotesCardWidget({Key? key, required this.noteData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: 70,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: AppColors.blackLightColor.withOpacity(0.2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: noteData.productTitle.toString(),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 15,
                            decoration: TextDecoration.none,
                            color: AppColors.blackColor)),
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
