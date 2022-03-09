class ConfigLocal {
  // ignore: missing_return
  static Future<String> getPath() async {
    var path = await getPath();
    path = path + '/lib/domain/gerados';
  }
}
