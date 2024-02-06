import 'package:daily_devotional/src/features/prayersSection/models/prayer_model.dart';
import 'package:daily_devotional/src/features/prayersSection/screens/add_prayer_screen.dart';
import 'package:daily_devotional/src/features/prayersSection/services/prayer_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../constants/appcolors.dart';
import '../widgets/prayer_card_widget.dart';

class PrayersScreen extends StatefulWidget {
  static String route = "/PrayersScreen";

  const PrayersScreen({Key? key}) : super(key: key);

  @override
  State<PrayersScreen> createState() => _PrayersScreenState();
}

class _PrayersScreenState extends State<PrayersScreen> {
  PrayerServices prayerServices = PrayerServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        onPressed: () {
          GoRouter.of(context).push(
            AddPrayerScreen.route,
          );
        },
        child: Center(
          child: Icon(Icons.add),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Prayers",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 19,
                    decoration: TextDecoration.none,
                    color: AppColors.blackColor),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          StreamProvider.value(
              value: prayerServices.streamPrayerList(),
              initialData: [PrayerModel()],
              builder: (context, child) {
                List<PrayerModel> prayersList =
                    context.watch<List<PrayerModel>>();
                return prayersList.isEmpty
                    ? Center(
                        child: Padding(
                        padding: EdgeInsets.only(top: 220),
                        child: Text("No Prayers Found! Add Prayer",
                            style: TextStyle(
                                // fontFamily: 'Gilroy',
                                color: AppColors.blackColor,
                                // decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Axiforma',
                                fontSize: 13)),
                      ))
                    : prayersList[0].prayerId == null
                        ? const SpinKitSpinningLines(
                            size: 30,
                            color: AppColors.primaryColor,
                          )
                        : Expanded(
                            child: ListView.builder(
                                itemCount: prayersList.length,
                                shrinkWrap: true,
                                padding: EdgeInsets.only(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 4),
                                      child: PrayerListCardWidget(
                                        prayerModel: prayersList[index],
                                        index: index,
                                      ));
                                }));
              })
        ],
      ),
    );
  }
}
