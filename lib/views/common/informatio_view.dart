import 'package:content_manage/resources/app_colors.dart';
import 'package:content_manage/resources/app_dimension.dart';
import 'package:flutter/material.dart';



class InformatioView extends StatelessWidget {
  final IconData iconName;
  final String heading;
  final String subHeading;
  const InformatioView({super.key,
  required this.heading,
  required this.iconName,
  required this.subHeading
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconName,
          size: AppDimension.px_40,
          color: const Color.fromARGB(255, 10, 91, 156),
        ),
        SizedBox(
          width: AppDimension.px_10,
        ),
        Column(
          children: [
            Text(
              heading,
              style: TextStyle(
                fontSize: AppDimension.px_20,
                color: AppColors.blueColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Text(
                  subHeading,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: AppDimension.px_16,
                    color: AppColors.blueColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
