import 'package:video_ui/assets.dart';
import 'package:video_ui/models/Movie.dart';
import 'package:video_ui/models/Preview.dart';
import 'package:video_ui/translations/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

final List<Content> previews = const [
  Content(name: 'Taken', imageUrl: Assets.taken, titleUrl: Assets.taken_logo),
  Content(
      name: 'Batman', imageUrl: Assets.batman, titleUrl: Assets.batman_logo),
  Content(
      name: 'Fast & Furious',
      imageUrl: Assets.fast,
      titleUrl: Assets.fast_logo),
  Content(
      name: 'Hacksaw', imageUrl: Assets.hacksaw, titleUrl: Assets.hacksaw_logo),
];

final List<Movie> movies = [
  Movie(
      title: 'Taken',
      date: '2008',
      duration: '1H 33M',
      plot: '${LocaleKeys.plots_takenPlot.tr()}',
      imdb: '7.8',
      meta: '51',
      total: '570,203',
      pg: 'PG-13',
      imageUrl: Assets.taken),
  Movie(
      title: 'The Dark Knight',
      date: '2010',
      duration: '2H 32M',
      plot: '${LocaleKeys.plots_batmanPlot.tr()}',
      imdb: '9.0',
      meta: '84',
      total: '2.4M',
      pg: 'PG-13',
      imageUrl: Assets.batman),
  Movie(
      title: 'Fast & Furious',
      date: '2001',
      duration: '1H 46M',
      plot: '${LocaleKeys.plots_fastPlot.tr()}',
      imdb: '6.8',
      meta: '64',
      total: '360,473',
      pg: 'PG-13',
      imageUrl: Assets.fast_info),
  Movie(
      title: 'Hacksaw Ridge',
      date: '2016',
      duration: '2H 19M',
      imdb: '8.1',
      plot: '${LocaleKeys.plots_hacksawPlot.tr()}',
      meta: '71',
      total: '456,394',
      pg: 'R',
      imageUrl: Assets.hacksaw_info),
];
