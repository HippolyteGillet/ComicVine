// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comicvine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersResponse _$CharactersResponseFromJson(Map<String, dynamic> json) =>
    CharactersResponse(
      (json['results'] as List<dynamic>)
          .map(
              (e) => CharactersResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersResponseToJson(CharactersResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

CharactersResponseItem _$CharactersResponseItemFromJson(
        Map<String, dynamic> json) =>
    CharactersResponseItem(
      json['api_detail_url'] as String,
    );

Map<String, dynamic> _$CharactersResponseItemToJson(
        CharactersResponseItem instance) =>
    <String, dynamic>{
      'api_detail_url': instance.apiUrl,
    };

ComicResponse _$ComicResponseFromJson(Map<String, dynamic> json) =>
    ComicResponse(
      (json['results'] as List<dynamic>)
          .map((e) => ComicItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicResponseToJson(ComicResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ComicItem _$ComicItemFromJson(Map<String, dynamic> json) => ComicItem(
      json['volume'] == null
          ? ''
          : ComicItem._volumeNameFromJson(
              json['volume'] as Map<String, dynamic>?),
      json['image'] == null
          ? ''
          : ComicItem._imageMediumUrlFromJson(
              json['image'] as Map<String, dynamic>?),
      json['name'] as String? ?? '',
      json['issue_number'] as String? ?? '',
      json['cover_date'] as String? ?? '',
    );

Map<String, dynamic> _$ComicItemToJson(ComicItem instance) => <String, dynamic>{
      'volume': instance.name,
      'image': instance.image,
      'name': instance.issueName,
      'issue_number': instance.issueNumber,
      'cover_date': instance.coverDate,
    };

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      (json['results'] as List<dynamic>)
          .map((e) => MovieItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

MovieItem _$MovieItemFromJson(Map<String, dynamic> json) => MovieItem(
      json['name'] as String? ?? '',
      json['image'] == null
          ? ''
          : MovieItem._imageMediumUrlFromJson(
              json['image'] as Map<String, dynamic>?),
      json['runtime'] as String? ?? '',
      json['release_date'] as String? ?? '',
    );

Map<String, dynamic> _$MovieItemToJson(MovieItem instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'runtime': instance.runtime,
      'release_date': instance.releaseDate,
    };

SeriesResponse _$SeriesResponseFromJson(Map<String, dynamic> json) =>
    SeriesResponse(
      (json['results'] as List<dynamic>)
          .map((e) => SeriesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesResponseToJson(SeriesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

SeriesItem _$SeriesItemFromJson(Map<String, dynamic> json) => SeriesItem(
      json['name'] as String? ?? '',
      json['image'] == null
          ? ''
          : SeriesItem._imageMediumUrlFromJson(
              json['image'] as Map<String, dynamic>?),
      json['publisher'] == null
          ? ''
          : SeriesItem._publisherNameFromJson(
              json['publisher'] as Map<String, dynamic>?),
      json['count_of_episodes'] as int? ?? 0,
      json['start_year'] as String? ?? '',
    );

Map<String, dynamic> _$SeriesItemToJson(SeriesItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'publisher': instance.publisher,
      'count_of_episodes': instance.countOfEpisodes,
      'start_year': instance.startYear,
    };
