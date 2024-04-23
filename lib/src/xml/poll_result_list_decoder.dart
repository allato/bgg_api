import 'package:bgg_api/src/model/poll_result.dart';
import 'package:bgg_api/src/xml/poll_result_value_decoder.dart';
import 'package:xml/xml.dart';

import 'decoder.dart';

class PollResultListDecoder extends XmlDecoder<PollResult> {
  const PollResultListDecoder();

  final PollResultValueDecoder valuesDecoder = const PollResultValueDecoder();

  @override
  PollResult decode(XmlNode xml) => PollResult(
        numPlayers: readStringAttribute(xml, 'numplayers') ?? '',
        values: findElements(xml, 'result')
            .map((e) => valuesDecoder.decode(e))
            .toList(),
      );
}
