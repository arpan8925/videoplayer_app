import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  // getting banner ad util id
  static String get bannerAdUtilId => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/6300978111';

  // initialising mobile ads
  static initialize() {
    // ignore: unnecessary_null_comparison
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  // creating banner
  static BannerAd createBannerAd() {
    BannerAd ad = BannerAd(
      size: AdSize.banner,
      adUnitId: bannerAdUtilId,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) => print("On load"),
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print("On Open"),
        onAdClosed: (Ad ad) => print("On Close"),
      ),
      request: AdRequest(),
    );

    return ad;
  }
}
