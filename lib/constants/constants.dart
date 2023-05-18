bool isLink(String text) {
  final pattern = RegExp(r'http(s)?://([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,}(/\S*)?');
  return pattern.hasMatch(text);
}
