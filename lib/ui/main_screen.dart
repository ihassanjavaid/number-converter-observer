import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:number_converter_observer/backend/converter.dart';
import 'package:number_converter_observer/observer/observer.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Converter _converter = Converter();

  String decimalStr = '';
  String binaryStr = '';
  String octalStr = '';
  String hexaStr = '';

  TextEditingController _decimalController = TextEditingController();
  TextEditingController _binaryController = TextEditingController();
  TextEditingController _octalController = TextEditingController();
  TextEditingController _hexaController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Number Converter',
          style: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Decimal
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 22.0),
                child: Text(
                  'DECIMAL NUMBER: A decimal number should only have digits from 0-9',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextFormField(
                controller: _decimalController,
                onChanged: (val) {
                  if (val.isNotEmpty) convFromDecimal(context, val);
                },
                decoration: InputDecoration(
                  labelText: 'Decimal Number',
                  hasFloatingPlaceholder: true,
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // Binary
              Padding(
                padding: const EdgeInsets.only(bottom: 22.0),
                child: Text(
                  'BINARY NUMBER: A binary number should only consist of zeros and ones',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextFormField(
                controller: _binaryController,
                onChanged: (val) {
                  if (val.isNotEmpty) convFromBinary(context, val);
                },
                decoration: InputDecoration(
                  labelText: 'Binary Number',
                  hasFloatingPlaceholder: true,
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // Octal
              Padding(
                padding: const EdgeInsets.only(bottom: 22.0),
                child: Text(
                  'OCTAL NUMBER: An octal number should only have digits ranging from 0-7',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextFormField(
                controller: _octalController,
                onChanged: (val) {
                  convFromOctal(context, val);
                },
                decoration: InputDecoration(
                  labelText: 'Octal Number',
                  hasFloatingPlaceholder: true,
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              // Hexadecimal
              Padding(
                padding: const EdgeInsets.only(bottom: 22.0),
                child: Text(
                  'HEXADECIMAL: A hexadecimal number should\nonly have digits from 0-9 and alphabets from A-F',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextFormField(
                controller: _hexaController,
                onChanged: (val) {
                  convFromHexa(context, val);
                },
                decoration: InputDecoration(
                  labelText: 'Hexadecimal Number',
                  hasFloatingPlaceholder: true,
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  convFromDecimal(context, val){
    Provider.of<Observer>(context, listen: false).updateDecimalStr(val);
    double value = double.parse(val);

    binaryStr = _converter.decimalToBinary(value);
    Provider.of<Observer>(context, listen: false).updateBinaryStr(binaryStr);
    print('Binary: $binaryStr');

    octalStr = _converter.decimalToOctal(value);
    Provider.of<Observer>(context, listen: false).updateOctalStr(octalStr);
    print('Octal: $octalStr');

    hexaStr = _converter.decimalToHexa(value);
    Provider.of<Observer>(context, listen: false).updateHexadecimalStr(hexaStr);
    print('Hexa: $hexaStr');

    updateControllers(context);
  }

  convFromBinary(context, val){
    Provider.of<Observer>(context, listen: false).updateBinaryStr(val);
    decimalStr = _converter.binaryToDecimal(val);
    Provider.of<Observer>(context, listen: false).updateDecimalStr(decimalStr);

    octalStr = _converter.decimalToOctal(double.parse(decimalStr));
    Provider.of<Observer>(context, listen: false).updateOctalStr(octalStr);
    print('Octal: $octalStr');

    hexaStr = _converter.decimalToHexa(double.parse(decimalStr));
    Provider.of<Observer>(context, listen: false).updateHexadecimalStr(hexaStr);
    print('Hexa: $hexaStr');

    updateControllers(context);
  }

  convFromOctal(context, val){
    Provider.of<Observer>(context, listen: false).updateOctalStr(val);
    decimalStr = _converter.octalToDecimal(val);
    Provider.of<Observer>(context, listen: false).updateDecimalStr(decimalStr);

    binaryStr = _converter.decimalToBinary(double.parse(decimalStr));
    Provider.of<Observer>(context, listen: false).updateBinaryStr(binaryStr);
    print('Binary: $binaryStr');

    hexaStr = _converter.decimalToHexa(double.parse(decimalStr));
    Provider.of<Observer>(context, listen: false).updateHexadecimalStr(hexaStr);
    print('Hexa: $hexaStr');

    updateControllers(context);
  }

  convFromHexa(context, val){
    Provider.of<Observer>(context, listen: false).updateHexadecimalStr(val);
    decimalStr = _converter.hexaToDecimal(val);

    binaryStr = _converter.decimalToBinary(double.parse(decimalStr));
    Provider.of<Observer>(context, listen: false).updateBinaryStr(binaryStr);
    print('Binary: $binaryStr');

    octalStr = _converter.decimalToOctal(double.parse(decimalStr));
    Provider.of<Observer>(context, listen: false).updateOctalStr(octalStr);
    print('Octal: $octalStr');

    updateControllers(context);
  }

  updateControllers(context){
    _decimalController.text = Provider.of<Observer>(context, listen: false).decimalObserver;
    _binaryController.text = Provider.of<Observer>(context, listen: false).binaryObserver;
    _octalController.text = Provider.of<Observer>(context, listen: false).octalObserver;
    _hexaController.text = Provider.of<Observer>(context, listen: false).hexadecimalObserver;
  }
}
