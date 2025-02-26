import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FreelancersRecord extends FirestoreRecord {
  FreelancersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "service" field.
  String? _service;
  String get service => _service ?? '';
  bool hasService() => _service != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "fid" field.
  String? _fid;
  String get fid => _fid ?? '';
  bool hasFid() => _fid != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "userid" field.
  String? _userid;
  String get userid => _userid ?? '';
  bool hasUserid() => _userid != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "working" field.
  bool? _working;
  bool get working => _working ?? false;
  bool hasWorking() => _working != null;

  // "rating" field.
  String? _rating;
  String get rating => _rating ?? '';
  bool hasRating() => _rating != null;

  // "countof_works" field.
  String? _countofWorks;
  String get countofWorks => _countofWorks ?? '';
  bool hasCountofWorks() => _countofWorks != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _phone = snapshotData['phone'] as String?;
    _password = snapshotData['password'] as String?;
    _service = snapshotData['service'] as String?;
    _role = snapshotData['role'] as String?;
    _fid = snapshotData['fid'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userid = snapshotData['userid'] as String?;
    _uid = snapshotData['uid'] as String?;
    _working = snapshotData['working'] as bool?;
    _rating = snapshotData['rating'] as String?;
    _countofWorks = snapshotData['countof_works'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('freelancers');

  static Stream<FreelancersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FreelancersRecord.fromSnapshot(s));

  static Future<FreelancersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FreelancersRecord.fromSnapshot(s));

  static FreelancersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FreelancersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FreelancersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FreelancersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FreelancersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FreelancersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFreelancersRecordData({
  String? email,
  String? phone,
  String? password,
  String? service,
  String? role,
  String? fid,
  String? displayName,
  String? photoUrl,
  DateTime? createdTime,
  String? phoneNumber,
  String? userid,
  String? uid,
  bool? working,
  String? rating,
  String? countofWorks,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'phone': phone,
      'password': password,
      'service': service,
      'role': role,
      'fid': fid,
      'display_name': displayName,
      'photo_url': photoUrl,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'userid': userid,
      'uid': uid,
      'working': working,
      'rating': rating,
      'countof_works': countofWorks,
    }.withoutNulls,
  );

  return firestoreData;
}

class FreelancersRecordDocumentEquality implements Equality<FreelancersRecord> {
  const FreelancersRecordDocumentEquality();

  @override
  bool equals(FreelancersRecord? e1, FreelancersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.phone == e2?.phone &&
        e1?.password == e2?.password &&
        e1?.service == e2?.service &&
        e1?.role == e2?.role &&
        e1?.fid == e2?.fid &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userid == e2?.userid &&
        e1?.uid == e2?.uid &&
        e1?.working == e2?.working &&
        e1?.rating == e2?.rating &&
        e1?.countofWorks == e2?.countofWorks;
  }

  @override
  int hash(FreelancersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.phone,
        e?.password,
        e?.service,
        e?.role,
        e?.fid,
        e?.displayName,
        e?.photoUrl,
        e?.createdTime,
        e?.phoneNumber,
        e?.userid,
        e?.uid,
        e?.working,
        e?.rating,
        e?.countofWorks
      ]);

  @override
  bool isValidKey(Object? o) => o is FreelancersRecord;
}
