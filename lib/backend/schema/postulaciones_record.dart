import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostulacionesRecord extends FirestoreRecord {
  PostulacionesRecord._(
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

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "cv" field.
  String? _cv;
  String get cv => _cv ?? '';
  bool hasCv() => _cv != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _phone = snapshotData['phone'] as String?;
    _password = snapshotData['password'] as String?;
    _service = snapshotData['service'] as String?;
    _role = snapshotData['role'] as String?;
    _fid = snapshotData['fid'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _uid = snapshotData['uid'] as String?;
    _cv = snapshotData['cv'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('postulaciones');

  static Stream<PostulacionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostulacionesRecord.fromSnapshot(s));

  static Future<PostulacionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostulacionesRecord.fromSnapshot(s));

  static PostulacionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostulacionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostulacionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostulacionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostulacionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostulacionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostulacionesRecordData({
  String? email,
  String? phone,
  String? password,
  String? service,
  String? role,
  String? fid,
  String? displayName,
  DateTime? createdTime,
  String? phoneNumber,
  String? uid,
  String? cv,
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
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'uid': uid,
      'cv': cv,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostulacionesRecordDocumentEquality
    implements Equality<PostulacionesRecord> {
  const PostulacionesRecordDocumentEquality();

  @override
  bool equals(PostulacionesRecord? e1, PostulacionesRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.phone == e2?.phone &&
        e1?.password == e2?.password &&
        e1?.service == e2?.service &&
        e1?.role == e2?.role &&
        e1?.fid == e2?.fid &&
        e1?.displayName == e2?.displayName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.uid == e2?.uid &&
        e1?.cv == e2?.cv;
  }

  @override
  int hash(PostulacionesRecord? e) => const ListEquality().hash([
        e?.email,
        e?.phone,
        e?.password,
        e?.service,
        e?.role,
        e?.fid,
        e?.displayName,
        e?.createdTime,
        e?.phoneNumber,
        e?.uid,
        e?.cv
      ]);

  @override
  bool isValidKey(Object? o) => o is PostulacionesRecord;
}
