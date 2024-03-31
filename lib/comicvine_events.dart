abstract class ComicsEvent {}

class ComicsRequested extends ComicsEvent {}

class HomeComicsRequested extends ComicsEvent {}

class ComicDetailRequested extends ComicsEvent {
  final String url;
  ComicDetailRequested(this.url);
}

class SeriesRequested extends ComicsEvent {}

class HomeSeriesRequested extends ComicsEvent {}

class SerieDetailRequested extends ComicsEvent {
  final String url;
  SerieDetailRequested(this.url);
}

class CharactersRequested extends ComicsEvent {
  final List<String> urls;
  CharactersRequested(this.urls);
}

class EpisodesRequested extends ComicsEvent {
  final List<String> urls;
  EpisodesRequested(this.urls);
}

class MoviesRequested extends ComicsEvent {}

class HomeMoviesRequested extends ComicsEvent {}

class MovieDetailRequested extends ComicsEvent {
  final String url;
  MovieDetailRequested(this.url);
}

class SearchRequested extends ComicsEvent {
  final String query;
  SearchRequested(this.query);
}
