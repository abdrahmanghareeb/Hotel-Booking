import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/Controllers/Api_Services.dart';
import 'package:meta/meta.dart';

import '../Models/hotel_list_model.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelInitial());

  static HotelCubit get(context) => BlocProvider.of(context);

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  List<HotelListData> hotelList = HotelListData.dummyList;

  void changeResponseState() {
    emit(loadingState());
    ApiServices.getResponse().then((value) {
      emit(getSuccessfulResponseState());
      // print(
      //     "state emitted successfully, the value is : ${value.titleTxt + " " + value.subTxt + " " + value.imagePath + " " + value.reviews.toString() + " " + value.rating.toString() + " " + value.perNight.toString()}");
    }).onError((error, stackTrace) {
      emit(errorGettingState());
      print("$error");
    });
  }
}
