import 'package:certificates/certificates.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:profile/src/profile_module.dart';

import '../../ui.dart';
import 'widgets/widgets.dart';

class MyCertificatesPage extends StatelessWidget with UIBottomSheetMixin {
  const MyCertificatesPage({super.key, required this.presenter});

  final MyCertificatesPresenter presenter;
  final crossAxisSpacing = Sizes.size16;

  @override
  Widget build(BuildContext context) {
    double padding =
        ResponsiveLayoutWidget.isTablet(context) ? Sizes.size32 : Sizes.size16;
    return ScaffoldBaseWidget(
      appBar: SecondaryAppBarWidget(title: R.string.myCertificates),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        padding: EdgeInsets.all(padding),
        child: ListenableBuilder(
          listenable: presenter,
          builder: (context) {
            if (presenter.hasCertificates == CertificatesStatus.noLoad) {
              return const EmptyWidget();
            } else if (presenter.hasCertificates ==
                CertificatesStatus.hasCertificates) {
              return ResponsiveLayoutWidget(
                mobile: (context) => items(1, context, padding),
                tablet: (context) => items(2, context, padding),
              );
            } else {
              return const CertificateEmptyWidget();
            }
          },
        ),
      ),
    );
  }

  Widget items(int columns, BuildContext context, double padding) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: contentWidth(context, columns, padding),
        child: PaginationGridWidget(
          shrinkWrap: true,
          itemCount: presenter.certificates.length,
          mainAxisSpacing: crossAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          nextPage: presenter.nextPage,
          crossAxisCount: columns,
          itemBuilder: (ctx, index) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: SizedBox(
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(
                          0,
                          0,
                          0,
                          Sizes.size20,
                        ),
                        child: CertificateWidget(
                          certificate: presenter.certificates[index],
                          columns: columns,
                          crossAxisSpacing: crossAxisSpacing,
                          contentWidth: contentWidth(context, columns, padding),
                          padding: padding,
                        ),
                      ),
                      Positioned(
                        bottom: Sizes.size08,
                        right: Sizes.size16,
                        child: PrimaryButton.iconXl(
                          icon: Icons.download02,
                          onPressed: () async {
                            await showModalBS<bool>(
                              context: context,
                              body: DownloadCertificateBottomSheet(
                                presenter: ProfileModule.alligator
                                    .get<DownloadCertificatePresenter>(),
                                certificate: presenter.certificates[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double? contentWidth(BuildContext context, int columns, double padding) {
    if (columns == 1) return null;
    const columnWidth = 470.0;
    final screenSpace = MediaQuery.of(context).size.width - 2 * padding;
    final contentSpace =
        (columnWidth * columns - ((columns - 1) * crossAxisSpacing)) -
            2 * padding;
    if (screenSpace > contentSpace) return contentSpace;
    return null;
  }
}
