import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:know_news/presentation/screens/web_screen.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem(
      {Key? key,
      required this.title,
      this.dateTime,
      required this.image,
      required this.url})
      : super(key: key);
  final String title;
  final DateTime? dateTime;
  final String image;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        WebViewScreen(url: url).launchURLApp();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 220.h,
            width: 220.w,
            decoration: BoxDecoration(
              //shape: BoxShape.circle,
              color: Colors.green,
              borderRadius: BorderRadius.circular(30.r),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12.h,
                ),
                AutoSizeText(
                  title,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
                  maxLines: 4,
                  overflow: TextOverflow
                      .ellipsis, // willShow ... if the text doesn't complete
                ),

                //  const Text('jack the ripper'),
                Text('Published at :' + dateTime.toString(),
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400))
              ],
            ),
          )
        ],
      ),
    );
  }
}
