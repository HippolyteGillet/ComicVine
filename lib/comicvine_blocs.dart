import 'package:comic_vine/comicvine_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'comicvine_events.dart';
import 'comicvine_state.dart';
import 'comicvine_request.dart';

/// Comics
class ComicsBloc extends Bloc<ComicsEvent, ComicsState> {
  ComicsBloc() : super(ComicsInitial()) {
    on<ComicsRequested>(_onComicsRequested);
    on<HomeComicsRequested>(_onHomeComicsRequested);
    on<ComicDetailRequested>(_onComicDetailRequested);
  }

  Future<void> _onComicsRequested(
      ComicsRequested event, Emitter<ComicsState> emit) async {
    try {
      emit(ComicsLoadInProgress());
      final comics = await NetworkRequest().loadListComics();

      emit(ComicsLoadSuccess(comics.results));
    } catch (e, stacktrace) {
      emit(ComicsLoadFailure(e.toString() + stacktrace.toString()));
    }
  }

  Future<void> _onHomeComicsRequested(
      HomeComicsRequested event, Emitter<ComicsState> emit) async {
    try {
      emit(ComicsLoadInProgress());
      final comics = await NetworkRequest().loadComics();

      emit(ComicsLoadSuccess(comics.results));
    } catch (e, stacktrace) {
      emit(ComicsLoadFailure(e.toString() + stacktrace.toString()));
    }
  }


  Future<void> _onComicDetailRequested(
      ComicDetailRequested event, Emitter<ComicsState> emit) async {
    try {
      emit(ComicDetailLoadInProgress());
      final comicDetailResponse =
          await NetworkRequest().loadComicDetail(event.url);
      final comic = comicDetailResponse.results;
      final personCredits = comic.personCredits;

      final futures = comic.personCredits.map((personCredit) =>
          NetworkRequest().loadPersonDetails(personCredit.apiUrl));
      final personDetails = await Future.wait(futures);

      List<CharactersItem> characterCredits = [];
      for (var characterCredit in comic.characterCreditsUrls) {
        CharactersResponse character =
            await NetworkRequest().loadCharacterDetails(characterCredit);
        characterCredits.add(character.results);
      }
      debugPrint('Character Credits: $characterCredits');

      emit(ComicDetailLoadSuccess(
          comic,
          personDetails.map((e) => e.results).toList(),
          personCredits,
          characterCredits));
    } catch (e, stacktrace) {
      emit(ComicDetailLoadFailure(e.toString() + stacktrace.toString()));
    }
  }
}

/// Series
class SeriesBloc extends Bloc<ComicsEvent, SeriesState> {
  SeriesBloc() : super(SeriesInitial()) {
    on<SeriesRequested>(_onSeriesRequested);
    on<HomeSeriesRequested>(_onHomeSeriesRequested);
    on<SerieDetailRequested>(_onSerieDetailRequested);
  }

  Future<void> _onSeriesRequested(
      SeriesRequested event, Emitter<SeriesState> emit) async {
    try {
      emit(SeriesLoadInProgress());
      final series = await NetworkRequest().loadListSeries();

      emit(SeriesLoadSuccess(series.results));
    } catch (e, stacktrace) {
      emit(SeriesLoadFailure(e.toString() + stacktrace.toString()));
    }
  }

  Future<void> _onHomeSeriesRequested(
      HomeSeriesRequested event, Emitter<SeriesState> emit) async {
    try {
      emit(SeriesLoadInProgress());
      final series = await NetworkRequest().loadSeries();

      emit(SeriesLoadSuccess(series.results));
    } catch (e, stacktrace) {
      emit(SeriesLoadFailure(e.toString() + stacktrace.toString()));
    }
  }

  Future<void> _onSerieDetailRequested(
      SerieDetailRequested event, Emitter<SeriesState> emit) async {
    try {
      emit(SerieDetailLoadInProgress());
      final seriesDetailResponse =
          await NetworkRequest().loadSeriesDetail(event.url);
      final serie = seriesDetailResponse.results;
      final characters = serie.charactersUrls;

      emit(SerieDetailLoadSuccess(serie, characters));
    } catch (e, stacktrace) {
      emit(SerieDetailLoadFailure(e.toString() + stacktrace.toString()));
    }
  }
}

