class ManualChoiceLocationModel {
  List<Results>? results;
  Query? query;

  ManualChoiceLocationModel({this.results, this.query});

  ManualChoiceLocationModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    query = json['query'] != null ? Query.fromJson(json['query']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    if (query != null) {
      data['query'] = query!.toJson();
    }
    return data;
  }
}

class Results {
  Datasource? datasource;
  String? oldName;
  String? country;
  String? countryCode;
  String? city;
  String? postcode;
  double? lon;
  double? lat;
  String? resultType;
  String? formatted;
  String? addressLine1;
  String? addressLine2;
  String? category;
  Timezone? timezone;
  String? plusCode;
  Rank? rank;
  String? placeId;
  Bbox? bbox;
  String? name;
  String? state;
  String? county;
  String? hamlet;

  Results(
      {this.datasource,
      this.oldName,
      this.country,
      this.countryCode,
      this.city,
      this.postcode,
      this.lon,
      this.lat,
      this.resultType,
      this.formatted,
      this.addressLine1,
      this.addressLine2,
      this.category,
      this.timezone,
      this.plusCode,
      this.rank,
      this.placeId,
      this.bbox,
      this.name,
      this.state,
      this.county,
      this.hamlet});

  Results.fromJson(Map<String, dynamic> json) {
    datasource = json['datasource'] != null
        ? Datasource.fromJson(json['datasource'])
        : null;
    oldName = json['old_name'];
    country = json['country'];
    countryCode = json['country_code'];
    city = json['city'];
    postcode = json['postcode'];
    lon = json['lon'];
    lat = json['lat'];
    resultType = json['result_type'];
    formatted = json['formatted'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    category = json['category'];
    timezone =
        json['timezone'] != null ? Timezone.fromJson(json['timezone']) : null;
    plusCode = json['plus_code'];
    rank = json['rank'] != null ? Rank.fromJson(json['rank']) : null;
    placeId = json['place_id'];
    bbox = json['bbox'] != null ? Bbox.fromJson(json['bbox']) : null;
    name = json['name'];
    state = json['state'];
    county = json['county'];
    hamlet = json['hamlet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (datasource != null) {
      data['datasource'] = datasource!.toJson();
    }
    data['old_name'] = oldName;
    data['country'] = country;
    data['country_code'] = countryCode;
    data['city'] = city;
    data['postcode'] = postcode;
    data['lon'] = lon;
    data['lat'] = lat;
    data['result_type'] = resultType;
    data['formatted'] = formatted;
    data['address_line1'] = addressLine1;
    data['address_line2'] = addressLine2;
    data['category'] = category;
    if (timezone != null) {
      data['timezone'] = timezone!.toJson();
    }
    data['plus_code'] = plusCode;
    if (rank != null) {
      data['rank'] = rank!.toJson();
    }
    data['place_id'] = placeId;
    if (bbox != null) {
      data['bbox'] = bbox!.toJson();
    }
    data['name'] = name;
    data['state'] = state;
    data['county'] = county;
    data['hamlet'] = hamlet;
    return data;
  }
}

class Datasource {
  String? sourcename;
  String? attribution;
  String? license;
  String? url;

  Datasource({this.sourcename, this.attribution, this.license, this.url});

  Datasource.fromJson(Map<String, dynamic> json) {
    sourcename = json['sourcename'];
    attribution = json['attribution'];
    license = json['license'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sourcename'] = sourcename;
    data['attribution'] = attribution;
    data['license'] = license;
    data['url'] = url;
    return data;
  }
}

class Timezone {
  String? name;
  String? offsetSTD;
  int? offsetSTDSeconds;
  String? offsetDST;
  int? offsetDSTSeconds;

  Timezone(
      {this.name,
      this.offsetSTD,
      this.offsetSTDSeconds,
      this.offsetDST,
      this.offsetDSTSeconds});

  Timezone.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    offsetSTD = json['offset_STD'];
    offsetSTDSeconds = json['offset_STD_seconds'];
    offsetDST = json['offset_DST'];
    offsetDSTSeconds = json['offset_DST_seconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['offset_STD'] = offsetSTD;
    data['offset_STD_seconds'] = offsetSTDSeconds;
    data['offset_DST'] = offsetDST;
    data['offset_DST_seconds'] = offsetDSTSeconds;
    return data;
  }
}

class Rank {
  double? importance;
  double? popularity;
  int? confidence;
  int? confidenceCityLevel;
  String? matchType;

  Rank(
      {this.importance,
      this.popularity,
      this.confidence,
      this.confidenceCityLevel,
      this.matchType});

  Rank.fromJson(Map<String, dynamic> json) {
    importance = json['importance'];
    popularity = json['popularity'];
    confidence = json['confidence'];
    confidenceCityLevel = json['confidence_city_level'];
    matchType = json['match_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['importance'] = importance;
    data['popularity'] = popularity;
    data['confidence'] = confidence;
    data['confidence_city_level'] = confidenceCityLevel;
    data['match_type'] = matchType;
    return data;
  }
}

class Bbox {
  double? lon1;
  double? lat1;
  double? lon2;
  double? lat2;

  Bbox({this.lon1, this.lat1, this.lon2, this.lat2});

  Bbox.fromJson(Map<String, dynamic> json) {
    lon1 = json['lon1'];
    lat1 = json['lat1'];
    lon2 = json['lon2'];
    lat2 = json['lat2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon1'] = lon1;
    data['lat1'] = lat1;
    data['lon2'] = lon2;
    data['lat2'] = lat2;
    return data;
  }
}

class Query {
  String? text;
  Parsed? parsed;

  Query({this.text, this.parsed});

  Query.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    parsed = json['parsed'] != null ? Parsed.fromJson(json['parsed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    if (parsed != null) {
      data['parsed'] = parsed!.toJson();
    }
    return data;
  }
}

class Parsed {
  String? city;
  String? expectedType;

  Parsed({this.city, this.expectedType});

  Parsed.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    expectedType = json['expected_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['expected_type'] = expectedType;
    return data;
  }
}
