class CalculateDayHelper {
  static int getDayOfYear() {
    DateTime now = DateTime.now();
    DateTime firstDayOfYear = DateTime(now.year, 1, 1);
    Duration difference = now.difference(firstDayOfYear);
    return difference.inDays + 1;
  }

  static int getRemainingDaysInYear() {
    int year = DateTime.now().year;
    int currentDayInYear =
        DateTime.now().difference(DateTime(year, 1, 1)).inDays + 1;
    var totalDaysOfTheYear = getDaysInYear(DateTime.now().year);
    return totalDaysOfTheYear - currentDayInYear;
  }

  static int getDaysInYear(int year) {
    DateTime startOfYear = DateTime(year, 1, 1);
    DateTime startOfNextYear = DateTime(year + 1, 1, 1);
    Duration yearDuration = startOfNextYear.difference(startOfYear);
    print("total days in year");
    print(yearDuration.inDays);
    return yearDuration.inDays;
  }

// Replace these values with your desired date
}
