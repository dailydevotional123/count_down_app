import 'package:daily_devotional/src/constants/image_constants.dart';
import 'package:daily_devotional/src/features/notesSection%20/providers/notes_provider.dart';
import 'package:daily_devotional/src/features/notesSection%20/screens/add_note_screen.dart';
import 'package:daily_devotional/src/features/notesSection%20/widgets/notes_card_widget.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../constants/appcolors.dart';
import '../../../helpers/local_database_helper/drift_helper.dart';
import '../../../utils/route_utils.dart';
import 'note_details.dart';

class NotesScreen extends StatefulWidget {
  static String route = "/NotesScreen";

  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    context.read<NotesProvider>().getListOfNotes('');
    super.initState();
  }

  String searchQuery = '';
  List<NoteData> filteredNotes = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(builder: (context, notesProvider, __) {
      return Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: AppColors.primaryColor,
        //   child: SvgPicture.asset(
        //     ImageConstants.add,
        //     color: AppColors.whiteColorFull,
        //     height: 30,
        //     width: 30,
        //   ),
        //   onPressed: () {
        //     GoRouter.of(context).push(AddNoteScreen.route);
        //   },
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                      onChanged: (value) {
                        notesProvider.getListOfNotes(value);
                        // setState(() {
                        //   searchQuery = value;
                        // });
                      },
                      decoration: InputDecoration(
                          hintText: "Search Notes",
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontSize: 15,
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
                  const SizedBox(
                    height: 10,
                  ),
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
                  // const SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //
              // Expanded(
              //   child: FutureBuilder<List<NoteData>>(
              //     // Replace with your function to get filtered notes
              //     future: notesProvider.searchNotesList(searchQuery),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return Center(child: CircularProgressIndicator());
              //       } else if (snapshot.hasError) {
              //         return Center(child: Text('Error: ${snapshot.error}'));
              //       } else {
              //         filteredNotes = snapshot.data ?? [];
              //         return ListView.builder(
              //           itemCount: filteredNotes.length,
              //           itemBuilder: (context, index) {
              //             return NotesCardWidget(
              //               noteData: notesProvider.notesList[index],
              //             );
              //           },
              //         );
              //       }
              //     },
              //   ),
              // ),
              Expanded(
                flex: 6,
                child: notesProvider.notesList.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 80),
                          child: Text(
                            "No Notes Found!",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                    color:
                                        AppColors.blackColor.withOpacity(0.6)),
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: notesProvider.notesList.length,
                        // The number of items in your list
                        padding: const EdgeInsets.only(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              GoRouter.of(context).push(NoteDetailsScreen.route,
                                  extra: {
                                    RouteConstants.noteModel:
                                        notesProvider.notesList[index]
                                  });
                            },
                            child: NotesCardWidget(
                              noteData: notesProvider.notesList[index],
                            ),
                          );
                        }),
              )
            ],
          ),
        ),
      );
    });
  }
}
