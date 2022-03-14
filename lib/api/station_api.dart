import 'dart:convert';
import 'package:fahrplanauskunft_app/model/station.dart';
import 'package:http/http.dart' as http;

class StationApi {
  static Future<List<Station>> getStations(String query) async {
    try {
      final url = Uri.parse('https://mvvvip1.defas-fgi.de/mvv/XML_STOPFINDER_REQUEST?language=de&outputFormat=RapidJSON&type_sf=any&name_sf={Suchtext}');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes));
        List<dynamic> stations = data["locations"];

        return stations.map((json) => Station.fromJson(json)).where((station) {
          final nameLower = station.name.toLowerCase();
          final searchLower = query.toLowerCase();

          return nameLower.contains(searchLower);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Could not load the data from api');
    }
  }
}
