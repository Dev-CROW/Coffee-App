import 'dart:convert';

import 'package:coffe_app/layout/states.dart';
import 'package:coffe_app/model/shop_login_model.dart';
import 'package:coffe_app/shared/components/constants.dart';
import 'package:coffe_app/shared/end_points.dart';
import 'package:coffe_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);


  ShopLoginModel userModel;

  void getUserData()
  {

    DioHelper.getData(url: PROFILE, token: token).then((value)
    {
      userModel = ShopLoginModel.fromJson(value.data);

      emit(ShopSuccessGetUserDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetUserDataState());
    });
  }


  ShopLoginModel updateModel;

  void userUpdate({
    @required String email,
    @required String phone,
    @required String name,
  }){
    emit(ShopLoadingUpdateDataState());
    DioHelper.putData(url: UPDATE, token: token, data: {
      'email': email,
      'phone': phone,
      'name': name,
    },

    ).then((value) {
      print(value.data);
      updateModel = ShopLoginModel.fromJson(value.data);

      emit(ShopSuccessUpdateProfileState(updateModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorUpdateProfileState());
    });
  }

}