import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'a7_cambiar_metodo_pago_widget.dart' show A7CambiarMetodoPagoWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
