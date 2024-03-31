import 'package:bgg_api/src/model/pool.dart';
import 'package:xml/xml.dart';

import 'decoder.dart';

class PoolDecoder extends XmlDecoder<Pool> {
  const PoolDecoder();

  @override
  Pool decode(XmlNode xml) {
    return Pool(
      id: readIntAttribute(xml, 'id'),
      title: readStringAttribute(xml, 'title'),
      category: readStringAttribute(xml, 'category'),
      language: readStringAttribute(xml, 'language'),
      link: readStringAttribute(xml, 'link'),
      username: readStringAttribute(xml, 'username'),
      userId: readIntAttribute(xml, 'userid'),
      postDate: readStringAttribute(xml, 'postdate'),
    );
  }
}
