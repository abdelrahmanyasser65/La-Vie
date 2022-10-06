class SeedsModel {
  SeedsModel({
    required this.type,
    required this.message,
    required this.data,
  });
  late final String type;
  late final String message;
  late final List<Data> data;

  SeedsModel.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }


}

class Data {
  Data({
    required this.seedId,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
  late final String seedId;
  late final String name;
  late final String description;
  late final String imageUrl;

  Data.fromJson(Map<String, dynamic> json){
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }


}