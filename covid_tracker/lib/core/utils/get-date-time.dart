String getDateTime(String dateUnparsed) {
  final DateTime time = DateTime.parse(dateUnparsed);
  return "${time.hour}:${time.minute}:${time.second}";
}
