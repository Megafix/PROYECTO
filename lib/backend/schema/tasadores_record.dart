import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasadoresRecord extends FirestoreRecord {
  TasadoresRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "tid" field.
  String? _tid;
  String get tid => _tid ?? '';
  bool hasTid() => _tid != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "services" field.
  List<String>? _services;
  List<String> get services => _services ?? const [];
  bool hasServices() => _services != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phone = snapshotData['phone'] as String?;
    _tid = snapshotData['tid'] as String?;
    _password = snapshotData['password'] as String?;
    _role = snapshotData['role'] as String?;
    _services = getDataList(snapshotData['services']);
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('tasadores');

  static Stream<TasadoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasadoresRecord.fromSnapshot(s));

  static Future<TasadoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasadoresRecord.fromSnapshot(s));

  static TasadoresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TasadoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasadoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasadoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasadoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasadoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasadoresRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phone,
  String? tid,
  String? password,
  String? role,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone': phone,
      'tid': tid,
      'password': password,
      'role': role,
    }.withoutNulls,
  );

  return firestoreData;
}

class TasadoresRecordDocumentEquality implements Equality<TasadoresRecord> {
  const TasadoresRecordDocumentEquality();

  @override
  bool equals(TasadoresRecord? e1, TasadoresRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phone == e2?.phone &&
        e1?.tid == e2?.tid &&
        e1?.password == e2?.password &&
        e1?.role == e2?.role &&
        listEquality.equals(e1?.services, e2?.services);
  }

  @override
  int hash(TasadoresRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phone,
        e?.tid,
        e?.password,
        e?.role,
        e?.services
      ]);

  @override
  bool isValidKey(Object? o) => o is TasadoresRecord;
}
