import 'package:flutter/widgets.dart';
class $AssetsBannersGen {
  const $AssetsBannersGen();
  AssetGenImage get img1 => const AssetGenImage('assets/banners/img1.jpg');
  AssetGenImage get img2 => const AssetGenImage('assets/banners/img2.jpg');
  AssetGenImage get img3 => const AssetGenImage('assets/banners/img3.jpg');
  List<AssetGenImage> get values => [img1, img2, img3];
}
class $AssetsDefaultsGen {
  const $AssetsDefaultsGen();
  AssetGenImage get defaultProduct =>
      const AssetGenImage('assets/defaults/defaultProduct.png');
  AssetGenImage get defaultUser =>
      const AssetGenImage('assets/defaults/defaultUser.png');
  AssetGenImage get electronics =>
      const AssetGenImage('assets/defaults/electronics.png');
  AssetGenImage get emptyCart =>
      const AssetGenImage('assets/defaults/empty-cart.png');
  AssetGenImage get fashion =>
      const AssetGenImage('assets/defaults/fashion.png');
  AssetGenImage get favIcon =>
      const AssetGenImage('assets/defaults/favIcon.png');
  AssetGenImage get jewellery =>
      const AssetGenImage('assets/defaults/jewellery.png');
  AssetGenImage get makeup => const AssetGenImage('assets/defaults/makeup.png');
  AssetGenImage get offerIcon =>
      const AssetGenImage('assets/defaults/offerIcon.png');
  AssetGenImage get shippedIcon =>
      const AssetGenImage('assets/defaults/shippedIcon.png');
  List<AssetGenImage> get values => [
        defaultProduct,
        defaultUser,
        electronics,
        emptyCart,
        fashion,
        favIcon,
        jewellery,
        makeup,
        offerIcon,
        shippedIcon
      ];
}
class $AssetsIconsGen {
  const $AssetsIconsGen();
  $AssetsIconsCategoriesGen get categories => const $AssetsIconsCategoriesGen();
}
class $AssetsLogosGen {
  const $AssetsLogosGen();
  AssetGenImage get appleIcon =>
      const AssetGenImage('assets/logos/appleIcon.png');
  AssetGenImage get googleIcon =>
      const AssetGenImage('assets/logos/googleIcon.png');
  List<AssetGenImage> get values => [appleIcon, googleIcon];
}
class $AssetsLottieGen {
  const $AssetsLottieGen();
  String get success => 'assets/lottie/Success.json';
  String get noInternet => 'assets/lottie/noInternet.json';
  String get payment => 'assets/lottie/payment.json';
  String get serverDown => 'assets/lottie/server_down.json';
  List<String> get values => [success, noInternet, payment, serverDown];
}
class $AssetsOnBoardingImagesGen {
  const $AssetsOnBoardingImagesGen();
  AssetGenImage get sammyLineDelivery =>
      const AssetGenImage('assets/on_boarding_images/sammy-line-delivery.gif');
  AssetGenImage get sammyLineNoConnection => const AssetGenImage(
      'assets/on_boarding_images/sammy-line-no-connection.gif');
  AssetGenImage get sammyLineSearching =>
      const AssetGenImage('assets/on_boarding_images/sammy-line-searching.gif');
  AssetGenImage get sammyLineShopping =>
      const AssetGenImage('assets/on_boarding_images/sammy-line-shopping.gif');
  List<AssetGenImage> get values => [
        sammyLineDelivery,
        sammyLineNoConnection,
        sammyLineSearching,
        sammyLineShopping
      ];
}
class $AssetsRatingsGen {
  const $AssetsRatingsGen();
  AssetGenImage get heart => const AssetGenImage('assets/ratings/heart.png');
  AssetGenImage get heartBorder =>
      const AssetGenImage('assets/ratings/heart_border.png');
  AssetGenImage get heartHalf =>
      const AssetGenImage('assets/ratings/heart_half.png');
  List<AssetGenImage> get values => [heart, heartBorder, heartHalf];
}
class $AssetsIconsCategoriesGen {
  const $AssetsIconsCategoriesGen();
  AssetGenImage get console =>
      const AssetGenImage('assets/icons/categories/console.png');
  AssetGenImage get electronics =>
      const AssetGenImage('assets/icons/categories/electronics.png');
  AssetGenImage get fashion =>
      const AssetGenImage('assets/icons/categories/fashion.png');
  AssetGenImage get home =>
      const AssetGenImage('assets/icons/categories/home.png');
  AssetGenImage get icons8Clothes100 =>
      const AssetGenImage('assets/icons/categories/icons8-clothes-100.png');
  AssetGenImage get jewellery =>
      const AssetGenImage('assets/icons/categories/jewellery.png');
  AssetGenImage get makeup =>
      const AssetGenImage('assets/icons/categories/makeup.png');
  List<AssetGenImage> get values => [
        console,
        electronics,
        fashion,
        home,
        icons8Clothes100,
        jewellery,
        makeup
      ];
}
class Assets {
  const Assets._();
  static const String aEnv = '.env';
  static const $AssetsBannersGen banners = $AssetsBannersGen();
  static const $AssetsDefaultsGen defaults = $AssetsDefaultsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLogosGen logos = $AssetsLogosGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsOnBoardingImagesGen onBoardingImages =
      $AssetsOnBoardingImagesGen();
  static const $AssetsRatingsGen ratings = $AssetsRatingsGen();
  static List<String> get values => [aEnv];
}
class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });
  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;
  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }
  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }
  String get path => _assetName;
  String get keyName => _assetName;
}
class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });
  final bool isAnimation;
  final Duration duration;
  final int frames;
}