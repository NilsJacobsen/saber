import 'package:flutter/material.dart';

abstract class UpdateManager {
  static final Uri versionUrl = Uri.parse('https://raw.githubusercontent.com/adil192/saber/main/lib/data/version.dart');
  static final Uri apiUrl = Uri.parse('https://api.github.com/repos/adil192/saber/releases/latest');
  /// The availability of an update.
  static final ValueNotifier<UpdateStatus> status = ValueNotifier(UpdateStatus.upToDate);

  static Future<void> showUpdateDialog(BuildContext context, {bool userTriggered = false}) async {
    // non-web only
  }

  @visibleForTesting
  static Future<String?> getLatestDownloadUrl([
    String? apiResponse,
    TargetPlatform? platform,
  ]) async {
    // non-web only
    return null;
  }
}

enum UpdateStatus {
  /// The app is up to date, or we failed to check for an update.
  upToDate,
  /// An update is available, but the user doesn't need to be notified
  updateOptional,
  /// An update is available and the user should be notified
  updateRecommended,
}
