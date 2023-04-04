import 'package:authentication/authentication.dart' show LocalLoadUser;
import 'package:certificates/certificates.dart';
import 'package:dependencies/dependencies.dart';
import 'package:iterable/iterable_method_channel.dart';
import 'package:profile/src/data/data.dart';
import 'package:profile/src/domain/domain.dart';
import 'package:profile/src/presentation/presentation.dart';
import 'package:profile/src/ui/pages/pages.dart';

class ProfileModule {
  static final alligator = Alligator();

  static Alligator initialize() {
    alligator.register<LoadCertificates>(
      () => RemoteLoadCertificates(
        client: alligator.get<HttpClient>(),
        loadAccount: alligator.get<LoadAccount>(),
        url: EndPointConfiguration.url('/courses/certificates'),
      ),
    );

    alligator.register<PackageInfo>(
      () => PackageInfoAdapter(),
    );

    alligator.register<DownloadCertificate>(
      () => RemoteDownloadCertificate(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url('/courses/certificates/{ID}/download'),
        loadAccount: alligator.get<LoadAccount>(),
      ),
    );

    alligator.register<RemoveAccount>(
      () => RemoteRemoveAccount(
        client: alligator.get<HttpClient>(),
        url: EndPointConfiguration.url('/users'),
        loadAccount: alligator.get<LoadAccount>(),
      ),
    );

    alligator.register<DownloadCertificatePresenter>(
      () => NotifierDownloadCertificatePresenter(
        downloadCertificate: alligator.get<DownloadCertificate>(),
        httpClient: alligator.get<HttpClient>(),
        shareContent: alligator.get<ShareContent>(),
      ),
    );

    alligator.register<AddRating>(
      () => RemoteAddRating(
        client: alligator.get<HttpClient>(),
        loadAccount: alligator.get<LoadAccount>(),
        url: EndPointConfiguration.url('/ratings'),
      ),
    );

    alligator.register<ProfilePresenter>(
      () => NotifierProfilePresenter(
        iterable: alligator.get<MethodChannelIterable>(),
        addRating: alligator.get<RemoteAddRating>(),
        localUserIsLoggedIn: alligator.get<UserIsLoggedIn>(),
        packageInfo: alligator.get<PackageInfo>(),
        localLoadUser: alligator.get<LocalLoadUser>(),
        removeAccount: alligator.get<RemoveAccount>(),
        networkConnection: alligator.get<NetworkConnectionAdapter>(),
      ),
    );

    alligator.register<MyCertificatesPresenter>(
      () => NotifierMyCertificatesPresenter(
        loadCertificates: alligator.get<LoadCertificates>(),
      ),
    );

    alligator.register<DownloadCertificatePresenter>(
      () => NotifierDownloadCertificatePresenter(
        downloadCertificate: alligator.get<DownloadCertificate>(),
        httpClient: alligator.get<HttpClient>(),
        shareContent: alligator.get<ShareContent>(),
      ),
    );

    alligator.register<AccountDeletionPresenter>(
      () => NotifierAccountDeletionPresenter(
        removeAccount: alligator.get<RemoteRemoveAccount>(),
      ),
    );

    return alligator;
  }
}
