import 'package:biyer_juti/component/RequestButton.dart';

class DummyData {
  static List<RequestState> currentRequestState = [
    RequestState.none,
    RequestState.requestPending,
    RequestState.contactInfo,
    RequestState.payNowForMobileNumber,
    RequestState.acceptContact,
    RequestState.requestContact,
    RequestState.none,
  ];
}
