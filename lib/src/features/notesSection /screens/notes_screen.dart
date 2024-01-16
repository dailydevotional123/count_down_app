import 'package:daily_devotional/src/constants/image_constants.dart';
import 'package:daily_devotional/src/features/notesSection%20/notes_provider.dart';
import 'package:daily_devotional/src/features/notesSection%20/screens/add_note_screen.dart';
import 'package:daily_devotional/src/features/notesSection%20/widgets/notes_card_widget.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../constants/appcolors.dart';

class NotesScreen extends StatefulWidget {
  static String route = "/NotesScreen";

  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    context.read<NotesProvider>().getListOfNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(builder: (context, notesProvider, __) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          child: SvgPicture.asset(
            ImageConstants.add,
            color: AppColors.whiteColorFull,
            height: 30,
            width: 30,
          ),
          onPressed: () {
            GoRouter.of(context).push(AddNoteScreen.route);
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [SvgPicture.asset(ImageConstants.threedots)],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SizedBox(
                  height: 70,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Search Notes",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                                fontSize: 17,
                                decoration: TextDecoration.none,
                                color: AppColors.blackLightColor),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            ImageConstants.search,
                            height: 25,
                            width: 25,
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(
                            top: 10, left: 15, bottom: 10),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: AppColors.blackLightColor),
                            borderRadius: BorderRadius.circular(9))),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Notes",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 19,
                        decoration: TextDecoration.none,
                        color: AppColors.blackColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    DateTime.now().format("d-M-Y"),
                    // "15 May 2024",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 13,
                        decoration: TextDecoration.none,
                        color: AppColors.blackColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      itemCount: notesProvider.notesList.length,
                      // The number of items in your list
                      padding: const EdgeInsets.only(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return NotesCardWidget(
                          noteData: notesProvider.notesList[index],
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}