import 'package:daily_devotional/src/constants/image_constants.dart';
import 'package:daily_devotional/src/features/notesSection%20/providers/notes_provider.dart';
import 'package:daily_devotional/src/features/notesSection%20/services/notes_services.dart';
import 'package:daily_devotional/src/features/notesSection%20/widgets/notes_card_widget.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../constants/appcolors.dart';
import '../../../utils/route_utils.dart';
import '../models/note_model.dart';
import 'note_details.dart';

class NotesScreen extends StatefulWidget {
  static String route = "/NotesScreen";

  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  NotesServices notesServices = NotesServices();

  @override
  void initState() {
    //  context.read<NotesProvider>().getListOfNotes('');
    super.initState();
  }

  List<NoteModel> searchedContact = [];

  bool isSearched = false;
  List<NoteModel> contactListDB = [];

  void _searchedContacts(String val) async {
    print(contactListDB.length);
    searchedContact.clear();
    for (var i in contactListDB) {
      var lowerCaseString = i.noteTitle.toString().toLowerCase() +
          " " +
          i.noteTitle.toString().toLowerCase() +
          i.noteTitle.toString();

      var defaultCase = i.noteTitle.toString() +
          " " +
          i.noteTitle.toString() +
          i.noteTitle.toString();

      if (lowerCaseString.contains(val) || defaultCase.contains(val)) {
        searchedContact.add(i);
      } else {
        setState(() {
          isSearched = true;
        });
      }
    }
    setState(() {});
  }

  // String searchQuery = "";
  //
  // List<NoteData> filteredNotes = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(builder: (context, notesProvider, __) {
      return Scaffold(
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
                        _searchedContacts(value);
                        setState(() {});
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
              // Expanded(
              //   flex: 6,
              //   child: notesProvider.notesList.isEmpty
              //       ? Center(
              //           child: Padding(
              //             padding: const EdgeInsets.only(bottom: 80),
              //             child: Text(
              //               "No Notes Found!",
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .titleLarge!
              //                   .copyWith(
              //                       fontSize: 14,
              //                       decoration: TextDecoration.none,
              //                       color:
              //                           AppColors.blackColor.withOpacity(0.6)),
              //             ),
              //           ),
              //         )
              //       :

              // StreamProvider.value(
              //     value: notesServices.streamNotesList(),
              //     initialData: [NoteModel()],
              //     builder: (context, child) {
              //       List<NoteModel> notesList =
              //           context.watch<List<NoteModel>>();
              //       return notesList.isEmpty
              //           ? Center(
              //               child: Padding(
              //               padding: EdgeInsets.only(top: 220),
              //               child: Text("No Notes Found!Add Notes",
              //                   style: TextStyle(
              //                       // fontFamily: 'Gilroy',
              //                       color: AppColors.blackColor,
              //                       // decoration: TextDecoration.underline,
              //                       fontWeight: FontWeight.w700,
              //                       fontFamily: 'Axiforma',
              //                       fontSize: 13)),
              //             ))
              //           : notesList[0].noteId == null
              //               ? SpinKitSpinningLines(
              //                   size: 40,
              //                   color: AppColors.primaryColor,
              //                 )
              //               : searchedContact.isEmpty
              //                   ? isSearched == true
              //                       ? Center(
              //                           child: Text("No Data Found!",
              //                               style: TextStyle(
              //                                   color: Colors.black,
              //                                   fontWeight: FontWeight.w600,
              //                                   fontSize: 13)),
              //                         )
              //                       : Expanded(
              //                           child: ListView.builder(
              //                               itemCount: notesList.length,
              //                               // The number of items in your list
              //                               padding: const EdgeInsets.only(),
              //                               shrinkWrap: true,
              //                               itemBuilder: (BuildContext context,
              //                                   int index) {
              //                                 return InkWell(
              //                                   onTap: () {
              //                                     GoRouter.of(context).push(
              //                                         NoteDetailsScreen.route,
              //                                         extra: {
              //                                           RouteConstants
              //                                                   .noteModel:
              //                                               notesList[index]
              //                                         });
              //                                   },
              //                                   child: NotesCardWidget(
              //                                     noteData: notesList[index],
              //                                   ),
              //                                 );
              //                               }),
              //                         )
              //                   : Expanded(
              //                       child: ListView.builder(
              //                           itemCount: searchedContact.length,
              //                           // The number of items in your list
              //                           padding: const EdgeInsets.only(),
              //                           shrinkWrap: true,
              //                           itemBuilder:
              //                               (BuildContext context, int index) {
              //                             return InkWell(
              //                               onTap: () {
              //                                 GoRouter.of(context).push(
              //                                     NoteDetailsScreen.route,
              //                                     extra: {
              //                                       RouteConstants.noteModel:
              //                                           searchedContact[index]
              //                                     });
              //                               },
              //                               child: NotesCardWidget(
              //                                 noteData: searchedContact[index],
              //                               ),
              //                             );
              //                           }),
              //                     );
              //     })

              StreamProvider.value(
                  value: notesServices.streamNotesList(),
                  initialData: [NoteModel()],
                  builder: (context, child) {
                    contactListDB = context.watch<List<NoteModel>>();
                    List<NoteModel> list = context.watch<List<NoteModel>>();
                    return list.isEmpty
                        ? Center(
                            child: Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: Text("No Notes Found!",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13)),
                          ))
                        : list[0].userId == null
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 50.0),
                                  child: SpinKitPulse(
                                    color: Colors.blue,
                                  ),
                                ),
                              )
                            : list.isEmpty
                                ? Center(
                                    child: Text("No Notes Found!",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13)),
                                  )
                                : searchedContact.isEmpty
                                    ? isSearched == true
                                        ? Center(
                                            child: Text("No Notes Found!",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13)),
                                          )
                                        : Container(
                                            // height: 550,
                                            // width: MediaQuery.of(context).size.width,

                                            child: Expanded(
                                            child: ListView.builder(
                                                itemCount: contactListDB.length,
                                                shrinkWrap: true,
                                                padding: EdgeInsets.only(),
                                                itemBuilder: (context, i) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8),
                                                    child: InkWell(
                                                      onTap: () {
                                                        GoRouter.of(context)
                                                            .push(
                                                                NoteDetailsScreen
                                                                    .route,
                                                                extra: {
                                                              RouteConstants
                                                                      .noteModel:
                                                                  contactListDB[
                                                                      i]
                                                            });
                                                      },
                                                      child: NotesCardWidget(
                                                        noteData: list[i],
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ))
                                    : Container(
                                        child: Expanded(
                                        child: ListView.builder(
                                            itemCount: searchedContact.length,
                                            shrinkWrap: true,
                                            padding: EdgeInsets.only(),
                                            itemBuilder: (context, i) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8),
                                                child: InkWell(
                                                  onTap: () {
                                                    GoRouter.of(context).push(
                                                        NoteDetailsScreen.route,
                                                        extra: {
                                                          RouteConstants
                                                                  .noteModel:
                                                              searchedContact[i]
                                                        });
                                                  },
                                                  child: NotesCardWidget(
                                                    noteData:
                                                        searchedContact[i],
                                                  ),
                                                ),
                                              );
                                            }),
                                      ));
                  })
            ],
          ),
        ),
      );
    });
  }
}
