import 'package:coffe_app/constant.dart';
import 'package:coffe_app/layout/bloc/coffe_bloc.dart';
import 'package:coffe_app/layout/coffee_concept_home.dart';

import 'CoffeeConceptList.dart';
import '../model/coffee.dart';
import 'package:flutter/material.dart';

import 'home/home_screen.dart';

class CoffeeConceptDetails extends StatefulWidget {
  const CoffeeConceptDetails({Key key, this.coffee}) : super(key: key);
  final Coffee coffee;


  @override
  _CoffeeConceptDetailsState createState() => _CoffeeConceptDetailsState();
}

class _CoffeeConceptDetailsState extends State<CoffeeConceptDetails> {

  int addNumb = 0;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Order Sent Done!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Your Order Has Been Sent To Us !'),
                Text('Would you like to Continue?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
               Navigator.of(context).pop();

              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final bloc = CoffeeProvider
        .of(context)
        .bloc;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        actions: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              IconButton(
                onPressed: (){},
                  icon: Icon(Icons.shopping_cart,color: mPrimaryColor,)),
            CircleAvatar(
              child: Text("0",style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,radius:8.0 ,)
            ],
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
            child: Hero(
              tag: widget.coffee.name,
              child: Material(
                color: Colors.white,
                child: Text(
                  widget.coffee.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Padding(
            padding: const EdgeInsetsDirectional.only(start:150.0),
            child: InkWell(
              onTap: (){
                _showMyDialog();
              },
              child: CircleAvatar(
                  child: Icon(Icons.add,color: Colors.white,),
                backgroundColor: mPrimaryColor,
                radius: 20.0,
              ),
            ),
          )
         ,
          const SizedBox(height: 30.0,),
          SizedBox(height: size.height * 0.4,
            child: Stack(
              children: [
                Positioned.fill(child: Hero(
                  tag: "text_${widget.coffee.image}",
                  child: Image.asset(
                    widget.coffee.image, fit: BoxFit.fitHeight,),
                ),),
                Positioned(left: size.width * 0.05,
                  bottom: 0,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1.0, end: 0.0,),
                    builder: (context, value, child) {
                      return Transform.translate(
                          offset: Offset(-100 * value, 240 * value),
                          child: child);
                    },
                    duration: const Duration(milliseconds: 500),
                    child: Text('\$${widget.coffee.price.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 10,
                              spreadRadius: 20,
                            )
                          ]
                      ),),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Column(
                 children: [
                   Image(
                     height: 40.0,
                     width: 40.0,
                     image: AssetImage("assets/images/taza_s.png"),
                   ),
                   Text("S",style:TextStyle(color: Colors.black,),)
                 ],
               ),
                SizedBox(width: 20.0,),
                Column(
                  children: [
                    Image(
                      height: 60.0,
                      width: 60.0,
                      image: AssetImage("assets/images/taza_m.png"),
                    ),
                    Text("M",style:TextStyle(color: Colors.black,),)
                  ],
                ),
                SizedBox(width: 20.0,),
                Column(

                  children: [
                    Image(
                      height: 80.0,
                      width: 80.0,
                      image: AssetImage("assets/images/taza_l.png"),
                    ),
                    Text("L",style:TextStyle(color: Colors.black,))
                  ],
                ),// Spacer(),

              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (addNumb >= 1) addNumb--;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: mPrimaryColor,
                      radius: 20.0,
                      child: Text("-",
                        style: TextStyle(fontSize: 30.0, color: Colors.white),),
                    ),
                  ),

                  Spacer(),
                  TextButton(
                      child: Text("$addNumb",
                    style: TextStyle(color: Colors.black54, fontSize: 40.0),)),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (addNumb >= 0) addNumb++;
                        if (addNumb > 10) addNumb = 9;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: mPrimaryColor,
                      radius: 20.0,
                      child: Text("+",
                        style: TextStyle(fontSize: 30.0, color: Colors.white),),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 30.0,
                    width: 100.0,
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          _showMyDialog();
                        });
                      },
                      color: mPrimaryColor,
                      child: Center(child: Text("OrderNow!", style: TextStyle(
                          color: Colors.white,fontSize: 12.0),),),),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
