import 'package:bgg_api/src/model/poll_result_value.dart';

class PollResult {
  String? numPlayers;
  List<PollValue> values;

  PollResult({
    this.numPlayers,
    this.values = const [],
  });

  int get totalVotes =>
      values.fold(0, (prev, element) => prev + element.numVotes);

  @override
  String toString() {
      return 'numPlayers:$numPlayers,values:${values.join(',\n')}';
  }
}
