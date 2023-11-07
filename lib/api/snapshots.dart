import '../util/global_function.dart';
import 'dummy_daya.dart';

Future<List<ProfileData>> fetchData() async {
  // Replace this with your actual data fetching logic
  await Future.delayed(const Duration(seconds: 1));
  return List.generate(
      40,
      (index) => ProfileData(
            id: index,
            online: index % 3 == 0,
            premium: index % 4 == 0,
            hearted: index % 2 == 0,
            match: index % 5 == 0,
            requestState: DummyData.currentRequestState[randomNumber(DummyData.currentRequestState.length)].toString(),
          ));
}

class ProfileData {
  final int id;
  final bool online;
  final bool premium;
  final bool hearted;
  final bool match;
  final String requestState;

  ProfileData({required this.id, required this.online, required this.premium, required this.hearted, required this.match, required this.requestState});

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json['id'],
      online: json['online'],
      premium: json['premium'],
      hearted: json['hearted'],
      match: json['match'],
      requestState: json['requestState'],
    );
  }
}
