import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/core/utils/end_point.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../domain/entities/base_product_data.dart';
import '../../../../component/compenent.dart';
import '../product_details_component/product_details_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

buildCardItem(BaseProductData data, context) => ScreenUtilInit(
  builder: (BuildContext context, Widget? child) =>InkWell(
    child: Container(
      height: 248.51.h,
      width: 173.32.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1, color: Colors.grey.shade400)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 150.71,
                height: 80.11,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                    data.image.isEmpty || data.image == null?
                    Image.asset('assets/icons/Group.png').image :
                    Image.network(
                      '$baseUrlImage${data.image}',
                      errorBuilder: (context, object, stackTrace) {
                        return Image.asset('assets/icons/Group.png');
                      },
                    ).image,
                  ),
                ),
                child : data.image.split('.').last.toLowerCase() == 'svg' ?
                SvgPicture.network(
                  '$baseUrlImage/${data.image}',
                  fit: BoxFit.cover,
                  width: 250,
                  placeholderBuilder: (BuildContext context) => Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[300]!,

                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      width: 250,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300]
                      ),
                    ),
                  ),
                ) : Container(),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              data.name,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 15.sp, color: Colors.black),
            ),
            Text(
              "${data.quantity}pcs,PriceEG",
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.grey, fontSize: 13),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  "\$${data.price}",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 16.sp, color: Colors.black),
                ),
                const Spacer(),
                Container(
                  height: 45.67,
                  width: 45.67,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff53B175)),
                  child: TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    ),
    onTap: () {
      // print(data.image);
      navigateTo(
          context,
          ProductDetailsScreen(
            id: data.id,
          ));
    },
  ),
);
