import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:know_news/presentation/components/Shimmer_effect.dart';

import '../../data/network/models/news_model.dart';
import '../../logic/cubits/news_cubit.dart';
import 'article_item.dart';
import 'divider.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({
    Key? key,
    required this.cubitList,
    required this.state,
  }) : super(key: key);

  final List<ArticleModel> cubitList;
  final NewsState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 28.h),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (state is BusinessLoadingState || state is ScienceLoadingState
        || state is SportsLoadingState || state is HealthLoadingState)
            ? (context, index) => const Shimmer()
            :
            //review this conditions
            (context, index) => ArticleItem(
                  title: cubitList[index].title,
                  dateTime: cubitList[index].publishedAt,
                  image: cubitList[index].urlToImage,
                  url: cubitList[index].url,
                ),
        separatorBuilder: (context, index) => const CustomDivider(),
        itemCount: (state is BusinessLoadingState || state is ScienceLoadingState
            || state is SportsLoadingState || state is HealthLoadingState) ? 9 : cubitList.length,
      ),
    );
  }
}
