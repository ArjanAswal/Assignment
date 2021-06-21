import 'package:assignment/Functions/show_info.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key key,
    @required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showInfo(context, data);
      },
      child: ExtendedImage.network(
        data['src']['large2x'],
        width: double.infinity,
        fit: BoxFit.fill,
        cache: true,
      ),
    );
  }
}
