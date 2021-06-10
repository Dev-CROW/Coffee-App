import 'package:coffe_app/model/shop_login_model.dart';

abstract class ShopStates {}

class ShopInitialState extends ShopStates {}


class ShopSuccessGetUserDataState extends ShopStates {

}

class ShopErrorGetUserDataState extends ShopStates {}

class ShopLoadingUpdateDataState extends ShopStates {}

class ShopSuccessUpdateProfileState extends ShopStates {
  final ShopLoginModel updateModel;

  ShopSuccessUpdateProfileState(this.updateModel);

}

class ShopErrorUpdateProfileState extends ShopStates {}
