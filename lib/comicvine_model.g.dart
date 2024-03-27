// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comicvine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersResponse _$CharactersResponseFromJson(Map<String, dynamic> json) =>
    CharactersResponse(
      CharactersItem.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharactersResponseToJson(CharactersResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

CharactersItem _$CharactersItemFromJson(Map<String, dynamic> json) =>
    CharactersItem(
      json['name'] as String? ?? '',
      json['image'] == null
          ? ''
          : CharactersItem._imageIconUrlFromJson(
              json['image'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$CharactersItemToJson(CharactersItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };

EpisodeResponse _$EpisodeResponseFromJson(Map<String, dynamic> json) =>
    EpisodeResponse(
      EpisodeItem.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EpisodeResponseToJson(EpisodeResponse instance) =>
    <String, dynamic>{
      'results': instance.result,
    };

EpisodeItem _$EpisodeItemFromJson(Map<String, dynamic> json) => EpisodeItem(
      json['name'] as String? ?? '',
      json['image'] == null
          ? ''
          : EpisodeItem._imageMediumUrlFromJson(
              json['image'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$EpisodeItemToJson(EpisodeItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };

ComicResponse _$ComicResponseFromJson(Map<String, dynamic> json) =>
    ComicResponse(
      (json['results'] as List<dynamic>)
          .map((e) => ComicItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicResponseToJson(ComicResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ComicItems _$ComicItemsFromJson(Map<String, dynamic> json) => ComicItems(
      json['image'] == null
          ? ''
          : ComicItems._imageMediumUrlFromJson(
              json['image'] as Map<String, dynamic>?),
      json['name'] as String? ?? '',
      json['issue_number'] as String? ?? '',
      json['volume'] == null
          ? ''
          : ComicItems._volumeFromJson(json['volume'] as Map<String, dynamic>?),
      json['cover_date'] as String? ?? '',
      json['api_detail_url'] as String? ?? '',
    );

Map<String, dynamic> _$ComicItemsToJson(ComicItems instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.issueName,
      'issue_number': instance.issueNumber,
      'volume': instance.name,
      'cover_date': instance.coverDate,
      'api_detail_url': instance.apiUrl,
    };

ComicItemDetailResponse _$ComicItemDetailResponseFromJson(
        Map<String, dynamic> json) =>
    ComicItemDetailResponse(
      ComicItemDetail.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicItemDetailResponseToJson(
        ComicItemDetailResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ComicItemDetail _$ComicItemDetailFromJson(Map<String, dynamic> json) =>
    ComicItemDetail(
      json['volume'] == null
          ? ''
          : ComicItemDetail._volumeFromJson(
              json['volume'] as Map<String, dynamic>?),
      json['name'] as String? ?? '',
      json['image'] == null
          ? ''
          : ComicItemDetail._imageMediumUrlFromJson(
              json['image'] as Map<String, dynamic>?),
      json['issue_number'] as String? ?? '',
      json['cover_date'] as String? ?? '',
      json['description'] as String? ?? 'no description available',
      (json['person_credits'] as List<dynamic>?)
              ?.map((e) => PersonCredit.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      json['character_credits'] == null
          ? []
          : ComicItemDetail._characterCreditsApiUrlsFromJson(
              json['character_credits'] as List?),
    );

Map<String, dynamic> _$ComicItemDetailToJson(ComicItemDetail instance) =>
    <String, dynamic>{
      'volume': instance.name,
      'name': instance.issueName,
      'image': instance.image,
      'issue_number': instance.issueNumber,
      'cover_date': instance.coverDate,
      'description': instance.description,
      'person_credits': instance.personCredits,
      'character_credits': instance.characterCreditsUrls,
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
      json['api_detail_url'] as String? ?? '',
    );

Map<String, dynamic> _$MovieItemToJson(MovieItem instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'runtime': instance.runtime,
      'release_date': instance.releaseDate,
      'api_detail_url': instance.apiUrl,
    };

MovieDetailResponse _$MovieDetailResponseFromJson(Map<String, dynamic> json) =>
    MovieDetailResponse(
      MovieDetailItem.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieDetailResponseToJson(
        MovieDetailResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

MovieDetailItem _$MovieDetailItemFromJson(Map<String, dynamic> json) =>
    MovieDetailItem(
      json['name'] as String? ?? '',
      json['image'] == null
          ? ''
          : MovieDetailItem._imageMediumUrlFromJson(
              json['image'] as Map<String, dynamic>?),
      json['description'] as String? ?? 'no description available',
      json['runtime'] as String? ?? '',
      json['release_date'] as String? ?? '',
      json['characters'] == null
          ? []
          : MovieDetailItem._charactersApiUrlsFromJson(
              json['characters'] as List?),
      json['rating'] as String? ?? '',
      json['writers'] == null
          ? []
          : MovieDetailItem._writersNameFromJson(json['writers'] as List?),
      json['producers'] == null
          ? []
          : MovieDetailItem._producersNameFromJson(json['producers'] as List?),
      json['studios'] == null
          ? []
          : MovieDetailItem._studiosNameFromJson(json['studios'] as List?),
      json['budget'] as String? ?? '',
      json['box_office_revenue'] as String? ?? '',
      json['total_revenue'] as String? ?? '',
    );

Map<String, dynamic> _$MovieDetailItemToJson(MovieDetailItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'runtime': instance.runtime,
      'release_date': instance.releaseDate,
      'characters': instance.charactersUrls,
      'rating': instance.rating,
      'writers': instance.writers,
      'producers': instance.producers,
      'studios': instance.studios,
      'budget': instance.budget,
      'box_office_revenue': instance.boxOfficeRevenue,
      'total_revenue': instance.totalRevenue,
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
      json['api_detail_url'] as String? ?? '',
    );

Map<String, dynamic> _$SeriesItemToJson(SeriesItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'publisher': instance.publisher,
      'count_of_episodes': instance.countOfEpisodes,
      'start_year': instance.startYear,
      'api_detail_url': instance.apiUrl,
    };

SerieDetailResponse _$SerieDetailResponseFromJson(Map<String, dynamic> json) =>
    SerieDetailResponse(
      SerieDetailItem.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SerieDetailResponseToJson(
        SerieDetailResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

SerieDetailItem _$SerieDetailItemFromJson(Map<String, dynamic> json) =>
    SerieDetailItem(
      json['name'] as String? ?? '',
      json['image'] == null
          ? ''
          : SerieDetailItem._imageMediumUrlFromJson(
              json['image'] as Map<String, dynamic>?),
      json['description'] as String? ?? 'no description available',
      json['count_of_episodes'] as int? ?? 0,
      json['start_year'] as String? ?? '',
      json['publisher'] == null
          ? ''
          : SerieDetailItem._publisherNameFromJson(
              json['publisher'] as Map<String, dynamic>?),
      json['characters'] == null
          ? []
          : SerieDetailItem._charactersApiUrlsFromJson(
              json['characters'] as List?),
      json['episodes'] == null
          ? []
          : SerieDetailItem._episodesApiUrlsFromJson(json['episodes'] as List?),
    );

Map<String, dynamic> _$SerieDetailItemToJson(SerieDetailItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'count_of_episodes': instance.countOfEpisodes,
      'start_year': instance.startYear,
      'publisher': instance.publisher,
      'characters': instance.charactersUrls,
      'episodes': instance.episodesUrls,
    };

PersonResponse _$PersonResponseFromJson(Map<String, dynamic> json) =>
    PersonResponse(
      PersonItem.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonResponseToJson(PersonResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

PersonCredit _$PersonCreditFromJson(Map<String, dynamic> json) => PersonCredit(
      apiUrl: json['api_detail_url'] as String? ?? '',
      role: json['role'] as String? ?? '',
    );

Map<String, dynamic> _$PersonCreditToJson(PersonCredit instance) =>
    <String, dynamic>{
      'api_detail_url': instance.apiUrl,
      'role': instance.role,
    };

PersonItem _$PersonItemFromJson(Map<String, dynamic> json) => PersonItem(
      json['name'] as String? ?? '',
      json['image'] == null
          ? ''
          : PersonItem._imageIconUrlFromJson(
              json['image'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$PersonItemToJson(PersonItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };
