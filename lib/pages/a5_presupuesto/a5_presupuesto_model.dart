import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'a5_presupuesto_widget.dart' show A5PresupuestoWidget;
import 'package:flutter/material.dart';

class A5PresupuestoModel extends FlutterFlowModel<A5PresupuestoWidget> {
  ///  Local state fields for this page.

  String orderCount = '0';

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for DropDownHs widget.
  String? dropDownHsValue;
  FormFieldController<String>? dropDownHsValueController;
  // State field(s) for DropDownDy widget.
  String? dropDownDyValue;
  FormFieldController<String>? dropDownDyValueController;
  // State field(s) for DropDownMth widget.
  String? dropDownMthValue;
  FormFieldController<String>? dropDownMthValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<OrdersRecord>? ordersCount;
  // Stores action output result for [Backend Call - API (mppayments)] action in Button widget.
  ApiCallResponse? paymentpre;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
