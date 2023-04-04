import 'package:certificates/certificates.dart';
import 'package:courses/courses.dart';
import 'package:dependencies/dependencies.dart';
import 'package:design_system/design_system.dart';
import 'package:learning/src/data/data.dart';
import 'package:learning/src/domain/domain.dart';
import 'package:learning/src/ui/pages/course/course.dart';

class NotifierCoursePresenter extends NotifierUpdatePresenter
    with LoadingMixin, HandleErrorMixin
    implements CoursePresenter {
  NotifierCoursePresenter({
    required this.remoteLoadEnrollment,
    required this.loadEnrollmentRatings,
    required this.saveEnrollmentRating,
    required this.remoteLoadContent,
    required this.saveEnrollmentProgress,
    required this.removeEnrollmentProgress,
  }) {
    Marcopolo().listener().onData((event) {
      if (event is UpdateCourseEvent) {
        reload(silent: true);
      }
    });
  }

  final LoadEnrollmentUseCase remoteLoadEnrollment;
  final LoadEnrollmentRatings loadEnrollmentRatings;
  final SaveEnrollmentRating saveEnrollmentRating;
  final LoadContentUseCase remoteLoadContent;
  final SaveEnrollmentProgress saveEnrollmentProgress;
  final RemoveEnrollmentProgress removeEnrollmentProgress;

  EnrollmentEntity? _enrollment;
  ContentEntity? _selectedContent;
  int? _score;

  @override
  CourseEntity? get course => _enrollment?.course;

  @override
  double get coursePercentage {
    final progress = _enrollment?.progressPercentage?.toDouble() ?? 0;
    return progress / 100;
  }

  @override
  int get minPassPercentage =>
      enrollment?.certificateGoal?.minAssessmentsScore?.required ?? 70;

  @override
  DateTime? get expirationDate => _enrollment?.expireAt;

  @override
  ContentEntity? get selectedContent => _selectedContent;

  @override
  EnrollmentEntity? get enrollment => _enrollment;

  @override
  CertificateEntity? get certificate => enrollment?.certificate;

  @override
  bool hasCertificate() => certificate?.id?.isNotEmpty == true;

  @override
  bool get courseCompleted => coursePercentage == 1;

  @override
  int get totalLessons {
    return enrollment?.certificateGoal?.completedContents?.required ?? 0;
  }

  @override
  int get totalDoneLessons {
    return enrollment?.certificateGoal?.completedContents?.current ?? 0;
  }

  @override
  List<String>? get goals => _enrollment?.course.info?.goals;

  @override
  int? get durationInHours => enrollment?.course.durationInHours;

  @override
  int? get score => _score;

  @override
  Future<void> load(EnrollmentEntity enrollment, {bool silent = false}) async {
    if (!silent) {
      showLoading();
    }
    final id = enrollment.id;
    try {
      await loadingRating();
      if (id != null) {
        final result = await remoteLoadEnrollment.load(id: id);
        _enrollment = result;
        _selectedContent ??= result.nextContent;
        _cleanEnrollment();
        update();
      }
    } on DomainError catch (error) {
      handleError(Errors.error, error);
    } on NoInternetError catch (_) {
      handleError(Errors.noInternet, null);
    } on Exception catch (_) {
      handleError(Errors.generic, null);
    }
    if (!silent) {
      hideLoading();
    }
  }

  @override
  Future<void> reload({bool silent = false}) async {
    try {
      final currentEnrollment = _enrollment;
      if (currentEnrollment != null) {
        await load(currentEnrollment, silent: silent);
      }
    } catch (_) {}
  }

  @override
  void selectContent(ContentEntity content) {
    _selectedContent = content;
    loadContent(content);
    update();
  }

  void loadContent(ContentEntity content) async {
    final contentModel = (content as RemoteContentModel?);
    final enrollmentId = _enrollment?.id;
    final contentId = contentModel?.id;
    try {
      if (contentModel != null && enrollmentId != null && contentId != null) {
        final remoteContent = await remoteLoadContent.load(
          enrollmentId: enrollmentId,
          contentId: contentId,
        );
        //TODO(kaiquegazola): update this remote content in local tree;
        _selectedContent = contentModel.copyWith(url: remoteContent.url);
        update();
      }
    } catch (_) {}
  }

  void _cleanEnrollment() {
    final enrollment = _enrollment;
    if (enrollment is RemoteEnrollmentModel) {
      final course = _enrollment?.course;
      if (course is RemoteCourseModel) {
        final treeNodes = course.tree?.nodes;
        if (treeNodes != null) {
          _enrollment = enrollment.copyWith(
            course: course.copyWith(
              tree: TreeEntity(
                contents: course.tree?.contents,
                nodes: _serializeNodes(
                  treeNodes,
                ),
              ),
            ),
          );
        }
      }
    }
  }

  List<NodeEntity> _serializeNodes(List<NodeEntity> nodes) {
    final List<NodeEntity> list = [];
    for (final node in nodes) {
      if (node.contents == null || node.contents?.isEmpty == true) {
        if (node.nodes?.isNotEmpty == true) {
          list.add(
            NodeEntity(
              id: node.id,
              name: node.name,
              contents: _recursiveGenerateContent(node.nodes!),
            ),
          );
        }
      } else {
        list.add(node);
      }
    }

    list.removeWhere((element) {
      if (element.contents?.isEmpty == true) {
        return true;
      } else if (element.contents?.isEmpty == true &&
          element.nodes?.isEmpty == true) {
        return true;
      }

      return false;
    });

    return list;
  }

  List<ContentEntity> _recursiveGenerateContent(List<NodeEntity> nodes) {
    final List<ContentEntity> list = [];
    for (final node in nodes) {
      if (node.contents?.isNotEmpty == true) {
        list.addAll(node.contents!);
      } else if (node.nodes?.isNotEmpty == true) {
        list.addAll(_recursiveGenerateContent(node.nodes!));
      }
    }
    return list;
  }

  RemoteRatingModel _getRatingParameter(int? score) {
    return RemoteRatingModel(
      rateKind: RatingKindEnum.course,
      reference: _enrollment?.course.id ?? '',
      score: score,
    );
  }

  @override
  Future<void> loadingRating() async {
    try {
      final ratings = await loadEnrollmentRatings.load(
        params: _getRatingParameter(null),
      );
      _score = ratings?.getOrNull(0)?.score;
    } on Exception catch (_) {}
  }

  @override
  Future<bool> saveRating(int score) async {
    bool success = false;
    LoadingWidget.show();
    try {
      await saveEnrollmentRating.save(rating: _getRatingParameter(score));
      _score = score;
      success = true;
      update();
    } on DomainError catch (error) {
      ToastWidget.show(message: error.message);
    } on NoInternetError catch (_) {
      ToastWidget.showNoInternet();
    } on Exception catch (_) {
      ToastWidget.showGenericError();
    }
    LoadingWidget.hide();
    return success;
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
          } else {
            await saveEnrollmentProgress.save(
              enrollmentId: enrollmentId,
              contentId: contentId,
            );
          }
          await reload(silent: true);
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

  @override
  String? get categoryName {
    final category = course?.categories?.getOrNull(0);
    return category?.name;
  }

  @override
  DateTime get lastActivity {
    return _enrollment?.lastActivityAt ?? DateTime.now();
  }
}
