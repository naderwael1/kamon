import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:kamon/constant.dart';

class ActiveOrderCard extends StatelessWidget {
  const ActiveOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
          height: 108,
          child: Row(
            children: [
              const SizedBox(
                width: 25,
              ),
              AspectRatio(
                aspectRatio: 3 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black12,
                    image: const DecorationImage(
                      image: NetworkImage(testImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                width: 13.32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    child: Text(
                      'order number one or may be order number two or three',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: KPrimaryFont(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: KItemFontColor,
                      ),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '29 Nov, 01:20 pm ',
                    style: KPrimaryFont(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: KItemFontColor,
                    ),
                  ),
                  Text(
                    'Cairo branch',
                    style: KSecondaryFont(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: KPrimaryColor,
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Column(children: [
                Text(
                  'Total',
                  style: KPrimaryFont(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: KItemFontColor,
                  ),
                ),
                Text(
                  '200 EGP',
                  style: KPrimaryFont(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: KPrimaryColor,
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  'Visa ',
                  style: KPrimaryFont(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: KPrimaryColor,
                  ),
                ),
              ])
            ],
          )),
    );
  }
}
