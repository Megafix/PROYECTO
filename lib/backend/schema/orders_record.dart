import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "orderid" field.
  String? _orderid;
  String get orderid => _orderid ?? '';
  bool hasOrderid() => _orderid != null;

  // "services" field.
  String? _services;
  String get services => _services ?? '';
  bool hasServices() => _services != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

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

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  bool hasAdress() => _adress != null;

  // "prise" field.
  String? _prise;
  String get prise => _prise ?? '';
  bool hasPrise() => _prise != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "userid" field.
  String? _userid;
  String get userid => _userid ?? '';
  bool hasUserid() => _userid != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "materials" field.
  String? _materials;
  String get materials => _materials ?? '';
  bool hasMaterials() => _materials != null;

  // "hour" field.
  String? _hour;
  String get hour => _hour ?? '';
  bool hasHour() => _hour != null;

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  bool hasDay() => _day != null;

  // "mounth" field.
  String? _mounth;
  String get mounth => _mounth ?? '';
  bool hasMounth() => _mounth != null;

  // "fid" field.
  String? _fid;
  String get fid => _fid ?? '';
  bool hasFid() => _fid != null;

  // "work_prise" field.
  String? _workPrise;
  String get workPrise => _workPrise ?? '';
  bool hasWorkPrise() => _workPrise != null;

  // "work_hour" field.
  String? _workHour;
  String get workHour => _workHour ?? '';
  bool hasWorkHour() => _workHour != null;

  // "start_date" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  bool hasEndDate() => _endDate != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _orderid = snapshotData['orderid'] as String?;
    _services = snapshotData['services'] as String?;
    _status = snapshotData['status'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _adress = snapshotData['adress'] as String?;
    _prise = snapshotData['prise'] as String?;
    _details = snapshotData['details'] as String?;
    _userid = snapshotData['userid'] as String?;
    _uid = snapshotData['uid'] as String?;
    _materials = snapshotData['materials'] as String?;
    _hour = snapshotData['hour'] as String?;
    _day = snapshotData['day'] as String?;
    _mounth = snapshotData['mounth'] as String?;
    _fid = snapshotData['fid'] as String?;
    _workPrise = snapshotData['work_prise'] as String?;
    _workHour = snapshotData['work_hour'] as String?;
    _startDate = snapshotData['start_date'] as String?;
    _endDate = snapshotData['end_date'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: '(default)')
      .collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DateTime? createdTime,
  String? orderid,
  String? services,
  String? status,
  String? email,
  String? displayName,
  String? photoUrl,
  String? phoneNumber,
  String? adress,
  String? prise,
  String? details,
  String? userid,
  String? uid,
  String? materials,
  String? hour,
  String? day,
  String? mounth,
  String? fid,
  String? workPrise,
  String? workHour,
  String? startDate,
  String? endDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'orderid': orderid,
      'services': services,
      'status': status,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'adress': adress,
      'prise': prise,
      'details': details,
      'userid': userid,
      'uid': uid,
      'materials': materials,
      'hour': hour,
      'day': day,
      'mounth': mounth,
      'fid': fid,
      'work_prise': workPrise,
      'work_hour': workHour,
      'start_date': startDate,
      'end_date': endDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.orderid == e2?.orderid &&
        e1?.services == e2?.services &&
        e1?.status == e2?.status &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.adress == e2?.adress &&
        e1?.prise == e2?.prise &&
        e1?.details == e2?.details &&
        e1?.userid == e2?.userid &&
        e1?.uid == e2?.uid &&
        e1?.materials == e2?.materials &&
        e1?.hour == e2?.hour &&
        e1?.day == e2?.day &&
        e1?.mounth == e2?.mounth &&
        e1?.fid == e2?.fid &&
        e1?.workPrise == e2?.workPrise &&
        e1?.workHour == e2?.workHour &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.orderid,
        e?.services,
        e?.status,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.phoneNumber,
        e?.adress,
        e?.prise,
        e?.details,
        e?.userid,
        e?.uid,
        e?.materials,
        e?.hour,
        e?.day,
        e?.mounth,
        e?.fid,
        e?.workPrise,
        e?.workHour,
        e?.startDate,
        e?.endDate
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
