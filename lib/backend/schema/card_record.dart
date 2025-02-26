import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CardRecord extends FirestoreRecord {
  CardRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fullname" field.
  String? _fullname;
  String get fullname => _fullname ?? '';
  bool hasFullname() => _fullname != null;

  // "numbercard" field.
  String? _numbercard;
  String get numbercard => _numbercard ?? '';
  bool hasNumbercard() => _numbercard != null;

  // "ccv" field.
  String? _ccv;
  String get ccv => _ccv ?? '';
  bool hasCcv() => _ccv != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "iud" field.
  String? _iud;
  String get iud => _iud ?? '';
  bool hasIud() => _iud != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fullname = snapshotData['fullname'] as String?;
    _numbercard = snapshotData['numbercard'] as String?;
    _ccv = snapshotData['ccv'] as String?;
    _date = snapshotData['date'] as String?;
    _iud = snapshotData['iud'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('card')
          : FirebaseFirestore.instanceFor(
                  app: Firebase.app(), databaseId: '(default)')
              .collectionGroup('card');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('card').doc(id);

  static Stream<CardRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CardRecord.fromSnapshot(s));

  static Future<CardRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CardRecord.fromSnapshot(s));

  static CardRecord fromSnapshot(DocumentSnapshot snapshot) => CardRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CardRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CardRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CardRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CardRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCardRecordData({
  String? fullname,
  String? numbercard,
  String? ccv,
  String? date,
  String? iud,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fullname': fullname,
      'numbercard': numbercard,
      'ccv': ccv,
      'date': date,
      'iud': iud,
    }.withoutNulls,
  );

  return firestoreData;
}

class CardRecordDocumentEquality implements Equality<CardRecord> {
  const CardRecordDocumentEquality();

  @override
  bool equals(CardRecord? e1, CardRecord? e2) {
    return e1?.fullname == e2?.fullname &&
        e1?.numbercard == e2?.numbercard &&
        e1?.ccv == e2?.ccv &&
        e1?.date == e2?.date &&
        e1?.iud == e2?.iud;
  }

  @override
  int hash(CardRecord? e) => const ListEquality()
      .hash([e?.fullname, e?.numbercard, e?.ccv, e?.date, e?.iud]);

  @override
  bool isValidKey(Object? o) => o is CardRecord;
}
