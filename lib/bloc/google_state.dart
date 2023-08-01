part of 'google_bloc.dart';

@immutable
abstract class GoogleState {}

class GoogleInitial extends GoogleState {}
class GoogleLoading extends GoogleState {}
class GoogleLoaded extends GoogleState {}
class GoogleError extends GoogleState{}

