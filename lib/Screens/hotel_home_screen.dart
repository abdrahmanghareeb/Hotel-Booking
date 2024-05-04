import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel_booking/Cubit/hotel_cubit.dart';
import 'package:hotel_booking/Models/hotel_list_model.dart';
import 'package:intl/intl.dart';

import '../Shared/Components/Components.dart';

class HotelHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HotelCubit()..changeResponseState(),
      child: BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HotelCubit.get(context);
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: const Text("HotelsHub"),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.location_on))
                ],
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return [
                        SliverList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                          return Container(
                            color: Colors.white70,
                            child: Column(
                              children: [
                                getSearchBarUI(cubit),
                                getTimeDateUI(cubit.startDate, cubit.endDate)
                              ],
                            ),
                          );
                        }, childCount: 1)),
                        SliverPersistentHeader(
                            floating: true,
                            pinned: true,
                            delegate: ContestTabHeader(getFilterBarUI()))
                      ];
                    },
                    body: Container(
                      color: Colors.white,
                      child: ListView.separated(
                          itemBuilder: (context, index) =>
                              create_card(index: index),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10),
                          itemCount: 3),
                    ),
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  getFilterBarUI() {
    return Container(
      color: Colors.indigoAccent,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                '530 hotel.json Found',
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: <Widget>[
                  Text(
                    'Filter',
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.sort,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getSearchBarUI(cubit) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8, left: 16, right: 16),
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(38.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 4, bottom: 4),
                child: TextField(
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Cairo...."),
                ),
              ),
            ),
          )),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(38.0)),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                onTap: () {},
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: IconButton(
                      onPressed: (){
                        cubit.changeResponseState();
                      },
                      icon: Icon(
                        Icons.search,
                        size: 26,
                      ),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  getTimeDateUI(startDate, endDate) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, bottom: 16),
      child: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Choose Date",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${DateFormat('dd, MMM').format(startDate)} - ${DateFormat('dd, MMM').format(endDate)}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              width: 1,
              height: 42,
              color: Colors.black,
            ),
          ),
          const Expanded(
              child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Number of Rooms',
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '1 Room - 2 Adults',
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class ContestTabHeader extends SliverPersistentHeaderDelegate {
  final Widget searchUI;

  ContestTabHeader(this.searchUI);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchUI;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
