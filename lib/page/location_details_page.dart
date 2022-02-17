// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:fahrplanauskunft_app/main.dart';
import 'package:fahrplanauskunft_app/provider/location_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Locationdetails extends StatefulWidget {
  const Locationdetails({Key? key}) : super(key: key);

  @override
  LocationdetailsState createState() => LocationdetailsState();
}

String destinationAdress = '';
String destinationCity = '';
String destinationType = '';
String destinationParentType = '';
String disassembledName = '';
dynamic coord = '';



class LocationdetailsState extends State<Locationdetails> {

  void initState() {
  destinationAdress = context.read<LocationDetails>().destinationAdress;
  destinationCity = context.read<LocationDetails>().destinationCity;
  destinationType = context.read<LocationDetails>().destinationType;
  destinationParentType = context.read<LocationDetails>().destinationParentType;
  disassembledName = context.read<LocationDetails>().disassembledName;
  coord = context.read<LocationDetails>().coord;
  super.initState();
}

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey.shade700,
          ),
          title: const Text(
            MyApp.title,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[300],
          shadowColor: Colors.transparent,
        ),
        backgroundColor: Colors.grey[300],
        body: Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 23),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(33),
            color: Colors.grey[300],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                offset: const Offset(4, 4),
                blurRadius: 15,
                spreadRadius: 1,
              ),
              const BoxShadow(
                color: Colors.white,
                offset: Offset(-4, -4),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  color: Colors.grey[300],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      offset: const Offset(4, 4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Location details:'),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(destinationAdress),
                    SizedBox(height: 5),
                    Text(destinationCity),
                    SizedBox(height: 5),
                    Text(destinationType),
                    SizedBox(height: 5),
                    Text(destinationParentType),
                    SizedBox(height: 5),
                    Text(disassembledName),
                    SizedBox(height: 5),
                    Text(coord),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
