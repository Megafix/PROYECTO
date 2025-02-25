import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdressRecord extends FirestoreRecord {
  AdressRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "direction" field.
  String? _direction;
  String get direction => _direction ?? '';
  bool hasDirection() => _direction != null;

  // "iud" field.
  String? _iud;
  String get iud => _iud ?? '';
  bool hasIud() => _iud != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _direction = snapshotData['direction'] as String?;
    _iud = snapshotData['iud'] as String?;
    _location = snapshotData['location'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('adress')
          : FirebaseFirestore.instanceFor(
                  app: Firebase.app(), databaseId: '(default)')
              .collectionGroup('adress');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('adress').doc(id);

  static Stream<AdressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdressRecord.fromSnapshot(s));

  static Future<AdressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdressRecord.fromSnapshot(s));

  static AdressRecord fromSnapshot(DocumentSnapshot snapshot) => AdressRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdressRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdressRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdressRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdressRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdressRecordData({
  String? direction,
  String? iud,
  String? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'direction': direction,
      'iud': iud,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdressRecordDocumentEquality implements Equality<AdressRecord> {
  const AdressRecordDocumentEquality();

  @override
  bool equals(AdressRecord? e1, AdressRecord? e2) {
    return e1?.direction == e2?.direction &&
        e1?.iud == e2?.iud &&
        e1?.location == e2?.location;
  }

  @override
  int hash(AdressRecord? e) =>
      const ListEquality().hash([e?.direction, e?.iud, e?.location]);

  @override
  bool isValidKey(Object? o) => o is AdressRecord;
}
