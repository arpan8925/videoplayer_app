// this class will contain common methods

class CommonMethods {
  // setting splash screen time
  static Future<bool> getSplashTime() {
    return Future.delayed(Duration(seconds: 3), () => true);
  }
}
