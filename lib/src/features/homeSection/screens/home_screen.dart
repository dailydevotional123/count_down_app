import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_devotional/src/commonWidgets/cacheNetworkImageWidget.dart';
import 'package:daily_devotional/src/constants/appcolors.dart';
import 'package:daily_devotional/src/features/authenticationSection/models/userModel.dart';
import 'package:daily_devotional/src/features/authenticationSection/services/userServices.dart';
import 'package:daily_devotional/src/features/homeSection/providers/home_provider.dart';
import 'package:daily_devotional/src/features/homeSection/screens/scripture_detail_screen.dart';
import 'package:daily_devotional/src/features/homeSection/widgets/count_down_widget.dart';
import 'package:daily_devotional/src/helpers/greetings_helper.dart';
import 'package:daily_devotional/src/utils/route_utils.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../helpers/calculate_day_helper.dart';
import '../widgets/scripture_card_widget.dart';

class HomeScreen extends StatefulWidget {
  static String route = "/HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseUserServices firebaseUserServices = FirebaseUserServices();

  @override
  void initState() {
    context.read<HomeProvider>().pickScriptureOfTheDay();
    _initFcm();
    //  homeServices.pickScriptureOfTheDay();
    super.initState();
  }

  Future<void> _initFcm() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;

    FirebaseMessaging.instance.subscribeToTopic('USERS');
    FirebaseMessaging.instance.getToken().then((token) {
      FirebaseFirestore.instance.collection('deviceTokens').doc(uid).set(
        {
          'deviceTokens': token,
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, __) {
      return Scaffold(
          body: StreamProvider.value(
              value: firebaseUserServices
                  .fetchUserRecord(FirebaseAuth.instance.currentUser!.uid),
              initialData: UserModel(),
              builder: (context, child) {
                UserModel model = context.watch<UserModel>();
                return model.userId == null
                    ? Center(
                        child: SpinKitSpinningLines(
                          color: AppColors.primaryColor,
                          size: 45,
                        ),
                      )
                    : homeProvider.isLoading ||
                            homeProvider.devotionalModel == null
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ))
                        : SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${getGreeting()}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    fontSize: 13,
                                                    decoration:
                                                        TextDecoration.none,
                                                    color:
                                                        AppColors.primaryColor),
                                          ),
                                          Text(
                                            "${model.userName}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    fontSize: 19,
                                                    decoration:
                                                        TextDecoration.none,
                                                    color:
                                                        AppColors.blackColor),
                                          ),
                                          Text(
                                            "Today is ${DateTime.now().format("M-d")}, Day ${CalculateDayHelper.getDayOfYear()}, in year 2024, ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    fontSize: 15,
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: AppColors
                                                        .blackLightColor),
                                          ),
                                        ],
                                      ),
                                      CacheNetworkImageWidget(
                                        imgUrl: model.profilePicture.toString(),
                                        radius: 45,
                                        height: 45,
                                        width: 45,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const CountDownWidget(),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Theme of the day",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontSize: 14,
                                                decoration: TextDecoration.none,
                                                color:
                                                    AppColors.blackLightColor),
                                      ),
                                      Text(
                                        homeProvider.devotionalModel!.theme
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontSize: 22,
                                                decoration: TextDecoration.none,
                                                color: AppColors.blackColor),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    GoRouter.of(context).push(
                                        ScriptureDetailScreen.route,
                                        extra: {
                                          RouteConstants.devotionModel:
                                              homeProvider.devotionalModel
                                        });
                                  },
                                  child: ScriptureCardWidget(
                                    devotionalModel:
                                        homeProvider.devotionalModel,
                                  ),
                                ),
                              ],
                            ),
                          );
              }));
    });
  }
}
