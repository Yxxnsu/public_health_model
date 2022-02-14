class InspectionModel {
  InspectionModel({
    required this.status,
    required this.statusSeq,
    required this.message,
    required this.resultList,
  });
  final String status;
  final int statusSeq;
  final String message;
  final List<ResultList>? resultList;

  factory InspectionModel.fromJson(Map<String, dynamic> json) => InspectionModel(
    status: json["Status"],
    statusSeq: json["StatusSeq"],
    message: json["Message"],
    resultList: json["ResultList"] == null
    ? null
    : List<ResultList>.from(json["ResultList"].map((x) => ResultList.fromJson(x))),
  );

  Map<String, dynamic> toMap() => {
    "Status": status,
    "StatusSeq": statusSeq,
    "Message": message,
    "ResultList": resultList == null
    ? null
    : List<dynamic>.from(resultList!.map((x) => x.toMap())),
  };
}

class ResultList {
  ResultList({
    required this.year,
    required this.checkUpDate,
    required this.code,
    required this.location,
    required this.description,
    required this.inspections,
  });
  final String year;
  final String checkUpDate;
  final String code;
  final String location;
  final String description;
  final List<Inspection>? inspections;

  factory ResultList.fromJson(Map<String, dynamic> json) => ResultList(
    year: json["Year"] ?? '',
    checkUpDate: json["CheckUpDate"] ?? '',
    code: json["Code"] ?? '',
    location: json["Location"] ?? '',
    description: json["Description"] ?? '',
    inspections: json["Inspections"] == null
    ? null
    : List<Inspection>.from(json["Inspections"].map((x) => Inspection.fromJson(x))),
  );

  Map<String, dynamic> toMap() => {
    "Year": year,
    "CheckUpDate": checkUpDate,
    "Code": code,
    "Location": location,
    "Description": description,
    "Inspections": inspections == null
      ? null
      :List<dynamic>.from(inspections!.map((x) => x.toMap())),
  };
}

class Inspection {
  Inspection({
    required this.gubun,
    required this.illnesses,
  });
  final String gubun;
  final List<Illness>? illnesses;

  factory Inspection.fromJson(Map<String, dynamic> json) => Inspection(
    gubun: json["Gubun"] ?? '',
    illnesses: json["Illnesses"] == null
    ? null
    : List<Illness>.from(json["Illnesses"].map((x) => Illness.fromJson(x))),
  );

  Map<String, dynamic> toMap() => {
    "Gubun": gubun,
    "Illnesses": illnesses == null 
    ? null
    : List<dynamic>.from(illnesses!.map((x) => x.toMap())),
  };
}

class Illness {
  Illness({
    required this.name,
    required this.items,
  });
  final String name;
  final List<Item>? items;

  factory Illness.fromJson(Map<String, dynamic> json) => Illness(
    name: json["Name"] ?? '',
    items: json["Items"] == null
    ? null
    : List<Item>.from(json["Items"].map((x) => Item.fromJson(x))),
  );
  Map<String, dynamic> toMap() => {
    "Name": name,
    "Items": items == null
    ? null
    : List<dynamic>.from(items!.map((x) => x.toMap())),
  };
}

class Item {
  Item({
    required this.name,
    required this.value,
    required this.itemReferences,
  });
  final String name;
  final String value;
  final List<ItemReference>? itemReferences;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["Name"] ?? '',
    value: json["Value"] ?? '',
    itemReferences: json["ItemReferences"]== null
    ? null
    : List<ItemReference>.from(json["ItemReferences"].map((x) => ItemReference.fromJson(x))),
  );

  Map<String, dynamic> toMap() => {
    "Name": name,
    "Value": value,
    "ItemReferences": itemReferences == null
    ? null
    : List<dynamic>.from(itemReferences!.map((x) => x.toMap())),
  };
}

class ItemReference {
  ItemReference({
    required this.name,
    required this.value,
  });
  String name;
  String value;

  factory ItemReference.fromJson(Map<String, dynamic> json) => ItemReference(
    name: json["Name"] ?? '',
    value: json["Value"] ?? '',
  );
  
  Map<String, dynamic> toMap() => {
    "Name": name,
    "Value": value,
  };
}