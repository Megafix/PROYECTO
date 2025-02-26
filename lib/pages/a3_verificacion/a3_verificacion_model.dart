import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'a3_verificacion_widget.dart' show A3VerificacionWidget;
import 'package:flutter/material.dart';

class A3VerificacionModel extends FlutterFlowModel<A3VerificacionWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController1;
  FocusNode? pinCodeFocusNode1;
  String? Function(BuildContext, String?)? pinCodeController1Validator;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController2;
  FocusNode? pinCodeFocusNode2;
  String? Function(BuildContext, String?)? pinCodeController2Validator;

  @override
  void initState(BuildContext context) {
    pinCodeController1 = TextEditingController();
    pinCodeController2 = TextEditingController();
  }

  @override
  void dispose() {
    pinCodeFocusNode1?.dispose();
    pinCodeController1?.dispose();

    pinCodeFocusNode2?.dispose();
    pinCodeController2?.dispose();
  }
}
