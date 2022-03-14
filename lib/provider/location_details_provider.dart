import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationDetails with ChangeNotifier {
  String _destinationAdress = '';
  String _destinationCity = '';
  String _destinationType = '';
  String _destinationParentType = '';
  String _disassembledName = '';
  String _coord = '';

  String get destinationAdress => _destinationAdress;
  String get destinationCity => _destinationCity;
  String get destinationType => _destinationType;
  String get destinationParentType => _destinationParentType;
  String get disassembledName => _disassembledName;
  String get coord => _coord;

  setData(
      String destinationAdress,
      String destinationCity,
      String destinationType,
      String destinationParentType,
      String disassembledName,
      String coord) {
    _destinationAdress = destinationAdress;
    _destinationCity = destinationCity;
    _destinationType = destinationType;
    _destinationParentType = destinationParentType;
    _disassembledName = disassembledName;
    _coord = coord;
    return;
  }
}
