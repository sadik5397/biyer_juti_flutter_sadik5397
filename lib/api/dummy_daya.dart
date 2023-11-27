import 'dart:math';

import 'package:biyer_juti/component/request_button.dart';

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
  static List<String> youtubeVideoIDs = ["JebT4Z-p6QI", "69ROC05QX1g", "I0mmGZAa3to", "b4JpCGcCv8k", "UmOIA2-MoEU", "t1Feq5jlUq0"];
  static List<String> months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
  static List<String> randomNames = [
    'Sakura Tanaka',
    'Raj Patel',
    'Li Wei',
    'Yukihiro Suzuki',
    'Mei Chen',
    'Haruka Nakamura',
    'Ravi Kapoor',
    'Ji-hoon Kim',
    'Ananya Gupta',
    'Takashi Yamamoto',
    'Lei Wang',
    'Ayesha Khan',
    'Hiroshi Tanaka',
    'Priya Sharma',
    'Kazuki Sato',
    'Shan Li',
    'Arjun Singh',
    'Xia Liu',
    'Min-ji Park',
    'Rahul Verma',
    'Mai Nguyen',
    'Kenta Yoshida',
    'Siti Nurul Azizah',
    'Rajesh Patel',
    'Lina Chen',
    'Satoshi Suzuki',
    'Nina Kapoor',
    'Jin Chen',
    'Anushka Sharma',
    'Yusuke Tanaka',
    'Aisha Khan',
    'Chen Wei',
    'Hana Kim',
    'Rahul Kumar',
    'Hiroko Takahashi',
    'Sanjay Kumar',
    'Miyuki Nakamura',
    'Arjun Sharma',
    'Mei Lin',
    'Akio Yamamoto',
    'Fatima Ali',
    'Takeshi Sato',
    'Amir Khan',
    'Yuki Saito',
    'Sara Ahmed',
    'Hong Wu',
    'Jin-ho Lee'
  ];
  static List<String> randomNameList(int count) => (List<String>.from(randomNames)..shuffle(Random())).take(count).toList();
}
