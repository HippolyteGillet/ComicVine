import 'package:json_annotation/json_annotation.dart';

part 'comicvine_model.g.dart';

@JsonSerializable()
class CharactersResponse {
  @JsonKey(name: 'results')
  final CharactersItem results;

  CharactersResponse(this.results);

  factory CharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$CharactersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);
}

@JsonSerializable()
class CharactersItem {
  @JsonKey(name:'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'image', fromJson: _imageIconUrlFromJson, defaultValue: '')
  final String image;

  CharactersItem(this.name, this.image);

  factory CharactersItem.fromJson(Map<String, dynamic> json) =>
      _$CharactersItemFromJson(json);
  static String _imageIconUrlFromJson(Map<String, dynamic>? json) =>
      json?['icon_url'] as String? ?? '';

  Map<String, dynamic> toJson() => _$CharactersItemToJson(this);
}

@JsonSerializable()
class EpisodeResponse {
  @JsonKey(name: 'results')
  final EpisodeItem result;

  EpisodeResponse(this.result);

  factory EpisodeResponse.fromJson(Map<String, dynamic> json) =>
      _$EpisodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeResponseToJson(this);
}

@JsonSerializable()
class EpisodeItem {
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'image', fromJson: _imageMediumUrlFromJson, defaultValue: '')
  final String image;

  EpisodeItem(this.name, this.image);

  factory EpisodeItem.fromJson(Map<String, dynamic> json) =>
      _$EpisodeItemFromJson(json);
  static String _imageMediumUrlFromJson(Map<String, dynamic>? json) =>
      json?['medium_url'] as String? ?? '';

  Map<String, dynamic> toJson() => _$EpisodeItemToJson(this);
}

@JsonSerializable()
class ComicResponse {
  @JsonKey(name: 'results')
  final List<ComicItems> results;

  ComicResponse(this.results);

  factory ComicResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicResponseToJson(this);
}

@JsonSerializable()
class ComicItems {
  @JsonKey(name: 'image', fromJson: _imageMediumUrlFromJson, defaultValue: '')
  final String image;
  @JsonKey(name: 'name', defaultValue: '')
  final String issueName;
  @JsonKey(name: 'issue_number', defaultValue: '')
  final String issueNumber;
  @JsonKey(name: 'volume', fromJson: _volumeFromJson, defaultValue: '')
  final String name;
  @JsonKey(name: 'cover_date', defaultValue: '')
  final String coverDate;
  @JsonKey(name: 'api_detail_url', defaultValue: '')
  final String apiUrl;

  ComicItems(this.image, this.issueName, this.issueNumber, this.name,
      this.coverDate, this.apiUrl);

  factory ComicItems.fromJson(Map<String, dynamic> json) =>
      _$ComicItemsFromJson(json);
  static String _imageMediumUrlFromJson(Map<String, dynamic>? json) =>
      json?['medium_url'] as String? ?? '';
  static String _volumeFromJson(Map<String, dynamic>? json) =>
      json?['name'] as String? ?? '';

  Map<String, dynamic> toJson() => _$ComicItemsToJson(this);
}

@JsonSerializable()
class ComicItemDetailResponse {
  @JsonKey(name: 'results')
  final ComicItemDetail results;

  ComicItemDetailResponse(this.results);

  factory ComicItemDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicItemDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicItemDetailResponseToJson(this);
}

@JsonSerializable()
class ComicItemDetail {
  @JsonKey(name: 'volume', fromJson: _volumeFromJson, defaultValue: '')
  final String name;
  @JsonKey(name: 'name', defaultValue: '')
  final String issueName;
  @JsonKey(name: 'image', fromJson: _imageMediumUrlFromJson, defaultValue: '')
  final String image;
  @JsonKey(name: 'issue_number', defaultValue: '')
  final String issueNumber;
  @JsonKey(name: 'cover_date', defaultValue: '')
  final String coverDate;
  @JsonKey(name: 'description', defaultValue: 'no description available')
  final String description;
  @JsonKey(name:'person_credits', defaultValue: [])
  final List<PersonCredit> personCredits;
  @JsonKey(name:'character_credits', fromJson: _characterCreditsApiUrlsFromJson, defaultValue: [])
  final List<String> characterCreditsUrls;

  ComicItemDetail(
      this.name,
      this.issueName,
      this.image,
      this.issueNumber,
      this.coverDate,
      this.description,
      this.personCredits,
      this.characterCreditsUrls);

