class ToolsModel {
  ToolsModel({
    required this.type,
    required this.message,
    required this.data,
  });
  late final String type;
  late final String message;
  late final List<Data> data;

  ToolsModel.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

}

class Data {
  Data({
    required this.toolId,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
  late final String toolId;
  late final String name;
  late final String description;
  late final String imageUrl;

  Data.fromJson(Map<String, dynamic> json){
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

}