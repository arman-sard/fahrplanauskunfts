// ignore_for_file: deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:async';
import 'package:fahrplanauskunft_app/api/station_api.dart';
import 'package:fahrplanauskunft_app/main.dart';
import 'package:fahrplanauskunft_app/model/station.dart';
import 'package:fahrplanauskunft_app/page/location_details_page.dart';
import 'package:fahrplanauskunft_app/provider/location_details_provider.dart';
import 'package:fahrplanauskunft_app/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class FilterApiListPage extends StatefulWidget {
  const FilterApiListPage({Key? key}) : super(key: key);

  @override
  FilterApiListPageState createState() => FilterApiListPageState();
}

class FilterApiListPageState extends State<FilterApiListPage> {
  final controller = TextEditingController();
  List<Station> stations = [];
  String query = '';
  Timer? debouncer;
  final style = const TextStyle(fontSize: 13);
  String validation = '';
  double fontSize = 0;
  double hightSize = 0;
  String destinationAdress = '';
  String destinationCity = '';
  String destinationType = '';
  String destinationParentType = '';
  String disassembledName = '';
  dynamic coord = '';
  double animHight = 0;

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }
    debouncer = Timer(duration, callback);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
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
            children: <Widget>[
              buildSearch(),
              Padding(
                padding: EdgeInsets.only(left: hightSize, top: hightSize),
                child: Text(validation, style: TextStyle(fontSize: fontSize)),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: stations.length,
                  itemBuilder: (context, index) {
                    final station = stations[index];
                    return buildStation(station);
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Zielort eingeben...',
        onChanged: searchStation,
      );

  Future searchStation(String query) async => debounce(
        () async {
          final stations = await StationApi.getStations(query);

          if (!mounted) return;

          setState(
            () {
              this.query = query;
              query == '' ? this.stations = [] : this.stations = stations;

              if (query.isNotEmpty && stations.isEmpty) {
                validation = 'Keine passenden Treffer gefunden';
                fontSize = 14;
                hightSize = 22;
              } else {
                validation = '';
                fontSize = 0;
                hightSize = 0;
              }
            },
          );
        },
      );

  Widget buildStation(Station station) => ListTile(
        title: Container(
          padding: const EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  setState(() {
                    context.read<LocationDetails>().getData(
                          station.name,
                          station.parent['name'],
                          station.type,
                          station.parent['type'],
                          station.disassembledName,
                          station.coord.toString(),
                        );

                    Navigator.of(context).push(
                      PageTransition(
                        child: Locationdetails(),
                        type: PageTransitionType.bottomToTop,
                        duration: Duration(milliseconds: 400),
                        reverseDuration: Duration(milliseconds: 400),
                      ),
                    );
                  });
                },
                child: Text(station.name, style: style),
              ),
            ],
          ),
        ),
      );
}
