import '/flutter_flow/flutter_flow_util.dart';
import 'a71_anadir_nueva_tarjeta_widget.dart' show A71AnadirNuevaTarjetaWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class A71AnadirNuevaTarjetaModel
    extends FlutterFlowModel<A71AnadirNuevaTarjetaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CardNumberTextField widget.
  FocusNode? cardNumberTextFieldFocusNode;
  TextEditingController? cardNumberTextFieldTextController;
  String? Function(BuildContext, String?)?
      cardNumberTextFieldTextControllerValidator;
  // State field(s) for CardHolderNameTextField widget.
  FocusNode? cardHolderNameTextFieldFocusNode;
  TextEditingController? cardHolderNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      cardHolderNameTextFieldTextControllerValidator;
  // State field(s) for ExpiredTextField widget.
  FocusNode? expiredTextFieldFocusNode1;
  TextEditingController? expiredTextFieldTextController1;
  final expiredTextFieldMask1 = MaskTextInputFormatter(mask: '##/##');
  String? Function(BuildContext, String?)?
      expiredTextFieldTextController1Validator;
  // State field(s) for ExpiredTextField widget.
  FocusNode? expiredTextFieldFocusNode2;
  TextEditingController? expiredTextFieldTextController2;
  String? Function(BuildContext, String?)?
      expiredTextFieldTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cardNumberTextFieldFocusNode?.dispose();
    cardNumberTextFieldTextController?.dispose();

    cardHolderNameTextFieldFocusNode?.dispose();
    cardHolderNameTextFieldTextController?.dispose();

    expiredTextFieldFocusNode1?.dispose();
    expiredTextFieldTextController1?.dispose();

    expiredTextFieldFocusNode2?.dispose();
    expiredTextFieldTextController2?.dispose();
  }
}
