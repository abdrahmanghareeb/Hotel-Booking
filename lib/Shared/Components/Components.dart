import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../Models/hotel_list_model.dart';

Widget create_card({@required index}) {
  var hoteldata = HotelListData.hotelList?[index];
  return Column(
    children: <Widget>[
      AspectRatio(
        aspectRatio: 2,
        child: Image.asset(
          hoteldata!.imagePath,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      hoteldata!.titleTxt,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 22),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          hoteldata!.subTxt,
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.8),
                              fontSize: 14),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.location_on,
                          size: 16,
                        ),
                        Expanded(
                            child: Text(
                              '${hoteldata!.dist.toStringAsFixed(1)} km to city',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.withOpacity(0.8)),
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Row(
                        children: <Widget>[
                          RatingBar(
                            ratingWidget: RatingWidget(
                              full: const Icon(
                                Icons.star_rate_rounded,
                                color: Colors.orange,
                              ),
                              half: const Icon(
                                Icons.star_half_rounded,
                                color: Colors.orange,
                              ),
                              empty: const Icon(
                                Icons.star_border_rounded,
                                color: Colors.orange,
                              ),
                            ),
                            onRatingUpdate: (value) {},
                            itemPadding: EdgeInsets.zero,
                            initialRating: hoteldata!.rating,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 24,
                          ),
                          Text(
                            '${hoteldata!.reviews} Reviews',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.withOpacity(0.8)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$${hoteldata!.perNight}',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '/per night',
                    style: TextStyle(
                        fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                  )
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}