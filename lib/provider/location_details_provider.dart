import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationDetails with ChangeNotifier {
  dynamic _destinationAdress = '';
  dynamic _destinationCity = '';
  dynamic _destinationType = '';
  dynamic _destinationParentType = '';
  dynamic _disassembledName = '';
  dynamic _coord = '';

  dynamic get destinationAdress => _destinationAdress;
  dynamic get destinationCity => _destinationCity;
  dynamic get destinationType => _destinationType;
  dynamic get destinationParentType => _destinationParentType;
  dynamic get disassembledName => _disassembledName;
  dynamic get coord => _coord;

  getData(
      dynamic destinationAdress,
      dynamic destinationCity,
      dynamic destinationType,
      dynamic destinationParentType,
      dynamic disassembledName,
      dynamic coord) {
    _destinationAdress = destinationAdress;
    _destinationCity = destinationCity;
    _destinationType = destinationType;
    _destinationParentType = destinationParentType;
    _disassembledName = disassembledName;
    _coord = coord;
    return;
  }
}
