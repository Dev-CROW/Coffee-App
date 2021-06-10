import 'package:flutter/cupertino.dart';
const _initialPage = 8.0;

class CoffeeBloc{
  final pageCoffeeController = PageController(
    viewportFraction: 0.35,
    initialPage: _initialPage.toInt(),
  );
  final pageTextController = PageController(initialPage: _initialPage.toInt());

  final currentPage = ValueNotifier<double>(_initialPage);
  final textpage = ValueNotifier<double>(_initialPage);
   int plusCounter;
  final minusCounter = ValueNotifier<double>(_initialPage);

  void plus(int index){
    index = plusCounter++;
  }
  void init(){
    pageCoffeeController.addListener(_coffeeScrollListener);
    pageTextController.addListener(_textScrollListener);

  }
  void _coffeeScrollListener() {
    currentPage.value = pageCoffeeController.page;
  }


  void _textScrollListener(){
    textpage.value = pageTextController.page;
  }

  void dispose(){
    pageCoffeeController.removeListener(_coffeeScrollListener);
    pageTextController.removeListener(_textScrollListener);
    pageCoffeeController.dispose();
    pageTextController.dispose();

  }
}
class CoffeeProvider extends InheritedWidget{
  final CoffeeBloc bloc;

  CoffeeProvider({@required this.bloc,Widget child}): super(child: child);
    static CoffeeProvider of(BuildContext context)=> context.findAncestorWidgetOfExactType<CoffeeProvider>();
  @override
  bool updateShouldNotify(covariant CoffeeProvider oldWidget) => false;
}