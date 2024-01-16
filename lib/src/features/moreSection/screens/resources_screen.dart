import 'package:flutter/material.dart';

import '../../../constants/appcolors.dart';

class ResourcesScreen extends StatelessWidget {
  static String route = "/ResourcesScreen";

  const ResourcesScreen({Key? key}) : super(key: key);

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
                "Resources",
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
              height: 70,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: AppColors.primaryLightColor.withOpacity(0.2)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Book Resources",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          color: AppColors.blackColor),
                    ),
                    const Icon(Icons.arrow_right)
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 70,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: AppColors.primaryLightColor.withOpacity(0.2)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Video Resources",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          color: AppColors.blackColor),
                    ),
                    const Icon(Icons.arrow_right)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
