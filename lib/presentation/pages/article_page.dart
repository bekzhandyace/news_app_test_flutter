import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/core/empty_picture.dart';
import '../../ui/text_styles.dart';

class ArticlePage extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;
  const ArticlePage({
    super.key,
    required this.title,
    required this.content,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100.w,
        leading: SizedBox(
          height: 100.h,
          width: 120.w,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyles.headerText,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            SizedBox(
                width: 350.w,
                height: 200.h,
                child: Image.network(imageUrl == '' ? emptyPic : imageUrl)),
            SizedBox(height: 20.h),
            Text(content, style: TextStyles.regularText),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
