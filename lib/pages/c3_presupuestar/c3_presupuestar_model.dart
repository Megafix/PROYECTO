import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/c4_presupuesto_exitoso/c4_presupuesto_exitoso_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'c3_presupuestar_widget.dart' show C3PresupuestarWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class C3PresupuestarModel extends FlutterFlowModel<C3PresupuestarWidget> {
  ///  Local state fields for this page.

  String orderCount = '0';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (excel)] action in C3_Presupuestar widget.
  ApiCallResponse? apiResult16r;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDownTT1 widget.
  String? dropDownTT1Value;
  FormFieldController<String>? dropDownTT1ValueController;
  // State field(s) for TextFieldC widget.
  FocusNode? textFieldCFocusNode;
  TextEditingController? textFieldCTextController;
  String? Function(BuildContext, String?)? textFieldCTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDownTT2 widget.
  String? dropDownTT2Value;
  FormFieldController<String>? dropDownTT2ValueController;
  // State field(s) for TextFieldC2 widget.
  FocusNode? textFieldC2FocusNode;
  TextEditingController? textFieldC2TextController;
  String? Function(BuildContext, String?)? textFieldC2TextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for DropDownTT3 widget.
  String? dropDownTT3Value;
  FormFieldController<String>? dropDownTT3ValueController;
  // State field(s) for TextFieldC3 widget.
  FocusNode? textFieldC3FocusNode;
  TextEditingController? textFieldC3TextController;
  String? Function(BuildContext, String?)? textFieldC3TextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue4;
  FormFieldController<String>? dropDownValueController4;
  // State field(s) for DropDownTT4 widget.
  String? dropDownTT4Value;
  FormFieldController<String>? dropDownTT4ValueController;
  // State field(s) for TextFieldC4 widget.
  FocusNode? textFieldC4FocusNode;
  TextEditingController? textFieldC4TextController;
  String? Function(BuildContext, String?)? textFieldC4TextControllerValidator;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldCFocusNode?.dispose();
    textFieldCTextController?.dispose();

    textFieldC2FocusNode?.dispose();
    textFieldC2TextController?.dispose();

    textFieldC3FocusNode?.dispose();
    textFieldC3TextController?.dispose();

    textFieldC4FocusNode?.dispose();
    textFieldC4TextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController6?.dispose();
  }
}
