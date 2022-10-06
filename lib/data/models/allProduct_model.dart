class AllProductModel {
  AllProductModel({
    required this.type,
    required this.message,
    required this.data,
  });
  late final String type;
  late final String message;
  late final List<Data> data;

  AllProductModel.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

}

class Data {
  Data({
    required this.productId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.price,
    required this.available,
    this.seed,
    this.plant,
    this.tool,
    required  this.quantity
  });
  late final String productId;
  late final String name;
  late final String description;
  late final String imageUrl;
  late final String type;
  late final int price;
  late final bool available;
  late final Seed? seed;
  late final Plant? plant;
  late final Tool? tool;
  late int quantity;

  Data.fromJson(Map<String, dynamic> json){
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    price = json['price'];
    available = json['available'];
    seed = null;
    plant = null;
    tool = null;
    quantity=1;
  }

}

class Seed {
  Seed({
    required this.seedId,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
  late final String seedId;
  late final String name;
  late final String description;
  late final String imageUrl;

  Seed.fromJson(Map<String, dynamic> json){
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

}

class Plant {
  Plant({
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

  Plant.fromJson(Map<String, dynamic> json){
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

}

class Tool {
  Tool({
    required this.toolId,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
  late final String toolId;
  late final String name;
  late final String description;
  late final String imageUrl;

  Tool.fromJson(Map<String, dynamic> json){
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }


}