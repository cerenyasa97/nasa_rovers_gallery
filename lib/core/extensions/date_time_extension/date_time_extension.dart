extension DateTimeExtension on DateTime {
  String get date =>
      this.year.toString() +
      "/" +
      (this.month < 10 ? "0${this.month}" : this.month.toString()) +
      "/" +
      (this.day < 10 ? "0${this.day}" : this.day.toString());
}
