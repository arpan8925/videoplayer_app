// this class will contain common methods
import 'dart:io';

class CommonMethods {
  // setting splash screen time
  static Future<bool> getSplashTime() {
    return Future.delayed(Duration(seconds: 3), () => true);
  }

  static bool? isUpdate;
  // rename file
  static bool renameFile(File file, String newFileName) {
    try {
      if (file.existsSync()) {
        file = changeFileNameOnlySync(file, newFileName);
        isUpdate = true;
        return true;
      } else {
        return false;
      }
    } catch (e) {
      isUpdate = false;
      print("Exception $e");
      return false;
    }
  }

  static File changeFileNameOnlySync(File file, String newFileName) {
    var path = file.path;
    print("Path: $path");
    var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    print("last Seperator: $lastSeparator");
    var newPath = path.substring(0, lastSeparator + 1) + newFileName;
    print("new path: $newPath");
    return file.renameSync(newPath);
  }

  // delete dialog
  static void deleteFileDialog(File file) {
    try {
      if (file.existsSync()) {
        file.deleteSync();
        isUpdate = true;
      }else{
        isUpdate = false;
      }
    } catch (e) {
      print("Exception: $e");
      isUpdate = false;
    }
  }
}
