import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double height;
  final double? width;
  final bool isList;
  final bool isGrid;
  final bool isListhorizontal;
  final BorderRadius borderRadius;

  const CustomShimmer({
    Key? key,
    required this.height,
    this.width,
    this.borderRadius = BorderRadius.zero,
    this.isList = false,
    this.isListhorizontal = false,
    this.isGrid = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isList
        ? ListView.builder(
            itemCount: 5,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ).paddingOnly(bottom: 20);
            })
        : isListhorizontal
            ? SizedBox(
                height: 40,
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: height,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ).paddingOnly(bottom: 20);
                    }),
              )
            : isGrid
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.75,
                    ),
                    padding: EdgeInsets.zero,
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: height,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ).paddingOnly(bottom: 20);
                    },
                  )
                : shimmerWidget(height: height,width: width);
  }

  Widget shimmerWidget({height, width}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
