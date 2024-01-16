import 'package:daily_devotional/src/commonWidgets/cacheNetworkImageWidget.dart';
import 'package:daily_devotional/src/constants/appcolors.dart';
import 'package:daily_devotional/src/features/homeSection/providers/home_provider.dart';
import 'package:daily_devotional/src/features/homeSection/screens/scripture_detail_screen.dart';
import 'package:daily_devotional/src/features/homeSection/widgets/count_down_widget.dart';
import 'package:daily_devotional/src/helpers/greetings_helper.dart';
import 'package:daily_devotional/src/utils/route_utils.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
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
  @override
  void initState() {
    context.read<HomeProvider>().pickScriptureOfTheDay();
    //  homeServices.pickScriptureOfTheDay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, __) {
      return Scaffold(
        body: homeProvider.isLoading || homeProvider.devotionalModel == null
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
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${getGreeting()}  David",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        fontSize: 19,
                                        decoration: TextDecoration.none,
                                        color: AppColors.blackColor),
                              ),
                              Text(
                                "Today is ${DateTime.now().format("M-d")}, Day ${CalculateDayHelper.getDayOfYear()}, in year 2024, ",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: 15,
                                        decoration: TextDecoration.none,
                                        color: AppColors.blackLightColor),
                              ),
                            ],
                          ),
                          const CacheNetworkImageWidget(
                            imgUrl: "",
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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Theme of the day",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                    color: AppColors.blackLightColor),
                          ),
                          Text(
                            homeProvider.devotionalModel!.theme.toString(),
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
                        GoRouter.of(context).push(ScriptureDetailScreen.route,
                            extra: {
                              RouteConstants.devotionModel:
                                  homeProvider.devotionalModel
                            });
                      },
                      child: ScriptureCardWidget(
                        devotionalModel: homeProvider.devotionalModel,
                      ),
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
