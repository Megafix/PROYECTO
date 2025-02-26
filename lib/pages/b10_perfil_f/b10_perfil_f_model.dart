import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'b10_perfil_f_widget.dart' show B10PerfilFWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class B10PerfilFModel extends FlutterFlowModel<B10PerfilFWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for UserNameTextField widget.
  FocusNode? userNameTextFieldFocusNode;
  TextEditingController? userNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      userNameTextFieldTextControllerValidator;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode1;
  TextEditingController? emailTextFieldTextController1;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController1Validator;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode2;
  TextEditingController? emailTextFieldTextController2;
  final emailTextFieldMask2 =
      MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)?
      emailTextFieldTextController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    userNameTextFieldFocusNode?.dispose();
    userNameTextFieldTextController?.dispose();

    emailTextFieldFocusNode1?.dispose();
    emailTextFieldTextController1?.dispose();

    emailTextFieldFocusNode2?.dispose();
    emailTextFieldTextController2?.dispose();
  }
}
