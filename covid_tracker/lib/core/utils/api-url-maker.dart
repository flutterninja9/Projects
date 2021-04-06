const baseUrl = "https://api.covid19api.com";

extension UrlMaker on String {
  String makeUrl() => baseUrl + this;
}
