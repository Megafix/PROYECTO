import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'a1_primer_pantalla_widget.dart' show A1PrimerPantallaWidget;
import 'package:flutter/material.dart';

class A1PrimerPantallaModel extends FlutterFlowModel<A1PrimerPantallaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
