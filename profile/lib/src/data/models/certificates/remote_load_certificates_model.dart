import 'package:certificates/certificates.dart';

class RemoteLoadCertificatesModel {
  RemoteLoadCertificatesModel({required this.list});

  factory RemoteLoadCertificatesModel.fromJson(List<dynamic> list) {
    if (list.isNotEmpty) {
      List<Map<String, dynamic>> mapList = list.cast<Map<String, dynamic>>();
      return RemoteLoadCertificatesModel(list: mapList);
    } else {
      return RemoteLoadCertificatesModel(list: []);
    }
  }

  final List<Map<String, dynamic>> list;

  List<CertificateEntity> toListEntity() => List.from(
        list.map((e) => RemoteCertificateModel.fromJson(e).toEntity()).toList(),
      );
}
