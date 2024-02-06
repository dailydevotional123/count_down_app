import 'package:flutter/material.dart';

import '../../../constants/appcolors.dart';

class AboutTheAppScreen extends StatelessWidget {
  static String route = "/AboutTheAppScreen";

  const AboutTheAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "About Countup and Countdown",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 17,
                      decoration: TextDecoration.none,
                      color: AppColors.blackColor),
                ),
                const SizedBox(
                  width: 50,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '''
                   Welcome to "Countdown and Countup," your daily companion for spiritual growth and devotion. This app is designed to guide you through a fulfilling journey of learning, action, prayer, and daily engagement with God's word.

Countup - Embrace Learning Every Day:
Each day, Countup presents a new lesson, drawing from a rich tapestry of biblical teachings, theological insights, and practical wisdom. These lessons are tailored to nurture your faith, expand your knowledge, and deepen your understanding of God's word.

Countdown - A Daily Call to Action:
Action is the heartbeat of faith. Countdown challenges you to live your beliefs through daily actionable steps. Whether it's acts of kindness, community service, or personal growth tasks, these actions are designed to bring the teachings of Christ into your everyday life.

Prayer - A Personal Conversation with God:
Our prayer feature offers a quiet space for reflection and communication with God. It includes daily prayer themes, guided prayer sessions, and reminders to keep prayer a central part of your day.

Daily Bible Reading - Connect with God's Word:
Immerse yourself in the scriptures with our daily Bible reading plan. Carefully selected passages will take you through the Bible, providing context and understanding to the day's theme.

Features:
Daily Lessons: Unique, insightful lessons each day.
•⁠  ⁠Actionable Steps: Practical tasks to live out your faith.
Prayer Interface: Guided prayers and themes.
Bible Reading Plan: Curated daily scriptures.
Progress Tracking: Monitor your spiritual growth journey.

•⁠  ⁠Community Sharing: Share your daily readings with friends and family and on social media to engage with a global community of believers.

"Countdown and Countup" is more than just an app; it's a tool to assist you in your walk with God, helping you to grow in faith and live a life that reflects His love and teachings. Join us on this daily journey of devotion, learning, and action.

                    
                      ''',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 16,
                        decoration: TextDecoration.none,
                        color: AppColors.blackLightColor),
                  ),
                ),
              ),
            ),
            // Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "© 2024 Countdown & Count-up.\nAll Rights Reserved",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 15,
                    decoration: TextDecoration.none,
                    color: AppColors.blackLightColor),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
