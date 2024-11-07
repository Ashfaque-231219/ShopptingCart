import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class MyImage extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final bool isTransparent;
  final bool enableSlideOutPage;
  final bool isDefaultSize;
  final LoadStateChanged? loadStateChanged;
  final double? radius;
  final VoidCallback? onTap;

  const MyImage(
      this.image, {
        super.key,
        this.width,
        this.height,
        this.color,
        this.fit = BoxFit.contain,
        this.isTransparent = false,
        this.loadStateChanged,
        this.enableSlideOutPage = false,
        this.isDefaultSize = false,
        this.radius,
        this.onTap,
      });

  @override
  Widget build(BuildContext context) {
    final double? finalHeight = _calculateHeight();
    final double? finalWidth = _calculateWidth();

    return InkWell(
      onTap: onTap,
      child: Container(
        width: finalWidth,
        height: finalHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
        clipBehavior: Clip.antiAlias,
        child: _buildImage(finalWidth, finalHeight),
      ),
    );
  }

  double? _calculateHeight() {
    if (isDefaultSize && height != null && width != null) {
      return getImageSize(Get.width / width!, height!);
    }
    return height;
  }

  double? _calculateWidth() {
    return isDefaultSize ? Get.width : width;
  }

  Widget _buildImage(double? finalWidth, double? finalHeight) {
    if (image.isEmpty) {
      return _buildPlaceholder(finalWidth, finalHeight);
    } else if (image.endsWith('.svg')) {
      return _buildSvgImage(finalWidth, finalHeight);
    } else if (image.startsWith('http')) {
      return _buildNetworkImage(finalWidth, finalHeight);
    } else {
      return _buildAssetImage(finalWidth, finalHeight);
    }
  }

  Widget _buildPlaceholder(double? finalWidth, double? finalHeight) {
    return Container(
      width: finalWidth,
      height: finalHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 0),
        color: color,
      ),
    );
  }

  Widget _buildSvgImage(double? finalWidth, double? finalHeight) {
    final ColorFilter? colorFilter =
    color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null;

    if (image.contains('assets/images')) {
      return SvgPicture.asset(
        image,
        width: finalWidth,
        height: finalHeight,
        fit: fit,
        colorFilter: colorFilter,
      );
    } else {
      return SvgPicture.network(
        image,
        width: finalWidth,
        height: finalHeight,
        fit: fit,
        colorFilter: colorFilter,
        placeholderBuilder: (BuildContext context) => Lottie.asset(
          'assets/json/image_loading.json',
          fit: BoxFit.fill,
        ),
      );
    }
  }

  Widget _buildNetworkImage(double? finalWidth, double? finalHeight) {
    return ExtendedImage.network(
      image,
      cache: true,
      width: finalWidth,
      height: finalHeight,
      enableSlideOutPage: enableSlideOutPage,
      clearMemoryCacheWhenDispose: true,
      mode: ExtendedImageMode.gesture,
      initGestureConfigHandler: (state) {
        return GestureConfig(
          minScale: 0.9,
          animationMinScale: 0.7,
          maxScale: 3.0,
          animationMaxScale: 3.5,
          speed: 1.0,
          inertialSpeed: 100.0,
          initialScale: 1.0,
          inPageView: false,
          cacheGesture: false,
        );
      },
      loadStateChanged: loadStateChanged ??
              (ExtendedImageState state) {
            switch (state.extendedImageLoadState) {
              case LoadState.loading:
                return Lottie.asset(
                  'assets/json/image_loading.json',
                  fit: BoxFit.fill,
                );
              case LoadState.failed:
                return _buildLoadFailedContainer(state);
              case LoadState.completed:
                return ExtendedRawImage(
                  image: state.extendedImageInfo?.image,
                  fit: fit,
                );
            }
          },
      fit: fit,
    );
  }

  Widget _buildLoadFailedContainer(ExtendedImageState state) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color(0xFFC2C5D1),
        ),
      ),
      onTap: () {
        state.reLoadImage();
      },
    );
  }

  Widget _buildAssetImage(double? finalWidth, double? finalHeight) {
    if (image.contains('assets/images')) {
      return Image.asset(
        image,
        width: finalWidth,
        height: finalHeight,
        fit: fit,
      );
    } else {
      return const SizedBox();
    }
  }

  double? getImageSize(double ratio, double size) {
    return size * ratio;
  }
}
