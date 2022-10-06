class PlantsModel {
  PlantsModel({
    required this.type,
    required this.message,
    required this.data,
  });
  late final String type;
  late final String message;
  late final List<Data> data;

  PlantsModel.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

}

class Data {
  Data({
    required this.plantId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.waterCapacity,
    required this.sunLight,
    required this.temperature,
  });
  late final String plantId;
  late final String name;
  late final String description;
  late final String imageUrl;
  late final int waterCapacity;
  late final int sunLight;
  late final int temperature;

  Data.fromJson(Map<String, dynamic> json){
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }


}