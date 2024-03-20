import 'package:comic_vine/comicvine_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/retrofit.dart';

part 'comicvine_request.g.dart';

@RestApi()
abstract class ComicVineAPI {
  factory ComicVineAPI(Dio dio, {required String baseUrl}) = _ComicVineAPI;

  @GET('characters')
  Future<CharactersResponse> getCharacters(@Query('limit') int limit);

  @GET('issues')
  Future<ComicResponse> getComics(@Query('limit') int limit);

  @GET('movies')
  Future<MovieResponse> getMovies(@Query('limit') int limit);

  @GET('series_list')
  Future<SeriesResponse> getSeries(@Query('limit') int limit);
}

class NetworkRequest {
  // Ici enlever base URL et rajouter l'interceptor

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
          var finalUrl = 'https://api.formation-android.fr/comicvine?url=${options.uri.path}?';

          // Logging the final URL for debugging purposes
          debugPrint('Final Request URL: $finalUrl&${options.uri.query}');
          debugPrint('Query Parameters: ${options.queryParameters}');

          return handler.next(
            RequestOptions(
                path: finalUrl,
                queryParameters: options.uri.queryParameters),
          );
        },
      ),
    ),
    baseUrl: '',
  );

  Future<CharactersResponse> loadCharacters() {
    return _api.getCharacters(20);
  }

  Future<ComicResponse> loadComics() {
    return _api.getComics(5);
  }

  Future<ComicResponse> loadListComics() {
    return _api.getComics(50);
  }

  Future<MovieResponse> loadMovies() {
    return _api.getMovies(5);
  }

  Future<MovieResponse> loadListMovies() {
    return _api.getMovies(50);
  }

  Future<SeriesResponse> loadSeries() {
    return _api.getSeries(5);
  }

  Future<SeriesResponse> loadListSeries() {
    return _api.getSeries(50);
  }
}