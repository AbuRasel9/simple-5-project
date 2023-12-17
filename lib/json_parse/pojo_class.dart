class PojoClass {
  String? status;
  List<ClientList>? clientList;

  PojoClass({this.status, this.clientList});

  PojoClass.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['clientList'] != null) {
      clientList = <ClientList>[];
      json['clientList'].forEach((v) {
        clientList!.add(new ClientList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.clientList != null) {
      data['clientList'] = this.clientList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClientList {
  String? clientId;
  String? clientName;
  String? marketName;
  String? areaId;
  String? areaName;
  String? thana;
  String? address;
  String? outstanding;

  ClientList(
      {this.clientId,
        this.clientName,
        this.marketName,
        this.areaId,
        this.areaName,
        this.thana,
        this.address,
        this.outstanding});

  ClientList.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    clientName = json['client_name'];
    marketName = json['market_name'];
    areaId = json['area_id'];
    areaName = json['area_name'];
    thana = json['thana'];
    address = json['address'];
    outstanding = json['outstanding'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['client_id'] = this.clientId;
    data['client_name'] = this.clientName;
    data['market_name'] = this.marketName;
    data['area_id'] = this.areaId;
    data['area_name'] = this.areaName;
    data['thana'] = this.thana;
    data['address'] = this.address;
    data['outstanding'] = this.outstanding;
    return data;
  }
}