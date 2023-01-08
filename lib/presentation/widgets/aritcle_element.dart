import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/empty_picture.dart';
import '../../ui/text_styles.dart';

class ArticleElement extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onTap;
  final String title;
  final String description;
  final String imageLink;

  const ArticleElement({
    super.key,
    required this.title,
    required this.description,
    required this.imageLink,
    required this.onTap,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        DecoratedBox(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                SizedBox(width: 150.w, height: 110.h, child: Image.network(imageLink == '' ? emptyPic : imageLink)),
                SizedBox(width: 20.w),
                Column(children: [
                  SizedBox(
                    height: 110.h,
                    width: 170.w,
                    child: Column(children: [
                      Text(
                        title,
                        style: TextStyles.headerText,
                        softWrap: true,
                        maxLines: 2,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        description,
                        style: TextStyles.regularText,
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ]),
                  ),
                  LikeButton(onTap: onTap, isFavorite: isFavorite),
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LikeButton extends StatelessWidget {
  final bool isFavorite;

  const LikeButton({
    super.key,
    required this.onTap,
    required this.isFavorite,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170.w,
      child: Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
            onPressed: onTap,
            icon: Icon(
              Icons.bookmark,
              size: 25,
              color: isFavorite ? Colors.red : Colors.grey,
            )),
      ),
    );
  }
}