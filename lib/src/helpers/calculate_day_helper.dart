class CalculateDayHelper {
  static int getDayOfYear() {
    int year = DateTime.now().year;
    int month = DateTime.now().month;
    int day = DateTime.now().day;
    DateTime myDate = DateTime(year, month, day);
    return myDate.day;
  }

  static int getRemainingDaysInYear() {
    int year = DateTime.now().year;
    int month = DateTime.now().month;
    int day = DateTime.now().day;
    int currentDayInYear = DateTime(year, month, day).day;
    print("current day in a year");
    print(currentDayInYear);
    var totaldaysoftheyear = getDaysInYear(DateTime.now().year);
    //   int dayOfYear = getDayOfYear();
    return totaldaysoftheyear - currentDayInYear;
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
