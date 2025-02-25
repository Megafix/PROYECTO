import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/a9_1_rechazar_presupuesto/a91_rechazar_presupuesto_widget.dart';
import '/components/a9_5_pagar/a95_pagar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'a9_detalles_widget.dart' show A9DetallesWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class A9DetallesModel extends FlutterFlowModel<A9DetallesWidget> {
  ///  Local state fields for this page.

  bool liked = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for IDropDownHs widget.
  String? iDropDownHsValue;
  FormFieldController<String>? iDropDownHsValueController;
  // State field(s) for IDropDownDy widget.
  String? iDropDownDyValue;
  FormFieldController<String>? iDropDownDyValueController;
  // State field(s) for IDropDownMth widget.
  String? iDropDownMthValue;
  FormFieldController<String>? iDropDownMthValueController;
  // State field(s) for FDropDownHs widget.
  String? fDropDownHsValue;
  FormFieldController<String>? fDropDownHsValueController;
  // State field(s) for FDropDownDy widget.
  String? fDropDownDyValue;
  FormFieldController<String>? fDropDownDyValueController;
  // State field(s) for FDropDownMth widget.
  String? fDropDownMthValue;
  FormFieldController<String>? fDropDownMthValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
