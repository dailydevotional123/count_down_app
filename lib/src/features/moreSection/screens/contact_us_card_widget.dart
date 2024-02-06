import 'package:flutter/material.dart';

import '../../../constants/appcolors.dart';

class ContactUsCardWidget extends StatelessWidget {
  // final String icon;
  final String startText;
  final String endText;
  final VoidCallback onTap;

  const ContactUsCardWidget(
      {Key? key,
      //   required this.icon,
      required this.startText,
      required this.endText,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 80,
          width: MediaQuery.sizeOf(context).width,
          child: Card(
            elevation: 4,
            color: AppColors.whiteColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.email_outlined,
                            color: AppColors.blackLightColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            startText,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                    color: AppColors.blackColor),
                          )
                        ],
                      ),
                      Text(
                        endText,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 14,
                            decoration: TextDecoration.none,
                            color: AppColors.blackLightColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
