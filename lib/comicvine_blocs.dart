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
    on<ComicDetailRequested>(_onComicDetailRequested);
  }

  Future<void> _onComicsRequested(
      ComicsRequested event, Emitter<ComicsState> emit) async {
    try {
      emit(ComicsLoadInProgress());
      final comics = await NetworkRequest().loadListComics();

      emit(ComicsLoadSuccess(comics.results));
    } catch (_) {
      emit(ComicsLoadFailure());
    }
  }

  Future<void> _onComicDetailRequested(
      ComicDetailRequested event, Emitter<ComicsState> emit) async {
    try {
      emit(ComicDetailLoadInProgress());
      final comicDetailResponse = await NetworkRequest().loadComicDetail(event.url);
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
      debugPrint('Error: $e');
      debugPrint('Stacktrace: $stacktrace');
      emit(ComicDetailLoadFailure());
    }
  }
}

/// Series
class SeriesBloc extends Bloc<ComicsEvent, SeriesState> {
  SeriesBloc() : super(SeriesInitial()) {
    on<SeriesRequested>(_onSeriesRequested);
    on<SerieDetailRequested>(_onSerieDetailRequested);
  }

  Future<void> _onSeriesRequested(
      SeriesRequested event, Emitter<SeriesState> emit) async {
    try {
      emit(SeriesLoadInProgress());
      final series = await NetworkRequest().loadSeries();

      emit(SeriesLoadSuccess(series.results));
    } catch (_) {
      emit(SeriesLoadFailure());
    }
  }

  Future<void> _onSerieDetailRequested(
      SerieDetailRequested event, Emitter<SeriesState> emit) async {
    try {
      emit(SerieDetailLoadInProgress());
      final seriesDetailResponse = await NetworkRequest().loadSeriesDetail(event.url);
      final serie = seriesDetailResponse.results;
      final characters = serie.charactersUrls;

      emit(SerieDetailLoadSuccess(serie, characters));
    } catch (e, stacktrace) {
      debugPrint('Error: $e');
      debugPrint('Stacktrace: $stacktrace');
      emit(SerieDetailLoadFailure());
    }
  }
}

/// Movies
class MoviesBloc extends Bloc<ComicsEvent, MoviesState> {
  MoviesBloc() : super(MoviesInitial()) {
    on<MoviesRequested>(_onMoviesRequested);
    on<MovieDetailRequested>(_onMovieDetailRequested);
  }

  Future<void> _onMoviesRequested(
      MoviesRequested event, Emitter<MoviesState> emit) async {
    try {
      emit(MoviesLoadInProgress());
      final movies = await NetworkRequest().loadMovies();

      emit(MoviesLoadSuccess(movies.results));
    } catch (_) {
      emit(MoviesLoadFailure());
    }
  }

  Future<void> _onMovieDetailRequested(
      MovieDetailRequested event, Emitter<MoviesState> emit) async {
    try {
      emit(MovieDetailLoadInProgress());
      final movieDetailResponse = await NetworkRequest().loadMovieDetail(event.url);
      final movie = movieDetailResponse.results;

      emit(MovieDetailLoadSuccess(movie));
    } catch (e, stacktrace) {
      debugPrint('Error: $e');
      debugPrint('Stacktrace: $stacktrace');
      emit(MovieDetailLoadFailure());
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
      debugPrint('Error: $e');
      debugPrint('Stacktrace: $stacktrace');
      emit(CharactersLoadFailure());
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
    } catch (_) {
      emit(EpisodesLoadFailure());
    }
  }
}
