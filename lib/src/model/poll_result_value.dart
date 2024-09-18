class PollValue {
  int? level;
  String value;
  int numVotes;

  PollValue({
    this.level,
    required this.value,
    required this.numVotes,
  });
  @override
  String toString() {
    return 'level:$level,numVotes:$numVotes,value:$value';
  }
}
