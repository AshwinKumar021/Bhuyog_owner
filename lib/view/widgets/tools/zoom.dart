import 'package:changin/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class ZoomableImageWidget extends StatefulWidget {
  String? userName;
  final String imageUrl;

  ZoomableImageWidget({this.userName, super.key, required this.imageUrl});

  @override
  _ZoomableImageWidgetState createState() => _ZoomableImageWidgetState();
}

class _ZoomableImageWidgetState extends State<ZoomableImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Style.colors.black),
        backgroundColor: Style.colors.primaryfade,
        elevation: 0,
        title: Text(
          'Zoom',
          style: Style.textStyles.poppins(
              color: Style.colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
        child: PhotoView(
          imageProvider: NetworkImage(widget.imageUrl),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 2,
          initialScale: PhotoViewComputedScale.contained,
          backgroundDecoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
          ),
          loadingBuilder: (context, event) {
            if (event == null) return Container();
            return Center(
              child: CircularProgressIndicator(
                value: event.cumulativeBytesLoaded / event.expectedTotalBytes!,
              ),
            );
          },
        ),
      ),
    );
  }
}
