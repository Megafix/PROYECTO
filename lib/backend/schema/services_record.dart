import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicesRecord extends FirestoreRecord {
  ServicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "service" field.
  String? _service;
  String get service => _service ?? '';
  bool hasService() => _service != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  bool hasPrice() => _price != null;

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  bool hasAdress() => _adress != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "orderid" field.
  String? _orderid;
  String get orderid => _orderid ?? '';
  bool hasOrderid() => _orderid != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _service = snapshotData['service'] as String?;
    _price = snapshotData['price'] as String?;
    _adress = snapshotData['adress'] as String?;
    _date = snapshotData['date'] as String?;
    _details = snapshotData['details'] as String?;
    _photo = snapshotData['photo'] as String?;
    _uid = snapshotData['uid'] as String?;
    _orderid = snapshotData['orderid'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('services')
          : FirebaseFirestore.instanceFor(
                  app: Firebase.app(), databaseId: '(default)')
              .collectionGroup('services');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('services').doc(id);

  static Stream<ServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicesRecord.fromSnapshot(s));

  static Future<ServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicesRecord.fromSnapshot(s));

  static ServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicesRecordData({
  String? service,
  String? price,
  String? adress,
  String? date,
  String? details,
  String? photo,
  String? uid,
  String? orderid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'service': service,
      'price': price,
      'adress': adress,
      'date': date,
      'details': details,
      'photo': photo,
      'uid': uid,
      'orderid': orderid,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicesRecordDocumentEquality implements Equality<ServicesRecord> {
  const ServicesRecordDocumentEquality();

  @override
  bool equals(ServicesRecord? e1, ServicesRecord? e2) {
    return e1?.service == e2?.service &&
        e1?.price == e2?.price &&
        e1?.adress == e2?.adress &&
        e1?.date == e2?.date &&
        e1?.details == e2?.details &&
        e1?.photo == e2?.photo &&
        e1?.uid == e2?.uid &&
        e1?.orderid == e2?.orderid;
  }

  @override
  int hash(ServicesRecord? e) => const ListEquality().hash([
        e?.service,
        e?.price,
        e?.adress,
        e?.date,
        e?.details,
        e?.photo,
        e?.uid,
        e?.orderid
      ]);

  @override
  bool isValidKey(Object? o) => o is ServicesRecord;
}
