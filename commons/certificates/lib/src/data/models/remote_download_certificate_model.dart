class RemoteDownloadCertificateModel {
  RemoteDownloadCertificateModel({required this.map});

  factory RemoteDownloadCertificateModel.fromJson(Map<String, dynamic> json) {
    return RemoteDownloadCertificateModel(map: json);
  }

  final Map<String, dynamic> map;

  String toEntity() => map["url"];
}
