class Station {
  final dynamic locations;
  final dynamic name;
  final dynamic type;
  final dynamic parent;
  final dynamic disassembledName;
  final dynamic coord;

  const Station({
    required this.locations,
    required this.name,
    required this.type,
    required this.parent,
    required this.disassembledName,
    required this.coord,
  });

  factory Station.fromJson(Map<dynamic, dynamic> json) => Station(
        locations: json['locations']?? '',
        name: json['name']?? '',
        type: json['type']?? '',
        parent: json['parent']?? '',
        disassembledName: json['disassembledName']?? '',
        coord: json['coord']?? '',
      );

  Map<dynamic, dynamic> toJson() => {
        'locations': locations,
        'name': name,
        'type': type,
        'parent': parent,
        'disassembledName': disassembledName,
        'coord': coord,
      };
}
