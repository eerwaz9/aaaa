import 'dart:ffi';

class User {
  int id;
  String first_name;
  String laste_name;
  String canter;
  String mobile_user;
  double number_card;
  String password_user;

  User(
      {this.id,
      this.first_name,
      this.laste_name,
      this.canter,
      this.mobile_user,
      this.number_card,
      this.password_user});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['first_name'];
    laste_name = json['laste_name'];
    canter = json['canter'];
    mobile_user = json['mobile_user'];
    number_card = json['number_card'];
    password_user = json['password_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.first_name;
    data['laste_name'] = this.laste_name;
    data['canter'] = this.canter;
    data['mobile_user'] = this.mobile_user;
    data['number_card'] = this.number_card;
    data['password_user'] = this.password_user;
    return data;
  }
}

////////////////////////////////////////////////////////////////////////////////
// class Doors {
//   int id;
//   String name_door;
//   String address_door;
//   double Meridians_door;
//   double latitudes_door;
//   String image_door;
//   double number_drivery;
//
//   Doors(
//       {this.id,
//       this.name_door,
//       this.address_door,
//       this.Meridians_door,
//       this.latitudes_door,
//       this.image_door,
//       this.number_drivery});
//
//   Doors.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name_door = json['name_door'];
//     address_door = json['address_door'];
//     Meridians_door = json['Meridians_door'];
//     latitudes_door = json['latitudes_door'];
//     image_door = json['  image_door;'];
//     number_drivery = json['number_drivery'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name_door'] = this.name_door;
//     data['address_door'] = this.address_door;
//     data['Meridians_door'] = this.Meridians_door;
//     data['latitudes_door'] = this.latitudes_door;
//     data['image_door'] = this.image_door;
//     data['number_drivery'] = this.number_drivery;
//     return data;
//   }
// }

////////////////////////////////////////////////////////////////////////////////
class Chair {
  int id;
  String chiar_number;
  String name_door;
  String address_door;
  double Meridians_door;
  double latitudes_door;
  String image_door;
  double number_drivery;
  Chair(
      {this.id,
      this.chiar_number,
      this.name_door,
      this.address_door,
      this.Meridians_door,
      this.latitudes_door,
      this.image_door,
      this.number_drivery});
  Chair.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chiar_number = json['chiar_number'];
    name_door = json['name_door'];
    address_door = json['address_door'];
    Meridians_door = json['Meridians_door'];
    latitudes_door = json['latitudes_door'];
    image_door = json['  image_door;'];
    number_drivery = json['number_drivery'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chiar_number'] = this.chiar_number;
    data['name_door'] = this.name_door;
    data['address_door'] = this.address_door;
    data['Meridians_door'] = this.Meridians_door;
    data['latitudes_door'] = this.latitudes_door;
    data['image_door'] = this.image_door;
    data['number_drivery'] = this.number_drivery;
    return data;
  }
}

///////////////////////////////////////////////////////////////////
class Request {
  int id;
  int chair_request;
  String date_requste;
  String when_came;
  double Meridians_requst;
  double latitudes_request;
  Bool Managers_accept_value;
  String state_request;
  Request.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chair_request = json[' chair_request'];
    date_requste = json[' date_requste'];
    when_came = json[' when_came'];
    Meridians_requst = json['Meridians_requst '];
    latitudes_request = json[' latitudes_request'];
    Managers_accept_value = json['Managers_accept_value '];
    state_request = json['state_request '];
  }
  Request({
    this.id,
    this.chair_request,
    this.date_requste,
    this.when_came,
    this.Meridians_requst,
    this.latitudes_request,
    this.Managers_accept_value,
    this.state_request,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chair_request'] = this.chair_request;
    data[' date_requste'] = date_requste;
    data[' when_came'] = when_came;
    data[' Meridians_requst'] = Meridians_requst;
    data[' latitudes_request'] = latitudes_request;
    data['Managers_accept_value '] = Managers_accept_value;
    data[' state_request'] = state_request;
    return data;
  }
}

///////////////////////////////////////////////////////////////////
class Managers {
  int id;
  String name_manger;
  String mobile_manger;
  String Email_manger;
  String password_manger;

  Managers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name_manger = json[' name_manger '];
    mobile_manger = json['mobile_manger  '];
    Email_manger = json['Email_manger'];
    password_manger = json['password_manger '];
  }
  Managers({
    this.id,
    this.name_manger,
    this.mobile_manger,
    this.Email_manger,
    this.password_manger,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data[' name_manger'] = this.name_manger;
    data['mobile_manger'] = this.mobile_manger;
    data['Email_manger'] = this.Email_manger;
    data['password_manger'] = this.password_manger;
    return data;
  }
}
