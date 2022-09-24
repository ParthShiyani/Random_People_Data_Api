class Randomdata {
  final String title;
  final String fnm;
  final String lnm;
  final String gender;
  final dynamic addressnum;
  final String addressnm;
  final String city;
  final String state;
  final String country;
  final dynamic postCode;
  final String email;
  final String userName;
  final String passWord;
  final String phone;
  final String cel;
  final String dob;
  final dynamic age;
  final String image;

  Randomdata({
    required this.title,
    required this.fnm,
    required this.lnm,
    required this.gender,
    required this.addressnum,
    required this.addressnm,
    required this.city,
    required this.state,
    required this.country,
    required this.postCode,
    required this.email,
    required this.userName,
    required this.passWord,
    required this.phone,
    required this.cel,
    required this.dob,
    required this.age,
    required this.image,
  });

  factory Randomdata.fromJson({required Map<String, dynamic> json}) {
    return Randomdata(
      title: json['results'][0]['name']['title'],
      fnm: json['results'][0]['name']['first'],
      lnm: json['results'][0]['name']['last'],
      gender: json['results'][0]['gender'],
      addressnum: json['results'][0]['location']['street']['number'],
      addressnm: json['results'][0]['location']['street']['name'],
      city: json['results'][0]['location']['city'],
      state: json['results'][0]['location']['state'],
      country: json['results'][0]['location']['country'],
      postCode: json['results'][0]['location']['postcode'],
      email: json['results'][0]['email'],
      userName: json['results'][0]['login']['username'],
      passWord: json['results'][0]['login']['password'],
      phone: json['results'][0]['phone'],
      cel: json['results'][0]['cell'],
      dob: json['results'][0]['dob']['date'],
      age: json['results'][0]['dob']['age'],
      image: json["results"][0]["picture"]["large"],
    );
  }
}
