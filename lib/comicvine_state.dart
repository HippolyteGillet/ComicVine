import 'comicvine_model.dart';

/// Comics
abstract class ComicsState {}

class ComicsInitial extends ComicsState {}

class ComicsLoadInProgress extends ComicsState {}

class ComicsLoadSuccess extends ComicsState {
  final List<ComicItems> comics;
  ComicsLoadSuccess(this.comics);
}

class ComicsLoadFailure extends ComicsState {}

class ComicDetailInitial extends ComicsState {}

class ComicDetailLoadInProgress extends ComicsState {}

class ComicDetailLoadSuccess extends ComicsState {
  final ComicItemDetail comic;
  final List<PersonItem> personDetails;
  final List<PersonCredit> personCredit;
  final List<CharactersItem> characterCredit;

  ComicDetailLoadSuccess(this.comic, this.personDetails, this.personCredit, this.characterCredit);
}

class ComicDetailLoadFailure extends ComicsState {}

class PersonDetailsInitial extends ComicsState {}

class PersonDetailsLoadInProgress extends ComicsState {}

class PersonDetailsLoadSuccess extends ComicsState {
  final PersonItem personDetails;

  PersonDetailsLoadSuccess(this.personDetails);
}

class PersonDetailsLoadFailure extends ComicsState {}

/// Series
abstract class SeriesState {}

class SeriesInitial extends SeriesState {}

class SeriesLoadInProgress extends SeriesState {}

class SeriesLoadSuccess extends SeriesState {
  final List<SeriesItem> series;
  SeriesLoadSuccess(this.series);
}

class SeriesLoadFailure extends SeriesState {}

class SerieDetailInitial extends SeriesState {}

class SerieDetailLoadInProgress extends SeriesState {}

class SerieDetailLoadSuccess extends SeriesState {
  final SerieDetailItem serieDetail;
  final List<String> charactersUrl;

  SerieDetailLoadSuccess(this.serieDetail, this.charactersUrl);
}

class SerieDetailLoadFailure extends SeriesState {}

/// Movies
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoadInProgress extends MoviesState {}

class MoviesLoadSuccess extends MoviesState {
  final List<MovieItem> movies;
  MoviesLoadSuccess(this.movies);
}

class MoviesLoadFailure extends MoviesState {}

class MovieDetailInitial extends MoviesState {}

class MovieDetailLoadInProgress extends MoviesState {}

class MovieDetailLoadSuccess extends MoviesState {
  final MovieDetailItem movieDetail;

  MovieDetailLoadSuccess(this.movieDetail);
}

class MovieDetailLoadFailure extends MoviesState {}

/// Characters
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoadInProgress extends CharactersState {}

class CharactersLoadSuccess extends CharactersState {
  final List<CharactersItem> characters;
  CharactersLoadSuccess(this.characters);
}

class CharactersLoadFailure extends CharactersState {}

/// Episodes
abstract class EpisodesState {}

class EpisodesInitial extends EpisodesState {}

class EpisodesLoadInProgress extends EpisodesState {}

class EpisodesLoadSuccess extends EpisodesState {
  final List<EpisodeItem> episodes;
  EpisodesLoadSuccess(this.episodes);
}

class EpisodesLoadFailure extends EpisodesState {}

/// Search
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadInProgress extends SearchState {}

class SearchLoadSuccess extends SearchState {
  final List<ComicItemDetail> searchIssueResults;
  final List<CharactersItem> searchCharacterResults;
  SearchLoadSuccess(this.searchIssueResults, this.searchCharacterResults);
}

class SearchLoadFailure extends SearchState {}