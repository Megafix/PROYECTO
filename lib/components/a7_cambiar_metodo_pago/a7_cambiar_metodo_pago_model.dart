import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a7_cambiar_metodo_pago_widget.dart' show A7CambiarMetodoPagoWidget;
import 'package:flutter/material.dart';

class A7CambiarMetodoPagoModel
    extends FlutterFlowModel<A7CambiarMetodoPagoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  Map<CardRecord, bool> checkboxValueMap = {};
  List<CardRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
