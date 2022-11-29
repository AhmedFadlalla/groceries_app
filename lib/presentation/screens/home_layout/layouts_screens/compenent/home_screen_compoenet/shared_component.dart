import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../domain/entities/base_product_data.dart';
import '../../../../component/compenent.dart';
import '../product_details_component/product_details_screen.dart';

buildCardItem(BaseProductData data, context) => InkWell(
  child: Container(
    height: 248.51,
    width: 173.32,
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
              width: 107.71,
              height:  67.11,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                      data.image,
                  ) ,

                  )),
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
                .copyWith(fontSize: 16, color: Colors.black),
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
                    .copyWith(fontSize: 16, color: Colors.black),

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
  onTap: (){
    navigateTo(context,  ProductDetailsScreen(id: data.id,));
  },
);