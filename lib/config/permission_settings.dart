import 'package:permission_handler/permission_handler.dart';

// this class will handle all permission
class PermissionSettings {
  // request storage permission
  static bool? isPermit;
  static Future<bool> promptPermissionSetting() async {

    if (await Permission.storage.request().isGranted) {
      isPermit = true;
      return true;
    } else {
      isPermit = false;
      return false;
    }
  }

  // permission for manage storage
  static Future<bool> getManagePermission() async {
    if (await Permission.manageExternalStorage.request().isGranted) {
      return true;
    } else {
      return false;
    }
  }
}
