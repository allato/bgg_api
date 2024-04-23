import 'package:bgg_api/src/model/poll_result_value.dart';
import 'package:xml/xml.dart';

import 'decoder.dart';

class PollResultValueDecoder extends XmlDecoder<PollValue> {
  const PollResultValueDecoder();

  @override
  PollValue decode(XmlNode xml) => PollValue(
        level: readIntAttribute(xml, 'level'),
        value: readStringAttribute(xml, 'value') ?? '',
        numVotes: readIntAttribute(xml, 'numvotes') ?? 0,
      );
}
