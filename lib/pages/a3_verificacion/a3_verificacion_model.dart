import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/a3_5_register_success_modal/a35_register_success_modal_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'a3_verificacion_widget.dart' show A3VerificacionWidget;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