/// Movies
class MoviesBloc extends Bloc<ComicsEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {
    on<MoviesRequested>(_onMoviesRequested);
    on<HomeMoviesRequested>(_onHomeMoviesRequested);
    on<MovieDetailRequested>(_onMovieDetailRequested);
  }

  Future<void> _onMoviesRequested(
      MoviesRequested event, Emitter<MoviesState> emit) async {
    try {
      emit(MoviesLoadInProgress());
      final movies = await NetworkRequest().loadListMovies();

      emit(MoviesLoadSuccess(movies.results));
    } catch (e, stacktrace) {
      emit(MoviesLoadFailure(e.toString() + stacktrace.toString()));
    }
  }

  Future<void> _onHomeMoviesRequested(
      HomeMoviesRequested event, Emitter<MoviesState> emit) async {
    try {
      emit(MoviesLoadInProgress());
      final movies = await NetworkRequest().loadMovies();

      emit(MoviesLoadSuccess(movies.results));
    } catch (e, stacktrace) {
      emit(MoviesLoadFailure(e.toString() + stacktrace.toString()));
    }
  }

  Future<void> _onMovieDetailRequested(
      MovieDetailRequested event, Emitter<MoviesState> emit) async {
    try {
      emit(MovieDetailLoadInProgress());
      final movieDetailResponse =
          await NetworkRequest().loadMovieDetail(event.url);
      final movie = movieDetailResponse.results;

      emit(MovieDetailLoadSuccess(movie));
    } catch (e, stacktrace) {
      emit(MovieDetailLoadFailure(e.toString() + stacktrace.toString()));
    }
  }
}

/// Characters
class CharactersBloc extends Bloc<ComicsEvent, CharactersState> {
  CharactersBloc() : super(CharactersInitial()) {
    on<CharactersRequested>(_onCharactersRequested);
  }

  Future<void> _onCharactersRequested(
      CharactersRequested event, Emitter<CharactersState> emit) async {
    try {
      emit(CharactersLoadInProgress());
      final List<CharactersItem> characters = [];
      for (var url in event.urls) {
        final character = await NetworkRequest().loadCharacterDetails(url);
        characters.add(character.results);
      }

      emit(CharactersLoadSuccess(characters));
    } catch (e, stacktrace) {
      emit(CharactersLoadFailure(e.toString() + stacktrace.toString()));
    }
  }
}

/// Episodes
class EpisodesBloc extends Bloc<ComicsEvent, EpisodesState> {
  EpisodesBloc() : super(EpisodesInitial()) {
    on<EpisodesRequested>(_onEpisodesRequested);
  }
  Future<void> _onEpisodesRequested(
      EpisodesRequested event, Emitter<EpisodesState> emit) async {
    try {
      emit(EpisodesLoadInProgress());
      final List<EpisodeItem> episodes = [];
      for (var url in event.urls) {
        final episode = await NetworkRequest().loadEpisodeDetails(url);
        episodes.add(episode.result);
      }

      emit(EpisodesLoadSuccess(episodes));
    } catch (e, stacktrace) {
      emit(EpisodesLoadFailure(e.toString() + stacktrace.toString()));
    }
  }
}

/// Search
class SearchBloc extends Bloc<ComicsEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchRequested>(_onSearchRequested);
  }

  Future<void> _onSearchRequested(
      SearchRequested event, Emitter<SearchState> emit) async {
    try {
      emit(SearchLoadInProgress());
      debugPrint('Search Load In Progress');
      final searchIssueResults =
          await NetworkRequest().searchIssue(event.query);
      final searchCharacterResults =
          await NetworkRequest().searchCharacter(event.query);

      List<ComicItemDetail> comicItems = [];
      for (var issue in searchIssueResults.results) {
        final item = await NetworkRequest().loadComicDetail(issue.apiDetailUrl);
        comicItems.add(item.results);
      }

      List<CharactersItem> characterItems = [];
      for (var character in searchCharacterResults.results) {
        final item =
            await NetworkRequest().loadCharacterDetails(character.apiDetailUrl);
        characterItems.add(item.results);
      }

      emit(SearchLoadSuccess(comicItems, characterItems));
    } catch (e, stacktrace) {
      emit(SearchLoadFailure(e.toString() + stacktrace.toString()));
    }
  }
}
