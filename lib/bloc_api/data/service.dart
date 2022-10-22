import 'dart:convert';

Service serviceFromJson(String url)=>Service.fromJson(json.decode(url));
//String serviceToJson(Service data)=>json.encode(data.toJson());
class Service {
  Service({
    required this.data,
    required this.links,
    required this.meta,
  });

  final List<Datum> data;
  final Links? links;
  final Meta? meta;

  factory Service.fromJson(Map<String, dynamic> json){
    return Service(
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      links: json["links"] == null ? null : Links.fromJson(json["links"]),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.info,
    required this.image,
    required this.price,
    required this.owner,
    required this.time,
  });

  final int? id;
  final String? name;
  final String? info;
  final String? image;
  final String? price;
  final String? owner;
  final String? time;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      id: json["id"],
      name: json["name"],
      info: json["info"],
      image: json["image"],
      price: json["price"],
      owner: json["owner"],
      time: json["time"],
    );
  }

}

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  final String? first;
  final String? last;
  final dynamic prev;
  final String? next;

  factory Links.fromJson(Map<String, dynamic> json){
    return Links(
      first: json["first"],
      last: json["last"],
      prev: json["prev"],
      next: json["next"],
    );
  }

}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<Link> links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      currentPage: json["current_page"],
      from: json["from"],
      lastPage: json["last_page"],
      links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
      path: json["path"],
      perPage: json["per_page"],
      to: json["to"],
      total: json["total"],
    );
  }

}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  final String? url;
  final String? label;
  final bool? active;

  factory Link.fromJson(Map<String, dynamic> json){
    return Link(
      url: json["url"],
      label: json["label"],
      active: json["active"],
    );
  }

}
