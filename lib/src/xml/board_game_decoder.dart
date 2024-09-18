import 'package:bgg_api/src/xml/generic_decoder.dart';
import 'package:bgg_api/src/xml/poll_decoder.dart';
import 'package:bgg_api/src/xml/video_decoder.dart';
import 'package:xml/xml.dart';

import '../model/board_game.dart';
import 'decoder.dart';

class BoardGameDecoder extends XmlDecoder<BoardGame> {
  const BoardGameDecoder();

  final VideoDecoder videoDecoder = const VideoDecoder();
  final PollDecoder pollDecoder = const PollDecoder();
  final GenericDecoder genericDecoder = const GenericDecoder();

  @override
  BoardGame decode(XmlNode xml) => BoardGame(
        id: readId(xml),
        name: readStringValueWithAttribute(xml, 'name', 'type', 'primary'),
        description: readStringUnescaped(xml, 'description'),
        yearPublished: readIntValue(xml, 'yearpublished'),
        minPlayers: readIntValue(xml, 'minplayers'),
        maxPlayers: readIntValue(xml, 'maxplayers'),
        playingTime: readIntValue(xml, 'playingtime'),
        minPlayTime: readIntValue(xml, 'minplaytime'),
        maxPlayTime: readIntValue(xml, 'maxplaytime'),
        minAge: readIntValue(xml, 'minage'),
        thumbnail: readUri(xml, 'thumbnail'),
        image: readUri(xml, 'image'),
        pollSuggestedNumPlayers: findElements(xml, 'poll')
            .where((e) => e.getAttribute('name') == 'suggested_numplayers')
            .map((e) => pollDecoder.decode(e))
            .first,
        pollSuggestedPlayerAge: findElements(xml, 'poll')
            .where((e) => e.getAttribute('name') == 'suggested_playerage')
            .map((e) => pollDecoder.decode(e))
            .first,
        pollLanguageDependence: findElements(xml, 'poll')
            .where((e) => e.getAttribute('name') == 'language_dependence')
            .map((e) => pollDecoder.decode(e))
            .first,
        videos: findElements(getElement(xml, 'videos'), 'video')
            .map((e) => videoDecoder.decode(e))
            .toList(),
        names: findElements(xml, 'name')
            .map((e) => e.getAttribute('value'))
            .whereType<String>()
            .toList(),
        boardGameFamily: findElements(xml, 'link')
            .where((e) => e.getAttribute('type') == 'boardgamefamily')
            .map((e) => genericDecoder.decode(e))
            .toList(),
        boardGameMechanic: findElements(xml, 'link')
            .where((e) => e.getAttribute('type') == 'boardgamemechanic')
            .map((e) => genericDecoder.decode(e))
            .toList(),
        boardGameCategory: findElements(xml, 'link')
            .where((e) => e.getAttribute('type') == 'boardgamecategory')
            .map((e) => genericDecoder.decode(e))
            .toList(),
        boardGameExpansion: findElements(xml, 'link')
            .where((e) => e.getAttribute('type') == 'boardgameexpansion')
            .map((e) => genericDecoder.decode(e))
            .toList(),
        boardGameAccessory: findElements(xml, 'link')
            .where((e) => e.getAttribute('type') == 'boardgameaccessory')
            .map((e) => genericDecoder.decode(e))
            .toList(),
        boardGameImplementation: findElements(xml, 'link')
            .where((e) => e.getAttribute('type') == 'boardgameimplementation')
            .map((e) => genericDecoder.decode(e))
            .toList(),
        boardGameDesigner: findElements(xml, 'link')
            .where((e) => e.getAttribute('type') == 'boardgamedesigner')
            .map((e) => genericDecoder.decode(e))
            .toList(),
        boardGameArtist: findElements(xml, 'link')
            .where((e) => e.getAttribute('type') == 'boardgameartist')
            .map((e) => genericDecoder.decode(e))
            .toList(),
        boardGamePublisher: findElements(xml, 'link')
            .where((e) => e.getAttribute('type') == 'boardgamepublisher')
            .map((e) => genericDecoder.decode(e))
            .toList(),
      );
}
