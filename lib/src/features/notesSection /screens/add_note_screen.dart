import 'package:daily_devotional/src/features/notesSection%20/providers/notes_provider.dart';
import 'package:daily_devotional/src/helpers/local_database_helper/drift_helper.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../commonServices/hive_local_storage.dart';
import '../../../commonWidgets/button_widget.dart';
import '../../../constants/appcolors.dart';
import '../../../constants/hive_constants.dart';

class AddNoteScreen extends StatefulWidget {
  final String scriptureText;
  static String route = "/AddNoteScreen";

  const AddNoteScreen({Key? key, required this.scriptureText})
      : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController noteController = TextEditingController();

  //AppDataBase appDataBase = AppDataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                  )),
              Text(
                "Add Note",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 17,
                    decoration: TextDecoration.none,
                    color: AppColors.blackColor),
              ),
              const SizedBox(
                width: 70,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
                height: 160,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: AppColors.blackLightColor.withOpacity(0.1)),
                child: TextFormField(
                    maxLines: 7,
                    maxLength: 300,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        color: AppColors.blackColor),
                    controller: noteController,
                    decoration: InputDecoration(
                      hintText: "Enter Note",
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(top: 13, left: 15),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(
                              fontSize: 14,
                              decoration: TextDecoration.none,
                              color: AppColors.blackLightColor),
                    ))),
          ),
          const SizedBox(
            height: 40,
          ),
          Consumer<NotesProvider>(builder: (context, notesProvider, __) {
            return CommonButtonWidget(
                text: "Save Note",
                horizontalPadding: 12,
                onTap: () async {
                  String currentUserId =
                      await HiveLocalStorage.readHiveValue<String>(
                            boxName: HiveConstants.userIdBox,
                            key: HiveConstants.userIdKey,
                          ) ??
                          '';
                  notesProvider.addNote(NoteCompanion(
                      userId: drift.Value(currentUserId),
                      // userId: drift.Value(
                      //     int.parse("AcnJAgVLQffb9ANIfvNnQDj2v0x2")),
                      productTitle: drift.Value(noteController.text),
                      scriptureText:
                          drift.Value(widget.scriptureText.toString())));
                });
          })
        ],
      ),
    );
  }
}
