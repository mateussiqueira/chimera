import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/domain/domain.dart';
import 'package:learning/src/ui/pages/content/content.dart';

class NotifierContentPresenter extends NotifierUpdatePresenter
    implements ContentPresenter {
  NotifierContentPresenter({
    required this.remoteLoadContent,
    required this.removeEnrollmentProgress,
    required this.saveEnrollmentProgress,
  });

  final LoadContentUseCase remoteLoadContent;
  final SaveEnrollmentProgress saveEnrollmentProgress;
  final RemoveEnrollmentProgress removeEnrollmentProgress;

  EnrollmentEntity? _enrollment;
  ContentEntity? _content;
  List<ContentEntity> _contentList = [];
  bool _canGoBack = false;
  bool _canGoForward = false;
  bool _isLoading = false;

  @override
  Future<void> init(EnrollmentEntity enrollment, ContentEntity content) async {
    _enrollment = enrollment;
    _content = content;

    final nodes = _enrollment?.course.tree?.nodes;
    if (nodes != null) {
      _contentList = _recursiveBringContent(nodes, _contentList);
      _contentList.removeWhere(
        (element) => element.coreKind == ContentKind.assessment,
      );
    }

    load(content);
  }

  @override
  Future<void> load(ContentEntity content) async {
    LoadingWidget.show();
    _isLoading = true;
    final enrollmentId = _enrollment?.id;
    final contentId = content.id;
    try {
      if (enrollmentId != null && contentId != null) {
        final result = await remoteLoadContent.load(
          enrollmentId: enrollmentId,
          contentId: contentId,
        );
        _content = (result as RemoteContentModel).copyWith(
          isCompleted: (content as RemoteContentModel).isCompleted,
        );
      }
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }
    _isLoading = false;
    LoadingWidget.hide();

    _updateControls();
    update();
  }

  @override
  bool get canGoBack => _canGoBack;

  @override
  bool get canGoForward => _canGoForward;

  @override
  bool get isLoading => _isLoading;

  List<ContentEntity> _recursiveBringContent(
    List<NodeEntity> nodes,
    List<ContentEntity> list,
  ) {
    for (final node in nodes) {
      final contents = node.contents;
      if (contents != null) {
        list.addAll(contents);
      }

      final innerNodes = node.nodes;
      if (innerNodes != null) {
        _recursiveBringContent(innerNodes, list);
      }
    }
    return list;
  }

  @override
  ContentEntity? get content => _content;

  @override
  Future<void> forward() async {
    final currentContent = _content;
    if (currentContent != null && canGoForward) {
      final index = _contentList.indexWhere(
        (element) => element.id == currentContent.id,
      );
      if (index > -1) {
        await load(_contentList[index + 1]);
      }
    }
  }

  @override
  Future<void> back() async {
    final currentContent = _content;
    if (currentContent != null && canGoBack) {
      final index = _contentList.indexWhere(
        (element) => element.id == currentContent.id,
      );

      if (index > -1) {
        await load(_contentList[index - 1]);
      }
    }
  }

  void _updateControls() {
    final currentContent = _content;
    if (currentContent != null) {
      final index = _contentList.indexWhere(
        (element) => element.id == currentContent.id,
      );

      _canGoBack = index > 0;
      _canGoForward = index < _contentList.length - 1;

      update();
    }
  }

  @override
  Future<void> toggleCompleted(ContentEntity content) async {
    LoadingWidget.show();
    try {
      final enrollmentId = _enrollment?.id;
      final contentId = content.id;
      if (enrollmentId != null && contentId != null) {
        if (content is RemoteContentModel) {
          if (content.isCompleted) {
            await removeEnrollmentProgress.remove(
              enrollmentId: enrollmentId,
              contentId: contentId,
            );
            _content = content.copyWith(isCompleted: false);
          } else {
            await saveEnrollmentProgress.save(
              enrollmentId: enrollmentId,
              contentId: contentId,
            );
            _content = content.copyWith(isCompleted: true);
          }
        }
        update();
      }
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }
    LoadingWidget.hide();
  }
}
