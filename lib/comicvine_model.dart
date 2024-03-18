import 'package:json_annotation/json_annotation.dart';

part 'comicvine_model.g.dart';

@JsonSerializable()
class CharactersResponse {
  @JsonKey(name: 'results')
  final List<CharactersResponseItem> results;

  CharactersResponse(this.results);

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);
}

@JsonSerializable()
class CharactersResponseItem {
  @JsonKey(name: 'api_detail_url')
  final String apiUrl;

  CharactersResponseItem(this.apiUrl);

  factory CharactersResponseItem.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseItemFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseItemToJson(this);
}

@JsonSerializable()
class ComicResponse {
  @JsonKey(name: 'results')
  final List<ComicItem> results;

  ComicResponse(this.results);

  factory ComicResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicResponseToJson(this);
}

@JsonSerializable()
class ComicItem {
  @JsonKey(name: 'volume', fromJson: _volumeNameFromJson, defaultValue: '')
  final String name;
  @JsonKey(name: 'image', fromJson: _imageMediumUrlFromJson, defaultValue: '')
  final String image;
  @JsonKey(name: 'api_detail_url', defaultValue: '')
  final String apiUrl;

  ComicItem(this.name, this.image, this.apiUrl);

  factory ComicItem.fromJson(Map<String, dynamic> json) =>
      _$ComicItemFromJson(json);

  static String _volumeNameFromJson(Map<String, dynamic>? json) =>
      json?['name'] as String? ?? '';
  static String _imageMediumUrlFromJson(Map<String, dynamic>? json) =>
      json?['medium_url'] as String? ?? '';

  Map<String, dynamic> toJson() => _$ComicItemToJson(this);
}

@JsonSerializable()
class MovieResponse {
  @JsonKey(name: 'results')
  final List<MovieItem> results;

  MovieResponse(this.results);

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}

@JsonSerializable()
class MovieItem {
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'image', fromJson: _imageMediumUrlFromJson, defaultValue: '')
  final String image;
  @JsonKey(name: 'api_detail_url', defaultValue: '')
  final String apiUrl;

  MovieItem(this.name, this.image, this.apiUrl);

  factory MovieItem.fromJson(Map<String, dynamic> json) =>
      _$MovieItemFromJson(json);

  static String _imageMediumUrlFromJson(Map<String, dynamic>? json) =>
      json?['medium_url'] as String? ?? '';

  Map<String, dynamic> toJson() => _$MovieItemToJson(this);
}

@JsonSerializable()
class SeriesResponse {
  @JsonKey(name: 'results')
  final List<SeriesItem> results;

  SeriesResponse(this.results);

  factory SeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$SeriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesResponseToJson(this);
}

@JsonSerializable()
class SeriesItem {
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'image', fromJson: _imageMediumUrlFromJson, defaultValue: '')
  final String image;
  @JsonKey(name: 'api_detail_url', defaultValue: '')
  final String apiUrl;

  SeriesItem(this.name, this.image, this.apiUrl);

  factory SeriesItem.fromJson(Map<String, dynamic> json) =>
      _$SeriesItemFromJson(json);

  static String _imageMediumUrlFromJson(Map<String, dynamic>? json) =>
      json?['medium_url'] as String? ?? '';

  Map<String, dynamic> toJson() => _$SeriesItemToJson(this);
}

