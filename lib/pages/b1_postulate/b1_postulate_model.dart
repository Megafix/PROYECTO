import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'b1_postulate_widget.dart' show B1PostulateWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class B1PostulateModel extends FlutterFlowModel<B1PostulateWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
  // State field(s) for PasswordTextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldTextController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode3;
  TextEditingController? emailTextFieldTextController3;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController3Validator;

  @override
  void initState(BuildContext context) {
    passwordTextFieldVisibility = false;
  }

  @override
  void dispose() {
    userNameTextFieldFocusNode?.dispose();
    userNameTextFieldTextController?.dispose();

    emailTextFieldFocusNode1?.dispose();
    emailTextFieldTextController1?.dispose();

    emailTextFieldFocusNode2?.dispose();
    emailTextFieldTextController2?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldTextController?.dispose();

    emailTextFieldFocusNode3?.dispose();
    emailTextFieldTextController3?.dispose();
  }
}
