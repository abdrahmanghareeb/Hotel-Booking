part of 'hotel_cubit.dart';

@immutable
sealed class HotelState {}

final class HotelInitial extends HotelState {}
final class getSuccessfulResponseState extends HotelState {}
final class loadingState extends HotelState {}
final class searchState extends HotelState {}
final class errorGettingState extends HotelState {}
