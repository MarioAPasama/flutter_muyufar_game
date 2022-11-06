class UtilsModel {
  final String infoApps;
  final String contact;

  const UtilsModel({
    required this.infoApps,
    required this.contact,
  });

  factory UtilsModel.fromJson(Map<String, dynamic> json) {
    return UtilsModel(
      infoApps: json['info_apps'],
      contact: json['contact'],
    );
  }
}
