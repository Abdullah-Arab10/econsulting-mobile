class HomeDataModel {
  static List<Map<String, dynamic>> doctors = [];
  static List<Map<String, dynamic>> dentists = [];
  static List<Map<String, dynamic>> therapists = [];
  static List<Map<String, dynamic>> lawyers = [];
  static List<Map<String, dynamic>> economists = [];
  static List<Map<String, dynamic>> software_engineers = [];
  static List<Map<String, dynamic>> civil_engineers = [];

  HomeDataModel();

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['doctors'].forEach((element) {
      doctors.add(element);
    });
    json['dentists'].forEach((element) {
      dentists.add(element);
    });

    json['therapists'].forEach((element) {
      therapists.add(element);
    });

    json['lawyers'].forEach((element) {
      lawyers.add(element);
    });

    json['economists'].forEach((element) {
      economists.add(element);
    });

    json['software_engineers'].forEach((element) {
      software_engineers.add(element);
    });

    json['civil_engineers'].forEach((element) {
      civil_engineers.add(element);
    });
  }
}
