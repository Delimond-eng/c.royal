import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      direction: ShimmerDirection.ltr,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 15.0),
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (int i = 0; i < 4; i++) ...[
              Container(
                margin: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                height: 100.0,
                width: 80.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