  factory ComicItemDetail.fromJson(Map<String, dynamic> json) =>
      _$ComicItemDetailFromJson(json);
  static String _imageMediumUrlFromJson(Map<String, dynamic>? json) =>
      json?['medium_url'] as String? ?? '';
  static String _volumeFromJson(Map<String, dynamic>? json) =>
      json?['name'] as String? ?? '';
  static List<String> _characterCreditsApiUrlsFromJson(List<dynamic>? json) =>
      json?.map((e) => e['api_detail_url'] as String).toList() ?? [];


  Map<String, dynamic> toJson() => _$ComicItemDetailToJson(this);
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
  @JsonKey(name: 'runtime', defaultValue: '')
  final String runtime;
  @JsonKey(name: 'release_date', defaultValue: '')
  final String releaseDate;
  @JsonKey(name: 'api_detail_url', defaultValue: '')
  final String apiUrl;

  MovieItem(this.name, this.image, this.runtime, this.releaseDate, this.apiUrl);

  factory MovieItem.fromJson(Map<String, dynamic> json) =>
      _$MovieItemFromJson(json);

  static String _imageMediumUrlFromJson(Map<String, dynamic>? json) =>
      json?['medium_url'] as String? ?? '';

  Map<String, dynamic> toJson() => _$MovieItemToJson(this);
}

@JsonSerializable()
class MovieDetailResponse {
  @JsonKey(name: 'results')
  final MovieDetailItem results;

  MovieDetailResponse(this.results);

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailResponseToJson(this);
}

@JsonSerializable()
class MovieDetailItem {
  @JsonKey(name : 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'image', fromJson: _imageMediumUrlFromJson, defaultValue: '')
  final String image;
  @JsonKey(name: 'description', defaultValue: 'no description available')
  final String description;
  @JsonKey(name: 'runtime', defaultValue: '')
  final String runtime;
  @JsonKey(name: 'release_date', defaultValue: '')
  final String releaseDate;
  @JsonKey(name:'characters', fromJson: _charactersApiUrlsFromJson, defaultValue: [])
  final List<String> charactersUrls;
  @JsonKey(name:'rating', defaultValue: '')
  final String rating;
  @JsonKey(name:'writers',fromJson: _writersNameFromJson, defaultValue: [])
  final List<String> writers;
  @JsonKey(name:'producers', fromJson: _producersNameFromJson, defaultValue: [])
  final List<String> producers;
  @JsonKey(name:'studios', fromJson: _studiosNameFromJson, defaultValue: [])
  final List<String> studios;
  @JsonKey(name:'budget', defaultValue: '')
  final String budget;
  @JsonKey(name:'box_office_revenue', defaultValue: '')
  final String boxOfficeRevenue;
  @JsonKey(name:'total_revenue', defaultValue: '')
  final String totalRevenue;

  MovieDetailItem(this.name, this.image, this.description, this.runtime,
      this.releaseDate, this.charactersUrls, this.rating, this.writers, this.producers,
      this.studios, this.budget, this.boxOfficeRevenue, this.totalRevenue);

  factory MovieDetailItem.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailItemFromJson(json);

  static String _imageMediumUrlFromJson(Map<String, dynamic>? json) =>
      json?['medium_url'] as String? ?? '';
  static List<String> _charactersApiUrlsFromJson(List<dynamic>? json) =>
      json?.map((e) => e['api_detail_url'] as String).toList() ?? [];
  static List<String> _writersNameFromJson(List<dynamic>? json) =>
      json?.map((e) => e['name'] as String).toList() ?? [];
  static List<String> _producersNameFromJson(List<dynamic>? json) =>
      json?.map((e) => e['name'] as String).toList() ?? [];
  static List<String> _studiosNameFromJson(List<dynamic>? json) =>
      json?.map((e) => e['name'] as String).toList() ?? [];

  Map<String, dynamic> toJson() => _$MovieDetailItemToJson(this);
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
  @JsonKey(
      name: 'publisher', fromJson: _publisherNameFromJson, defaultValue: '')
  final String publisher;
  @JsonKey(name: "count_of_episodes", defaultValue: 0)
  final int countOfEpisodes;
  @JsonKey(name: 'start_year', defaultValue: '')
  final String startYear;
  @JsonKey(name: 'api_detail_url', defaultValue: '')
  final String apiUrl;

