import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'a94_reportar_widget.dart' show A94ReportarWidget;
import 'package:flutter/material.dart';

class A94ReportarModel extends FlutterFlowModel<A94ReportarWidget> {
  ///  Local state fields for this page.

  String orderCount = '0';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (excel)] action in A9-4_Reportar widget.
  ApiCallResponse? apiResult16r;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for DropDownHs widget.
  String? dropDownHsValue;
  FormFieldController<String>? dropDownHsValueController;
  // State field(s) for DropDownDy widget.
  String? dropDownDyValue;
  FormFieldController<String>? dropDownDyValueController;
  // State field(s) for DropDownMth widget.
  String? dropDownMthValue;
  FormFieldController<String>? dropDownMthValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
