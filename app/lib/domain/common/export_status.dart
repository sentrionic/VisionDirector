/// [ExportStatus] is the currently process of the export.
///
/// * [generateVideos] means it is currently generating the videos.
/// * [concat] means it is currently concatenating all the videos together.
/// * [done] means the export is finished.
enum ExportStatus {
  generateVideos,
  concat,
  done,
}
