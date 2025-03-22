import 'package:flutter/material.dart';
import 'package:jewellery/common/widgets/text/custom_text.dart';
import 'package:jewellery/consts/app_text_style.dart';
import 'package:jewellery/consts/color_consts.dart';
import 'package:jewellery/consts/extensions.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final bool isCompleted;

  TaskCard({
    required this.title,
    required this.description,
    required this.date,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColorConsts.whiteColor,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title,
              style: AppTextStyle.semiBold16TextStyle,
            ),
            5.vs,
            CustomText(
              description,
              style: AppTextStyle.regular10TextStyle,
            ),
            10.vs,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.date_range_rounded,
                        size: 16, color: AppColorConsts.primaryColor),
                    5.hs,
                    CustomText(
                      date,
                      style: AppTextStyle.regular14TextStyle
                          .copyWith(color: AppColorConsts.primaryColor),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: !isCompleted
                          ? AppColorConsts.greyColor1.withOpacity(0.2)
                          : AppColorConsts.red.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.favorite,
                        color: !isCompleted
                            ? AppColorConsts.greyColor1
                            : AppColorConsts.red)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
