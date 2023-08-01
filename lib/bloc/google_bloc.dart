import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:googletranslate/repositry/api/news-api.dart';
import 'package:meta/meta.dart';

import '../repositry/modelclass/Googlemodel.dart';

part 'google_event.dart';
part 'google_state.dart';

class GoogleBloc extends Bloc<GoogleEvent, GoogleState> {
  late Googlemodel googlemodel;
  Googleapi googleapi=Googleapi();
  GoogleBloc() : super(GoogleInitial()) {

    on<GoogleEvent>((event, emit)async {
      emit(GoogleLoading());
      try{

        googlemodel = await googleapi.postGooglemodel();
        emit(GoogleLoaded());
      } catch(e){
        print(e);
        emit(GoogleError());}
    });

  }
}
