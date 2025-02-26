import '/flutter_flow/flutter_flow_util.dart';
import 'a36_olvide_contrasea_widget.dart' show A36OlvideContraseaWidget;
import 'package:flutter/material.dart';

class A36OlvideContraseaModel
    extends FlutterFlowModel<A36OlvideContraseaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode;
  TextEditingController? userNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userNameTextFieldFocusNode?.dispose();
    userNameTextFieldTextController?.dispose();
  }
}
