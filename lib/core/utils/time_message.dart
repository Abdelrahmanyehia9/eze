abstract interface class TimeMessages {
  String get justNow;
  String minutes(int n);
  String hours(int n);
  String days(int n);
  String weeks(int n);
  String months(int n);
  String years(int n);
  String minutesAbbr(int n);
  String secondsAbbr(int n);
  String hoursAbbr(int n);
  String daysAbbr(int n);
  String weeksAbbr(int n);
  String monthsAbbr(int n);
  String yearsAbbr(int n);
}

class TimeMessagesEn implements TimeMessages {
  const TimeMessagesEn();

  @override
  String get justNow => 'Just now';

  @override
  String minutes(int n) => '$n ${n == 1 ? 'minute' : 'minutes'} ago';

  @override
  String hours(int n) => '$n ${n == 1 ? 'hour' : 'hours'} ago';

  @override
  String days(int n) => '$n ${n == 1 ? 'day' : 'days'} ago';

  @override
  String weeks(int n) => '$n ${n == 1 ? 'week' : 'weeks'} ago';

  @override
  String months(int n) => '$n ${n == 1 ? 'month' : 'months'} ago';

  @override
  String years(int n) => '$n ${n == 1 ? 'year' : 'years'} ago';

  @override
  String minutesAbbr(int n) => '${n}m';

  @override
  String hoursAbbr(int n) => '${n}h';

  @override
  String daysAbbr(int n) => '${n}d';

  @override
  String weeksAbbr(int n) => '${n}w';

  @override
  String monthsAbbr(int n) => '${n}M';

  @override
  String yearsAbbr(int n) => '${n}y';
  @override
  String secondsAbbr(int n) => '${n}s';
}

class TimeMessagesAr implements TimeMessages {
  const TimeMessagesAr();

  @override
  String get justNow => 'الآن';

  @override
  String minutes(int n) => 'منذ $n ${n == 1 ? 'دقيقة' : 'دقائق'}';

  @override
  String hours(int n) => 'منذ $n ${n == 1 ? 'ساعة' : 'ساعات'}';

  @override
  String days(int n) => 'منذ $n ${n == 1 ? 'يوم' : 'أيام'}';

  @override
  String weeks(int n) => 'منذ $n ${n == 1 ? 'أسبوع' : 'أسابيع'}';

  @override
  String months(int n) => 'منذ $n ${n == 1 ? 'شهر' : 'شهور'}';

  @override
  String years(int n) => 'منذ $n ${n == 1 ? 'سنة' : 'سنوات'}';

  @override
  String minutesAbbr(int n) => 'د$n';

  @override
  String hoursAbbr(int n) => 'س$n';

  @override
  String daysAbbr(int n) => 'ي$n';

  @override
  String weeksAbbr(int n) => 'أ$n';

  @override
  String monthsAbbr(int n) => 'ش$n';

  @override
  String yearsAbbr(int n) => 'سن$n';

  @override
  String secondsAbbr(int n) => 'ث$n';
}
