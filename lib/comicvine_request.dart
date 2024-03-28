import 'package:comic_vine/comicvine_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'comicvine_request.g.dart';

@RestApi()
abstract class ComicVineAPI {
  factory ComicVineAPI(Dio dio, {required String baseUrl}) = _ComicVineAPI;

  @GET('issues')
  Future<ComicResponse> getComics(@Query('limit') int limit);

  @GET('{url}')
  Future<ComicItemDetailResponse> getComicDetail(@Path('url') String url);

  @GET('{url}')
  Future<PersonResponse> getPersonDetails(@Path('url') String url);

  @GET('{url}')
  Future<CharactersResponse> getCharacterDetails(@Path('url') String url);

  @GET('{url}')
  Future<EpisodeResponse> getEpisodeDetails(@Path('url') String url);

  @GET('movies')
  Future<MovieResponse> getMovies(@Query('limit') int limit);

  @GET('{url}')
  Future<MovieDetailResponse> getMovieDetail(@Path('url') String url);

  @GET('series_list')
  Future<SeriesResponse> getSeries(@Query('limit') int limit);

  @GET('{url}')
  Future<SerieDetailResponse> getSeriesDetail(@Path('url') String url);

  @GET('search')
  Future<SearchResponse> search(@Query('query') String query,
      @Query('resources') String resources, @Query('limit') int limit);
}

class NetworkRequest {
  final ComicVineAPI _api = ComicVineAPI(
    Dio(
      BaseOptions(
        queryParameters: {
          'api_key': '16614ade8e59332962eae097ac6d90942aac97a8',
          'format': 'json',
        },
      ),
    )..interceptors.add(
        InterceptorsWrapper(
          onRequest: (
            RequestOptions options,
            RequestInterceptorHandler handler,
          ) {
            // Constructing the final URL to be used for the request
            var finalUrl =
                'https://api.formation-android.fr/comicvine?url=${options.uri.path}?';

            // Logging the final URL for debugging purposes
            debugPrint('Final Request URL: $finalUrl&${options.uri.query}');
            debugPrint('Query Parameters: ${options.queryParameters}');

            return handler.next(
              RequestOptions(
                  path: finalUrl, queryParameters: options.uri.queryParameters),
            );
          },
        ),
      ),
    baseUrl: '',
  );

  Future<ComicResponse> loadComics() {
    return _api.getComics(5);
  }

  Future<ComicResponse> loadListComics() {
    return _api.getComics(50);
  }

  Future<ComicItemDetailResponse> loadComicDetail(String url) {
    String cleanUrl = url.replaceAll('https://comicvine.gamespot.com/api/', '');
    debugPrint('Clean URL: $cleanUrl');
    return _api.getComicDetail(cleanUrl);
  }

  Future<PersonResponse> loadPersonDetails(String url) {
    String cleanUrl = url.replaceAll('https://comicvine.gamespot.com/api/', '');
    debugPrint('Clean URL Person: $cleanUrl');
    return _api.getPersonDetails(cleanUrl);
  }

  Future<CharactersResponse> loadCharacterDetails(String url) {
    String cleanUrl = url.replaceAll('https://comicvine.gamespot.com/api/', '');
    debugPrint('Clean URL Character: $cleanUrl');
    return _api.getCharacterDetails(cleanUrl);
  }

  Future<EpisodeResponse> loadEpisodeDetails(String url) {
    String cleanUrl = url.replaceAll('https://comicvine.gamespot.com/api/', '');
    debugPrint('Clean URL Episode: $cleanUrl');
    return _api.getEpisodeDetails(cleanUrl);
  }

  Future<MovieResponse> loadMovies() {
    return _api.getMovies(5);
  }

  Future<MovieResponse> loadListMovies() {
    return _api.getMovies(50);
  }

  Future<MovieDetailResponse> loadMovieDetail(String url) {
    String cleanUrl = url.replaceAll('https://comicvine.gamespot.com/api/', '');
    debugPrint('Clean URL Movie: $cleanUrl');
    return _api.getMovieDetail(cleanUrl);
  }

  Future<SeriesResponse> loadSeries() {
    return _api.getSeries(5);
  }

  Future<SerieDetailResponse> loadSeriesDetail(String url) {
    String cleanUrl = url.replaceAll('https://comicvine.gamespot.com/api/', '');
    debugPrint('Clean URL Series: $cleanUrl');
    return _api.getSeriesDetail(cleanUrl);
  }

  Future<SeriesResponse> loadListSeries() {
    return _api.getSeries(50);
  }

  Future<SearchResponse> searchIssue(String query) {
    return _api.search(query, 'issue', 5);
  }

  Future<SearchResponse> searchCharacter(String query) {
    return _api.search(query, 'character', 5);
  }
}
