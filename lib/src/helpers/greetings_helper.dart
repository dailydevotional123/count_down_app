String getGreeting() {
  final now = DateTime.now();
  final currentTime = now.hour;

  if (currentTime >= 4 && currentTime < 12) {
    return 'Good Morning';
  } else if (currentTime >= 12 && currentTime < 17) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}
