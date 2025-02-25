import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'b11_cambiar_contrasena_f_widget.dart' show B11CambiarContrasenaFWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class B11CambiarContrasenaFModel
    extends FlutterFlowModel<B11CambiarContrasenaFWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for NewPasswordTextField widget.
  FocusNode? newPasswordTextFieldFocusNode;
  TextEditingController? newPasswordTextFieldTextController;
  late bool newPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      newPasswordTextFieldTextControllerValidator;
  // State field(s) for ConfirmPasswordTextField widget.
  FocusNode? confirmPasswordTextFieldFocusNode;
  TextEditingController? confirmPasswordTextFieldTextController;
  late bool confirmPasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    newPasswordTextFieldVisibility = false;
    confirmPasswordTextFieldVisibility = false;
  }

  @override
  void dispose() {
    newPasswordTextFieldFocusNode?.dispose();
    newPasswordTextFieldTextController?.dispose();

    confirmPasswordTextFieldFocusNode?.dispose();
    confirmPasswordTextFieldTextController?.dispose();
  }
}
