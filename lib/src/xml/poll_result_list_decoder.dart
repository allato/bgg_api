import 'package:bgg_api/src/model/poll.dart';
import 'package:xml/xml.dart';

import 'decoder.dart';

class PollDecoder extends XmlDecoder<Poll> {
  const PollDecoder();

  @override
  Poll decode(XmlNode xml) {
    return Poll(
      name: readStringAttribute(xml, 'name') ?? '',
      title: readStringAttribute(xml, 'title') ?? '',
      totalVotes: readIntAttribute(xml, 'totalvotes') ?? 0,
    );
  }
}
