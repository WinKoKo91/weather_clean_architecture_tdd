class DateTimeUtil {
  static const weekDayNames = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];

  static const monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];


  String dataTimeToString(int timestamp){
    DateTime datetime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String weekDayName = weekDayNames[datetime.day];
    String monthName = monthNames[datetime.month];
    return '';
  }
}
