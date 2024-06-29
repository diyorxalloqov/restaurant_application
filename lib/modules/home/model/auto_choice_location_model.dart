class AutoChoiceLocationModel {
  City? city;
  Continent? continent;
  Country? country;
  Location? location;
  List<Subdivisions>? subdivisions;
  State? state;
  List<Datasource>? datasource;
  String? ip;

  AutoChoiceLocationModel(
      {this.city,
      this.continent,
      this.country,
      this.location,
      this.subdivisions,
      this.state,
      this.datasource,
      this.ip});

  AutoChoiceLocationModel.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    continent = json['continent'] != null
        ? Continent.fromJson(json['continent'])
        : null;
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    if (json['subdivisions'] != null) {
      subdivisions = <Subdivisions>[];
      json['subdivisions'].forEach((v) {
        subdivisions!.add(Subdivisions.fromJson(v));
      });
    }
    state = json['state'] != null ? State.fromJson(json['state']) : null;
    if (json['datasource'] != null) {
      datasource = <Datasource>[];
      json['datasource'].forEach((v) {
        datasource!.add(Datasource.fromJson(v));
      });
    }
    ip = json['ip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (continent != null) {
      data['continent'] = continent!.toJson();
    }
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (subdivisions != null) {
      data['subdivisions'] = subdivisions!.map((v) => v.toJson()).toList();
    }
    if (state != null) {
      data['state'] = state!.toJson();
    }
    if (datasource != null) {
      data['datasource'] = datasource!.map((v) => v.toJson()).toList();
    }
    data['ip'] = ip;
    return data;
  }
}

class City {
  Names? names;
  String? name;

  City({this.names, this.name});

  City.fromJson(Map<String, dynamic> json) {
    names = json['names'] != null ? Names.fromJson(json['names']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (names != null) {
      data['names'] = names!.toJson();
    }
    data['name'] = name;
    return data;
  }
}

class CityName {
  String? en;

  CityName({this.en});

  CityName.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    return data;
  }
}

class Continent {
  String? code;
  int? geonameId;
  Names? names;
  String? name;

  Continent({this.code, this.geonameId, this.names, this.name});

  Continent.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    geonameId = json['geoname_id'];
    names = json['names'] != null ? Names.fromJson(json['names']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['geoname_id'] = geonameId;
    if (names != null) {
      data['names'] = names!.toJson();
    }
    data['name'] = name;
    return data;
  }
}

class Names {
  String? de;
  String? en;
  String? es;
  String? fa;
  String? fr;
  String? ja;
  String? ko;
  String? ptBR;
  String? ru;
  String? zhCN;

  Names(
      {this.de,
      this.en,
      this.es,
      this.fa,
      this.fr,
      this.ja,
      this.ko,
      this.ptBR,
      this.ru,
      this.zhCN});

  Names.fromJson(Map<String, dynamic> json) {
    de = json['de'];
    en = json['en'];
    es = json['es'];
    fa = json['fa'];
    fr = json['fr'];
    ja = json['ja'];
    ko = json['ko'];
    ptBR = json['pt-BR'];
    ru = json['ru'];
    zhCN = json['zh-CN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['de'] = de;
    data['en'] = en;
    data['es'] = es;
    data['fa'] = fa;
    data['fr'] = fr;
    data['ja'] = ja;
    data['ko'] = ko;
    data['pt-BR'] = ptBR;
    data['ru'] = ru;
    data['zh-CN'] = zhCN;
    return data;
  }
}

class Country {
  int? geonameId;
  String? isoCode;
  Names? names;
  String? name;
  String? nameNative;
  String? phoneCode;
  String? capital;
  String? currency;
  String? flag;
  List<Languages>? languages;

  Country(
      {this.geonameId,
      this.isoCode,
      this.names,
      this.name,
      this.nameNative,
      this.phoneCode,
      this.capital,
      this.currency,
      this.flag,
      this.languages});

  Country.fromJson(Map<String, dynamic> json) {
    geonameId = json['geoname_id'];
    isoCode = json['iso_code'];
    names = json['names'] != null ? Names.fromJson(json['names']) : null;
    name = json['name'];
    nameNative = json['name_native'];
    phoneCode = json['phone_code'];
    capital = json['capital'];
    currency = json['currency'];
    flag = json['flag'];
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['geoname_id'] = geonameId;
    data['iso_code'] = isoCode;
    if (names != null) {
      data['names'] = names!.toJson();
    }
    data['name'] = name;
    data['name_native'] = nameNative;
    data['phone_code'] = phoneCode;
    data['capital'] = capital;
    data['currency'] = currency;
    data['flag'] = flag;
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Languages {
  String? isoCode;
  String? name;
  String? nameNative;

  Languages({this.isoCode, this.name, this.nameNative});

  Languages.fromJson(Map<String, dynamic> json) {
    isoCode = json['iso_code'];
    name = json['name'];
    nameNative = json['name_native'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_code'] = isoCode;
    data['name'] = name;
    data['name_native'] = nameNative;
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class Subdivisions {
  Names? names;

  Subdivisions({this.names});

  Subdivisions.fromJson(Map<String, dynamic> json) {
    names = json['names'] != null ? Names.fromJson(json['names']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (names != null) {
      data['names'] = names!.toJson();
    }
    return data;
  }
}

class State {
  String? name;

  State({this.name});

  State.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

class Datasource {
  String? name;
  String? attribution;
  String? license;

  Datasource({this.name, this.attribution, this.license});

  Datasource.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    attribution = json['attribution'];
    license = json['license'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['attribution'] = attribution;
    data['license'] = license;
    return data;
  }
}
