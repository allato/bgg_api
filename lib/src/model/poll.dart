import 'package:bgg_api/src/model/poll_result.dart';

class Poll {
  String name;
  String title;
  int totalVotes;
  List<PollResult> results;

  Poll({
    required this.name,
    required this.title,
    required this.totalVotes,
    required this.results,
  });
}
