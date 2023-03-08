import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobPage extends StatefulWidget {
  const AdmobPage({Key? key}) : super(key: key);

  @override
  State<AdmobPage> createState() => _AdmobPageState();
}

class _AdmobPageState extends State<AdmobPage> {
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;
  bool _isLoaded = false;

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId = Platform.isAndroid
      // ? 'ca-app-pub-3940256099942544/6300978111'
      // : 'ca-app-pub-3940256099942544/2934735716';
      ? 'ca-app-pub-4573737784354321/2916482349'
      : 'ca-app-pub-4573737784354321/7247729151';

  final adUnitId2 = Platform.isAndroid
      // ? 'ca-app-pub-3940256099942544/1033173712'
      // : 'ca-app-pub-3940256099942544/4411468910';
      ? 'ca-app-pub-4573737784354321/5278706201'
      : 'ca-app-pub-4573737784354321/9765849776';

  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: ${err.message}');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }

  void loadAdInterstitial() {
    InterstitialAd.load(
        adUnitId: adUnitId2,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }

  RewardedAd? _rewardedAd;

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId3 = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/5224354917'
      : 'ca-app-pub-3940256099942544/1712485313';

  /// Loads a rewarded ad.
  void loadAd3() {
    RewardedAd.load(
        adUnitId: adUnitId3,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            _rewardedAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('RewardedAd failed to load: $error');
          },
        ));
  }

  RewardedInterstitialAd? _rewardeInterstitialdAd;

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId4 = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/5354046379'
      : 'ca-app-pub-3940256099942544/6978759866';

  /// Loads a rewarded ad.
  void loadAd4() {
    RewardedInterstitialAd.load(
        adUnitId: adUnitId4,
        request: const AdRequest(),
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            _rewardeInterstitialdAd = ad;
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('RewardedInterstitialAd failed to load: $error');
          },
        ));
  }

  @override
  void initState() {
    loadAd();
    loadAdInterstitial();
    loadAd3();
    loadAd4();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (_bannerAd != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: SizedBox(
                  width: _bannerAd!.size.width.toDouble(),
                  height: _bannerAd!.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                ),
              ),
            ),
          SizedBox(
            height: 32,
          ),
          ElevatedButton(
              onPressed: () {
                _interstitialAd?.show();
              },
              child: Text("Ad Mob")),
          SizedBox(
            height: 32,
          ),
          ElevatedButton(
              onPressed: () {
                _rewardedAd?.show(onUserEarnedReward:
                    (AdWithoutView ad, RewardItem rewardItem) {
                  // Reward the user for watching an ad.
                });
              },
              child: Text("Ad Reward")),
          SizedBox(
            height: 32,
          ),
          ElevatedButton(
              onPressed: () {
                _rewardeInterstitialdAd?.show(onUserEarnedReward:
                    (AdWithoutView ad, RewardItem rewardItem) {
                  // Reward the user for watching an ad.
                });
              },
              child: Text("Ad Reward")),
          Text("data"),
        ],
      ),
    );
  }
}
