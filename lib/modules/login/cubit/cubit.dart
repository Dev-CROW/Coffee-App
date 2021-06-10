import 'package:bloc/bloc.dart';
import 'package:coffe_app/model/shop_login_model.dart';
import 'package:coffe_app/modules/login/cubit/states.dart';
import 'package:coffe_app/shared/end_points.dart';
import 'package:coffe_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{
  ShopLoginCubit() : super(ShopLoginInitialState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);
  ShopLoginModel loginModel;
  void userLogin({
  @required String email,
  @required String password,
}){
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }




  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility(){
    isPassword = !isPassword;
    isPassword? suffix = Icons.visibility_outlined : suffix = Icons.visibility_off_outlined;
    emit(ShopLoginVisibilityState());

  }

}