import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FlipCardState> _cardkey = GlobalKey<FlipCardState>();

  _renderBackground() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
    );
  }

  _imageChipFront() {
    return Container(
      child: Stack(
        children: [
          Positioned(
            top: 80,
            right: 70,
            child: Image.asset(
              'images/chipFront.jpg',
              width: 550,
              height: 30,
              // fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  _imageFront() {
    return
     Container(
       child: Stack(
         children: [
           Positioned(
             top: 16.8,
             left: 25.9,
             child:
             Image.asset(
               'images/front.jpg',
              width: 503,
               height: 187,
            ),
          ),
        ],
      ),
    );
  }

  _creditNumber() {
    return Container(
      child: Stack(
        children: [
          Positioned(
              left: 20,
              bottom: 70,
              child: Text(
                '5123   5214   2523   5684',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }

  _creditMonth() {
    return Container(
      child: Stack(
        children: [
          Positioned(
              left: 50,
              bottom: 48,
              child: Text(
                '  12  /  28\n'
                'Mês/Ano',
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400),
              ))
        ],
      ),
    );
  }

  _creditName() {
    return Container(
      child: Stack(
        children: [
          Positioned(
              left: 20,
              bottom: 30,
              child: Text(
                'VICTOR ANTUNES',
                style: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: 5,
                    fontWeight: FontWeight.w400),
              ))
        ],
      ),
    );
  }

  _creditAgency() {
    return Container(
      child: Stack(
        children: [
          Positioned(
              left: 30,
              bottom: 10,
              child: Text(
                '1234-5   12.123-4',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
              ))
        ],
      ),
    );
  }

  _renderFront() {
    //Parte da Frente
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 205,
            decoration: BoxDecoration(
                color: Color.fromRGBO(105, 73, 136, 1),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Container(
              child: Stack(
                children: [
                  _imageChipFront(),
                  _imageFront(),
                  _creditName(),
                  _creditMonth(),
                  _creditNumber(),
                  _creditAgency(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _backCardReadLine() {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 30),
      height: 40,
      decoration: BoxDecoration(color: Colors.black),
    );
  }

  _imageBackCard() {
    return Container(
      child: Stack(
        children: [
          Positioned(
            top: 145,
            left: 295,
            child: Image.asset(
              'images/pobreCard.png',
              width: 80,

              // fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  _backCardReadLineSign() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 80, 0, 15),
      width: 241,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(24)),
          color: Colors.white),
    );
  }

  _backCardCvv() {
    return Container(
      child: Stack(
        children: [
          Positioned(
              top: 82,
              right: 110,
              bottom: 10,
              child: Text(
                '123',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    backgroundColor: Colors.white),
              )),
        ],
      ),
    );
  }

  _renderBack() {
    //Parte de trás do cartão
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 205,
            decoration: BoxDecoration(
                color: Color.fromRGBO(105, 73, 136, 1),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Container(
              alignment: AlignmentDirectional.bottomStart,
              child: Stack(
                children: [
                  _imageBackCard(),
                  _backCardReadLine(),
                  _backCardReadLineSign(),
                  _backCardCvv(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _renderCard(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.fromLTRB(10, 50.5, 10.1, 548.5),
      color: Color.fromRGBO(150, 73, 136, 0.1),
      child: FlipCard(
        key: _cardkey,
        flipOnTouch: true,
        direction: FlipDirection.HORIZONTAL,
        speed: 400,
        front: _renderFront(),
        back: _renderBack(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Cartão Virtual'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _renderBackground(),
          Column(
            children: [
              Expanded(
                child: _renderCard(context),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _cardkey.currentState.toggleCard();
        },
        tooltip: 'Virar Cartão',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
