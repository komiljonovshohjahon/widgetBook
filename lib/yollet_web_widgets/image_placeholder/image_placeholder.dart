import 'package:flutter/material.dart';
import 'package:widgetbook_2/base/theme_color.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class ImagePlaceholder extends StatefulWidget {
  final String? url;
  final double? width;
  final double? height;
  final AlignmentGeometry alignment;
  final BoxFit fit;
  final String? defaultAssetImageUrl;

  ImagePlaceholder({
    this.url,
    this.width,
    this.height,
    this.alignment = Alignment.center,
    this.fit = BoxFit.cover,
    this.defaultAssetImageUrl = 'assets/images/empty.png',
  });

  @override
  _ImagePlaceholderState createState() => _ImagePlaceholderState();
}

class _ImagePlaceholderState extends State<ImagePlaceholder> {
  String? _url;

  @override
  Widget build(BuildContext context) {
    if (widget.url != null) {
      if (widget.url!.startsWith('https://') ||
          widget.url!.startsWith('http://')) {
        return _loadImage();
      }
    }
    return _defaultImage();
  }

  Widget _defaultImage() {
    return Container(
      width: widget.width,
      height: widget.height,
      alignment: widget.alignment,
      child:
          Image.asset(widget.defaultAssetImageUrl ?? 'assets/images/empty.png'),
    );
  }

  Widget _loadImage() {
    return Image.network(
      widget.url!,
      width: widget.width,
      height: widget.height,
      alignment: widget.alignment,
      fit: widget.fit,
    );
  }
}

@WidgetbookUseCase(name: 'Image Placeholder', type: ImagePlaceholder)
Widget defaultImagePlaceholderStory() {
  return ImagePlaceholder(
    width: 200,
    height: 200,
  );
}
