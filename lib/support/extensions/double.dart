extension DoubleExtension on double {
  String toKilometerPerHour() {
    return (this * 3.6).toStringAsFixed(1);
  }
}