  SeriesItem(this.name, this.image, this.publisher, this.countOfEpisodes,
      this.startYear, this.apiUrl);

  factory SeriesItem.fromJson(Map<String, dynamic> json) =>
      _$SeriesItemFromJson(json);

  static String _imageMediumUrlFromJson(Map<String, dynamic>? json) =>
      json?['medium_url'] as String? ?? '';

  static String _publisherNameFromJson(Map<String, dynamic>? json) =>
      json?['name'] as String? ?? '';

  Map<String, dynamic> toJson() => _$SeriesItemToJson(this);
}

@JsonSerializable()
class SerieDetailResponse{
  @JsonKey(name: 'results')
  final SerieDetailItem results;

  SerieDetailResponse(this.results);

  factory SerieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$SerieDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SerieDetailResponseToJson(this);
}

@JsonSerializable()
class SerieDetailItem {
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'image', fromJson: _imageMediumUrlFromJson, defaultValue: '')
  final String image;
  @JsonKey(name: 'description', defaultValue: 'no description available')
  final String description;
  @JsonKey(name: 'count_of_episodes', defaultValue: 0)
  final int countOfEpisodes;
  @JsonKey(name: 'start_year', defaultValue: '')
  final String startYear;
  @JsonKey(name: 'publisher', fromJson: _publisherNameFromJson, defaultValue: '')
  final String publisher;
  @JsonKey(name:'characters', fromJson: _charactersApiUrlsFromJson, defaultValue: [])
  final List<String> charactersUrls;
  @JsonKey(name:'episodes', fromJson: _episodesApiUrlsFromJson, defaultValue: [])
  final List<String> episodesUrls;

  SerieDetailItem(this.name, this.image, this.description, this.countOfEpisodes,
      this.startYear, this.publisher, this.charactersUrls, this.episodesUrls);

  factory SerieDetailItem.fromJson(Map<String, dynamic> json) =>
      _$SerieDetailItemFromJson(json);

  static String _imageMediumUrlFromJson(Map<String, dynamic>? json) =>
      json?['medium_url'] as String? ?? '';
  static String _publisherNameFromJson(Map<String, dynamic>? json) =>
      json?['name'] as String? ?? '';
  static List<String> _charactersApiUrlsFromJson(List<dynamic>? json) =>
      json?.map((e) => e['api_detail_url'] as String).toList() ?? [];
  static List<String> _episodesApiUrlsFromJson(List<dynamic>? json) =>
      json?.map((e) => e['api_detail_url'] as String).toList() ?? [];

  Map<String, dynamic> toJson() => _$SerieDetailItemToJson(this);
}

@JsonSerializable()
class PersonResponse {
  @JsonKey(name: 'results')
  final PersonItem results;

  PersonResponse(this.results);

  factory PersonResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PersonResponseToJson(this);
}

@JsonSerializable()
class PersonCredit {
  @JsonKey(name: 'api_detail_url', defaultValue: '')
  final String apiUrl;

  @JsonKey(name: 'role', defaultValue: '')
  final String role;

  PersonCredit({required this.apiUrl, required this.role});

  factory PersonCredit.fromJson(Map<String, dynamic> json) => _$PersonCreditFromJson(json);
  Map<String, dynamic> toJson() => _$PersonCreditToJson(this);
}


@JsonSerializable()
class PersonItem {
  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @JsonKey(name: 'image', fromJson: _imageIconUrlFromJson, defaultValue: '')
  final String image;

  PersonItem(this.name, this.image);

  factory PersonItem.fromJson(Map<String, dynamic> json) =>
      _$PersonItemFromJson(json);

  static String _imageIconUrlFromJson(Map<String, dynamic>? json) =>
      json?['icon_url'] as String? ?? '';

  Map<String, dynamic> toJson() => _$PersonItemToJson(this);
}

/// Search
@JsonSerializable()
class SearchResponse {
  @JsonKey(name: 'results')
  final List<SearchItem> results;

  SearchResponse(this.results);

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

@JsonSerializable()
class SearchItem {
  @JsonKey(name:'api_detail_url', defaultValue: '')
  final String apiDetailUrl;

  SearchItem(this.apiDetailUrl);

  factory SearchItem.fromJson(Map<String, dynamic> json) =>
      _$SearchItemFromJson(json);

  Map<String, dynamic> toJson() => _$SearchItemToJson(this);
}