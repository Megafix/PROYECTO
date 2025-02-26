import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'a95_pagar_widget.dart' show A95PagarWidget;
import 'package:flutter/material.dart';

class A95PagarModel extends FlutterFlowModel<A95PagarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (mppayments)] action in Button widget.
  ApiCallResponse? paymentapro;
  // Stores action output result for [Backend Call - API (mppayments)] action in Button widget.
  ApiCallResponse? paymentfin;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
