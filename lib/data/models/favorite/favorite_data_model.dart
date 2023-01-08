class FavoriteDataModel
{
  static List<Map<String, dynamic>> favoriteList = [];

  FavoriteDataModel();

  FavoriteDataModel.fromJson(dynamic json)
  {
    json.forEach((element) {
      favoriteList.add(element);
    });
  }
}