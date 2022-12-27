class SearchDataModel
{
  static List<dynamic> search = [];

  SearchDataModel();

  SearchDataModel.fromJson(dynamic json)
  {
    json.forEach((element) {
      search.add(element);
    });
  }
}