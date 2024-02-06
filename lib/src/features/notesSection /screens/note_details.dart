import 'package:daily_devotional/src/commonWidgets/custom_loader.dart';
import 'package:daily_devotional/src/features/notesSection%20/models/note_model.dart';
import 'package:daily_devotional/src/features/notesSection%20/providers/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../commonWidgets/button_widget.dart';
import '../../../constants/appcolors.dart';
import '../widgets/note_scriupture_card_widget.dart';

class NoteDetailsScreen extends StatefulWidget {
  final NoteModel noteData;
  static String route = "/NoteDetailsScreen";

  const NoteDetailsScreen({
    Key? key,
    required this.noteData,
  }) : super(key: key);

  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    intialiazeControllers();
    super.initState();
  }

  intialiazeControllers() {
    noteController =
        TextEditingController(text: widget.noteData.noteTitle ?? "");
  }

  //AppDataBase appDataBase = AppDataBase();

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(builder: (context, noteProvider, __) {
      return CustomLoader(
        isLoading: noteProvider.isLoading,
        color: AppColors.primaryColor,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
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
                      "Note Details",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 17,
                          decoration: TextDecoration.none,
                          color: AppColors.blackColor),
                    ),
                    Consumer<NotesProvider>(
                        builder: (context, notesProvider, __) {
                      return IconButton(
                          onPressed: () {
                            notesProvider
                                .deleteNote(widget.noteData.noteId.toString());
                          },
                          icon: const Icon(
                            Icons.delete,
                            size: 24,
                            color: AppColors.redColor,
                          ));
                    }),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                NoteScriptureCardWidget(
                  scriptureText: widget.noteData.scriptureText.toString(),
                ),
                const SizedBox(
                  height: 20,
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
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 14,
                                  decoration: TextDecoration.none,
                                  color: AppColors.blackColor),
                          controller: noteController,
                          decoration: InputDecoration(
                            hintText: "Enter Note",
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.only(top: 13, left: 15),
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
                      text: "Update Note",
                      horizontalPadding: 12,
                      onTap: () async {
                        notesProvider.updateNoteFireStore(
                            noteId: widget.noteData.noteId.toString(),
                            noteTitle: noteController.text,
                            scriptureText:
                                widget.noteData.scriptureText.toString());
                        // notesProvider.updateNote(NoteCompanion(
                        //     id: drift.Value(widget.noteData.id),
                        //     userId: drift.Value(widget.noteData.userId.toString()),
                        //     productTitle: drift.Value(noteController.text),
                        //     scriptureText: drift.Value(
                        //         widget.noteData.scriptureText.toString())));
                      });
                })
              ],
            ),
          ),
        ),
      );
    });
  }
}
