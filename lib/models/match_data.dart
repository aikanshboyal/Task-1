

class MatchData {
  final String name;
  final int id;
  final String email;
  final String gender;
  final String status;

  MatchData(
      {required this.email,
      required this.gender,
      required this.id,
      required this.name,
      required this.status});

  factory MatchData.fromJson(Map<String, dynamic> json) {
    return MatchData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      status: json['status'],
    );
  }

  static List<MatchData> dataFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return MatchData.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Data{name: $name, id: $id, email: $email, gender: $gender, status: $status}';
  }
}
