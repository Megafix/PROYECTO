import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'c8_reportar_t_widget.dart' show C8ReportarTWidget;
import 'package:flutter/material.dart';

class C8ReportarTModel extends FlutterFlowModel<C8ReportarTWidget> {
  ///  Local state fields for this page.

  String orderCount = '0';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (excel)] action in C8_ReportarT widget.
  ApiCallResponse? apiResult16r;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();
  }
}
