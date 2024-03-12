import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> preLoadSVGs(List<String> assetsPaths) async {
  for (var path in assetsPaths) {
    final loader = SvgAssetLoader(path);
    await svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
  }
}

/*
    ** SVGs have some good advantages over regular images:

    - scalable without loss of quality
    - smaller and more performant (for simple shapes)

    But have you noticed that when you use SVGs in your apps, they don't always appear immediately?

    To fix this, consider pre-caching them with a helper function that you can call inside your main().

    Then, you can render your SVGs inside your widgets as needed.

* */