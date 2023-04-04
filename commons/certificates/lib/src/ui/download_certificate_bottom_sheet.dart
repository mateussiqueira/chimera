import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';

import '../../certificates.dart';

class DownloadCertificateBottomSheet extends StatelessWidget {
  DownloadCertificateBottomSheet({
    super.key,
    required this.presenter,
    required CertificateEntity certificate,
  }) {
    presenter.initCertificate(certificate);
  }

  final DownloadCertificatePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return BottomSheetBaseWidget(
      iconWaveWidget: const IconWaveWidget(
        icon: Icons.download02,
        iconWaveType: IconWaveType.info,
      ),
      body: ButtonsOkCancelHorizontalWidget(
        primaryButtonTitle: R.string.downloadInPdf,
        primaryButtonOnPressed: () =>
            download(context, CertificateFileType.document),
        secondaryButtonTitle: R.string.downloadInImage,
        secondaryButtonOnPressed: () =>
            download(context, CertificateFileType.image),
      ),
      title: R.string.howDoYouWantToDownloadYourCetificate,
    );
  }

  Future<void> download(BuildContext context, CertificateFileType type) async {
    presenter.download(type);
    Navigator.of(context).pop();
  }
}
