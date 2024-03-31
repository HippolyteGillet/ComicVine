import 'comicvine_model.dart';

/// Comics
abstract class ComicsState {}

class ComicsInitial extends ComicsState {}

class ComicsLoadInProgress extends ComicsState {}

class ComicsLoadSuccess extends ComicsState {
  final List<ComicItems> comics;
  ComicsLoadSuccess(this.comics);
}

class ComicsLoadFailure extends ComicsState {
  final String message;
  ComicsLoadFailure(this.message);
}

class ComicDetailInitial extends ComicsState {}

class ComicDetailLoadInProgress extends ComicsState {}

class ComicDetailLoadSuccess extends ComicsState {
  final ComicItemDetail comic;
  final List<PersonItem> personDetails;
  final List<PersonCredit> personCredit;
  final List<CharactersItem> characterCredit;

  ComicDetailLoadSuccess(this.comic, this.personDetails, this.personCredit, this.characterCredit);
}

class ComicDetailLoadFailure extends ComicsState {
  final String message;
  ComicDetailLoadFailure(this.message);
}

class PersonDetailsInitial extends ComicsState {}

class PersonDetailsLoadInProgress extends ComicsState {}

class PersonDetailsLoadSuccess extends ComicsState {
  final PersonItem personDetails;

  PersonDetailsLoadSuccess(this.personDetails);
}

class PersonDetailsLoadFailure extends ComicsState {
  final String message;
  PersonDetailsLoadFailure(this.message);
}

/// Series
abstract class SeriesState {}

class SeriesInitial extends SeriesState {}

class SeriesLoadInProgress extends SeriesState {}

class SeriesLoadSuccess extends SeriesState {
  final List<SeriesItem> series;
  SeriesLoadSuccess(this.series);
}

class SeriesLoadFailure extends SeriesState {
  final String message;
  SeriesLoadFailure(this.message);
}

class SerieDetailInitial extends SeriesState {}

class SerieDetailLoadInProgress extends SeriesState {}

class SerieDetailLoadSuccess extends SeriesState {
  final SerieDetailItem serieDetail;
  final List<String> charactersUrl;

  SerieDetailLoadSuccess(this.serieDetail, this.charactersUrl);
}

class SerieDetailLoadFailure extends SeriesState {
  final String message;
  SerieDetailLoadFailure(this.message);
}

/// Movies
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoadInProgress extends MoviesState {}

class MoviesLoadSuccess extends MoviesState {
  final List<MovieItem> movies;
  MoviesLoadSuccess(this.movies);
}

class MoviesLoadFailure extends MoviesState {
  final String message;
  MoviesLoadFailure(this.message);
}

class MovieDetailInitial extends MoviesState {}

class MovieDetailLoadInProgress extends MoviesState {}

class MovieDetailLoadSuccess extends MoviesState {
  final MovieDetailItem movieDetail;

  MovieDetailLoadSuccess(this.movieDetail);
}

class MovieDetailLoadFailure extends MoviesState {
  final String message;
  MovieDetailLoadFailure(this.message);
}

/// Characters
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoadInProgress extends CharactersState {}

class CharactersLoadSuccess extends CharactersState {
  final List<CharactersItem> characters;
  CharactersLoadSuccess(this.characters);
}

class CharactersLoadFailure extends CharactersState {
  final String message;
  CharactersLoadFailure(this.message);
}

/// Episodes
abstract class EpisodesState {}

class EpisodesInitial extends EpisodesState {}

class EpisodesLoadInProgress extends EpisodesState {}

class EpisodesLoadSuccess extends EpisodesState {
  final List<EpisodeItem> episodes;
  EpisodesLoadSuccess(this.episodes);
}

class EpisodesLoadFailure extends EpisodesState {
  final String message;
  EpisodesLoadFailure(this.message);
}

/// Search
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadInProgress extends SearchState {}

class SearchLoadSuccess extends SearchState {
  final List<ComicItemDetail> searchIssueResults;
  final List<CharactersItem> searchCharacterResults;
  SearchLoadSuccess(this.searchIssueResults, this.searchCharacterResults);
}

class SearchLoadFailure extends SearchState {
  final String message;
  SearchLoadFailure(this.message);
}