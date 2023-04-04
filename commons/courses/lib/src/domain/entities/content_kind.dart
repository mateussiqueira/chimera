enum ContentKind {
  video,
  hyperText,
  document,
  assessment;

  static ContentKind fromString(String kind) {
    switch (kind) {
      case 'video':
        return ContentKind.video;
      case 'hyper_text':
        return ContentKind.hyperText;
      case 'document':
        return ContentKind.document;
      case 'assessment':
        return ContentKind.assessment;
      default:
        return ContentKind.hyperText;
    }
  }
}
