import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'a94_reportar_model.dart';
export 'a94_reportar_model.dart';

class A94ReportarWidget extends StatefulWidget {
  const A94ReportarWidget({super.key});

  static String routeName = 'A9-4_Reportar';
  static String routePath = 'a94Reportar';

  @override
  State<A94ReportarWidget> createState() => _A94ReportarWidgetState();
}

class _A94ReportarWidgetState extends State<A94ReportarWidget> {
  late A94ReportarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => A94ReportarModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult16r = await ExcelCall.call();
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<OrdersRecord>>(
      stream: queryOrdersRecord(
        queryBuilder: (ordersRecord) => ordersRecord.where(
          'orderid',
          isEqualTo: _model.textController1.text,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitDualRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        List<OrdersRecord> a94ReportarOrdersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final a94ReportarOrdersRecord = a94ReportarOrdersRecordList.isNotEmpty
            ? a94ReportarOrdersRecordList.first
            : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 50.0,
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    context.pop();
                                  },
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        50.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'me7a27v3' /* Presupuesto */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'Baloo 2',
                                            color: Colors.white,
                                            fontSize: 30.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                  titlePadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                ),
                elevation: 2.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: () {
                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                      return 470.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointMedium) {
                      return 600.0;
                    } else if (MediaQuery.sizeOf(context).width <
                        kBreakpointLarge) {
                      return 900.0;
                    } else {
                      return 800.0;
                    }
                  }(),
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 10.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 110.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'o906gjhk' /* Email: */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Baloo 2',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 26.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 200.0,
                                              child: TextFormField(
                                                controller:
                                                    _model.textController1,
                                                focusNode:
                                                    _model.textFieldFocusNode1,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Baloo 2',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '40xrwgc4' /* ... */,
                                                  ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Baloo 2',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .grey3,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Baloo 2',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                cursorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                validator: _model
                                                    .textController1Validator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 5.0)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: StreamBuilder<List<OrdersRecord>>(
                                      stream: queryOrdersRecord(
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 40.0,
                                              height: 40.0,
                                              child: SpinKitDualRing(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 40.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<OrdersRecord>
                                            buttonOrdersRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final buttonOrdersRecord =
                                            buttonOrdersRecordList.isNotEmpty
                                                ? buttonOrdersRecordList.first
                                                : null;

                                        return FFButtonWidget(
                                          onPressed: () async {
                                            if (_model.dropDownValue ==
                                                'El trabajo esta mal hecho/no terminado') {
                                              await buttonOrdersRecord!
                                                  .reference
                                                  .update(
                                                      createOrdersRecordData(
                                                status: 'Arreglando',
                                                day: _model.dropDownDyValue,
                                                hour: _model.dropDownHsValue,
                                                mounth: _model.dropDownMthValue,
                                              ));
                                            } else if (_model.dropDownValue ==
                                                'La conducta del trabajador') {
                                              await launchUrl(Uri(
                                                  scheme: 'mailto',
                                                  path:
                                                      'rhpositivoservicios@gmail.com',
                                                  query: {
                                                    'subject':
                                                        'Reporte de trabajador',
                                                    'body':
                                                        '${_model.textController2.text}${'Email del cliente:${_model.textController1.text}'}',
                                                  }
                                                      .entries
                                                      .map((MapEntry<String,
                                                                  String>
                                                              e) =>
                                                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                      .join('&')));
                                            } else if (_model.dropDownValue ==
                                                'Otro') {
                                              await launchUrl(Uri(
                                                  scheme: 'mailto',
                                                  path:
                                                      'rhpositivoservicios@gmail.com',
                                                  query: {
                                                    'subject':
                                                        'Reporta problema el clien',
                                                    'body':
                                                        '${_model.textController2.text}${'Email del cliente:${_model.textController1.text}'}',
                                                  }
                                                      .entries
                                                      .map((MapEntry<String,
                                                                  String>
                                                              e) =>
                                                          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                      .join('&')));
                                            } else {
                                              return;
                                            }

                                            context.pushNamed(
                                                A8MisServiciosWidget.routeName);
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'f33jv25e' /* Reportar */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 56.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Baloo 2',
                                                      color: Colors.white,
                                                      fontSize: 30.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'hfo4dxyu' /* Reporte el problema */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Baloo 2',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 20.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(null),
                                      options: [
                                        FFLocalizations.of(context).getText(
                                          'yk49bdre' /* El trabajo esta mal hecho/no t... */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'fvlf4vu2' /* La conducta del trabajador */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'vp0vk75w' /* Otro */,
                                        )
                                      ],
                                      onChanged: (val) => safeSetState(
                                          () => _model.dropDownValue = val),
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Baloo 2',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'z7gp78wo' /* Que tipo de problema es */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: Colors.transparent,
                                      borderWidth: 0.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                  if (_model.dropDownValue ==
                                      'El trabajo esta mal hecho/no terminado')
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .lightGrey,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 5.0, 5.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'av9g4sty' /* Okey, enviaremos un supervisor... */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Baloo 2',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  if (_model.dropDownValue ==
                                      'El trabajo esta mal hecho/no terminado')
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownHsValueController ??=
                                              FormFieldController<String>(null),
                                          options: [
                                            FFLocalizations.of(context).getText(
                                              'ymuvi0pl' /* 08 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'imp0fy9u' /* 09 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'b7vb74u8' /* 10 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'u0gm5ij0' /* 11 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'mzv958wl' /* 12 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '858ohaqx' /* 13 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'zo5l3umi' /* 14 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'pyx1jjtz' /* 15 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'u735n4yc' /* 16 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'xnme86n4' /* 17 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'wtipjthj' /* 18 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '0cqwp60w' /* 19 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'ldbqm6ri' /* 20 */,
                                            )
                                          ],
                                          onChanged: (val) => safeSetState(() =>
                                              _model.dropDownHsValue = val),
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          height: 40.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Baloo 2',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'q87fhqwk' /* Hora */,
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .grey3,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 0.0, 0.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                        FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownDyValueController ??=
                                              FormFieldController<String>(null),
                                          options: [
                                            FFLocalizations.of(context).getText(
                                              'k5ns8erx' /* 1 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '8jirpo94' /* 2 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'pzw0xc3t' /* 3 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              't9ww4pcx' /* 4 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'c0aas2do' /* 5 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'vnvu1em8' /* 6 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '9h4p3vex' /* 7 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '0rin2blu' /* 8 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'dn9rte02' /* 9 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'c68l22zk' /* 10 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'aq105h3u' /* 11 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'mfdoqrwn' /* 12 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'djed2d8d' /* 13 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              's60vnbdg' /* 14 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'qeivl7l6' /* 15 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '4jcd1i1l' /* 16 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'htjq8qw3' /* 17 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'm8jrn23g' /* 18 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'u91vmdf9' /* 19 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'oq8fvxza' /* 20 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '5w2e5jd1' /* 21 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'byv38v6k' /* 22 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'b5hdmb4s' /* 23 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '5r1d8z0i' /* 24 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'jexkliv3' /* 25 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'sghs0nj7' /* 26 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'jwoolcik' /* 27 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              '00aqgqfo' /* 28 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'e5houzr5' /* 29 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'h92mrkaf' /* 30 */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'qfu9eg3m' /* 31 */,
                                            )
                                          ],
                                          onChanged: (val) => safeSetState(() =>
                                              _model.dropDownDyValue = val),
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          height: 40.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Baloo 2',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            '7hbmwn9k' /* Dia */,
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .grey3,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 0.0, 0.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                        FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownMthValueController ??=
                                              FormFieldController<String>(null),
                                          options: [
                                            FFLocalizations.of(context).getText(
                                              'z2040izi' /* Enero */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'ru9lkpel' /* Febrero */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'jozmep1b' /* Marzo */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'zjnzjzgp' /* Abril */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'hlwg4qdz' /* Mayo */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'eutp4m1l' /* Junio */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'mw7frxzs' /* Julio */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              's87xyian' /* Agosto */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'chndphj0' /* Septiembre */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'w9qlcg6t' /* Octubre */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'q9lj1p1y' /* Noviembre */,
                                            ),
                                            FFLocalizations.of(context).getText(
                                              'o8lczoni' /* Diciembre */,
                                            )
                                          ],
                                          onChanged: (val) => safeSetState(() =>
                                              _model.dropDownMthValue = val),
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.3,
                                          height: 40.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Baloo 2',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'btqilkp1' /* Mes */,
                                          ),
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .grey3,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 0.0, 0.0, 0.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ].divide(SizedBox(width: 0.0)),
                                    ),
                                  if ((_model.dropDownValue ==
                                          'La conducta del trabajador') ||
                                      (_model.dropDownValue == 'Otro'))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.9,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .grey3,
                                        ),
                                        child: Container(
                                          width: 200.0,
                                          child: TextFormField(
                                            controller: _model.textController2,
                                            focusNode:
                                                _model.textFieldFocusNode2,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Baloo 2',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'bb8qfdp0' /* Describe el problema... */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Baloo 2',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Baloo 2',
                                                  letterSpacing: 0.0,
                                                ),
                                            maxLines: 7,
                                            minLines: 4,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .textController2Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
