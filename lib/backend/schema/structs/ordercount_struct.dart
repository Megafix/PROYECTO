// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdercountStruct extends FFFirebaseStruct {
  OrdercountStruct({
    List<int>? ordercount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ordercount = ordercount,
        super(firestoreUtilData);

  // "ordercount" field.
  List<int>? _ordercount;
  List<int> get ordercount => _ordercount ?? const [];
  set ordercount(List<int>? val) => _ordercount = val;

  void updateOrdercount(Function(List<int>) updateFn) {
    updateFn(_ordercount ??= []);
  }

  bool hasOrdercount() => _ordercount != null;

  static OrdercountStruct fromMap(Map<String, dynamic> data) =>
      OrdercountStruct(
        ordercount: getDataList(data['ordercount']),
      );

  static OrdercountStruct? maybeFromMap(dynamic data) => data is Map
      ? OrdercountStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ordercount': _ordercount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ordercount': serializeParam(
          _ordercount,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static OrdercountStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrdercountStruct(
        ordercount: deserializeParam<int>(
          data['ordercount'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'OrdercountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OrdercountStruct &&
        listEquality.equals(ordercount, other.ordercount);
  }

  @override
  int get hashCode => const ListEquality().hash([ordercount]);
}

OrdercountStruct createOrdercountStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrdercountStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrdercountStruct? updateOrdercountStruct(
  OrdercountStruct? ordercountStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ordercountStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrdercountStructData(
  Map<String, dynamic> firestoreData,
  OrdercountStruct? ordercountStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ordercountStruct == null) {
    return;
  }
  if (ordercountStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ordercountStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ordercountStructData =
      getOrdercountFirestoreData(ordercountStruct, forFieldValue);
  final nestedData =
      ordercountStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ordercountStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrdercountFirestoreData(
  OrdercountStruct? ordercountStruct, [
  bool forFieldValue = false,
]) {
  if (ordercountStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ordercountStruct.toMap());

  // Add any Firestore field values
  ordercountStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrdercountListFirestoreData(
  List<OrdercountStruct>? ordercountStructs,
) =>
    ordercountStructs
        ?.map((e) => getOrdercountFirestoreData(e, true))
        .toList() ??
    [];
