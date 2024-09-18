import 'package:bgg_api/src/model/poll.dart';
import 'package:bgg_api/src/xml/poll_result_list_decoder.dart';
import 'package:xml/xml.dart';

import 'decoder.dart';

class PollDecoder extends XmlDecoder<Poll> {
  const PollDecoder();
  final PollResultListDecoder resultsDecoder = const PollResultListDecoder();

  @override
  Poll decode(XmlNode xml) => Poll(
        name: readStringAttribute(xml, 'name') ?? '',
        title: readStringAttribute(xml, 'title') ?? '',
        totalVotes: readIntAttribute(xml, 'totalvotes') ?? 0,
        results: findElements(xml, 'results')
            .map((e) => resultsDecoder.decode(e))
            .toList(),
      );
}
