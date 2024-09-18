import 'dart:async';

import 'package:xml/xml.dart';

import 'api/family_parameters.dart';
import 'api/forum_list_parameters.dart';
import 'api/forum_parameters.dart';
import 'api/query_parameters.dart';
import 'api/search_parameters.dart';
import 'api/thing_parameters.dart';
import 'api/thing_type.dart';
import 'http.dart';
import 'model/board_game.dart';
import 'model/board_game_ref.dart';
import 'model/family.dart';
import 'model/forum.dart';
import 'model/item_ref.dart';
import 'utils/list.dart';
import 'xml/board_game_decoder.dart';
import 'xml/board_game_ref_decoder.dart';
import 'xml/decoder.dart';
import 'xml/family_decoder.dart';
import 'xml/forum_decoder.dart';
import 'xml/item_ref_decoder.dart';

/// A client for [BGG's API ver 2](https://boardgamegeek.com/wiki/page/BGG_XML_API2).
class Bgg {
  final BggHttp _http;

  Bgg({BggHttp? http}) : _http = http ?? BggHttp();

  /// Retrieve information about a particular board game by [gameId].
  Future<BoardGame?> getBoardGame(int gameId) async => _getFirstElement(
        ['thing'],
        const BoardGameDecoder(),
        ThingParameters(
          id: [gameId],
          type: [ThingType.boardgame, ThingType.boardgameexpansion],
        ),
      );

  /// Retrieve information about a particular thing.
  Future<BoardGame?> getThing(ThingParameters parameters) async =>
      _getFirstElement(['thing'], const BoardGameDecoder(), parameters);

  /// Retrieve information about things.
  Future<List<BoardGame>> getThings(
    ThingParameters parameters, {
    int limit = 30,
    int offset = 0,
  }) async =>
      _getAllElements(
        ['thing'],
        const BoardGameDecoder(),
        parameters,
        limit: limit,
        offset: offset,
      );

  /// Retrieve information about things.
  Future<Forum> getForum(ForumParameters parameters) async =>
      _getRoot(['forum'], const ForumDecoder(), parameters);

  /// Retrieve information about things.
  Future<List<Forum>> getForumList(
    ForumListParameters parameters, {
    int limit = 30,
    int offset = 0,
  }) async =>
      _getAllElements(
        ['forumlist'],
        const ForumDecoder(),
        parameters,
        limit: limit,
        offset: offset,
      );

  /// Retrieves a list of board games (only) matching [query].
  Future<List<BoardGameRef>> searchBoardGames(
    String query, {
    bool exact = false,
    int limit = 30,
    int offset = 0,
  }) async =>
      _getAllElements(
        ['search'],
        const BoardGameRefDecoder(),
        SearchParameters(
          query: query,
          type: [ThingType.boardgame],
          exact: exact,
        ),
        limit: limit,
        offset: offset,
      );

  /// Retrieves a list of all things matching [query].
  Future<List<Family>> getFamilyItems(
    FamilyParameters parameters, {
    int limit = 30,
    int offset = 0,
  }) async =>
      _getAllElements(
        ['family'],
        const FamilyDecoder(),
        parameters,
        limit: limit,
        offset: offset,
      );

  /// Retrieves a list of all things matching [query].
  Future<List<ItemRef>> searchThings(
    SearchParameters parameters, {
    int limit = 30,
    int offset = 0,
  }) async =>
      _getAllElements(
        ['search'],
        const ItemRefDecoder(),
        parameters,
        limit: limit,
        offset: offset,
      );

  Future<T> _getRoot<T>(
    List<String> path,
    XmlDecoder<T> decoder,
    QueryParameters parameters,
  ) async {
    final xml = (await _http.get(path, queryParameters: parameters.toMap()))
        .rootElement;
    return decoder.decode(xml);
  }

  Future<T?> _getFirstElement<T>(
    List<String> path,
    XmlDecoder<T> decoder,
    QueryParameters parameters,
  ) async {
    final xml = (await _http.get(path, queryParameters: parameters.toMap()))
        .rootElement
        .children
        .firstWhereOrNull((e) => e.nodeType == XmlNodeType.ELEMENT);
    return xml != null ? decoder.decode(xml) : null;
  }

  Future<List<T>> _getAllElements<T>(
    List<String> path,
    XmlDecoder<T> decoder,
    QueryParameters parameters, {
    int limit = 30,
    int offset = 0,
  }) async {
    final xml = (await _http.get(path, queryParameters: parameters.toMap()))
        .rootElement
        .children
        .where((e) => e.nodeType == XmlNodeType.ELEMENT);
    return xml.map((e) => decoder.decode(e)).skip(offset).take(limit).toList();
  }
}
