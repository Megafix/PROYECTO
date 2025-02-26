import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/c4_presupuesto_exitoso/c4_presupuesto_exitoso_widget.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'c3_presupuestar_model.dart';
export 'c3_presupuestar_model.dart';

class C3PresupuestarWidget extends StatefulWidget {
  const C3PresupuestarWidget({super.key});

  static String routeName = 'C3_Presupuestar';
  static String routePath = 'c3Presupuestar';

  @override
  State<C3PresupuestarWidget> createState() => _C3PresupuestarWidgetState();
}

class _C3PresupuestarWidgetState extends State<C3PresupuestarWidget> {
  late C3PresupuestarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => C3PresupuestarModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult16r = await ExcelCall.call();
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textFieldCTextController ??= TextEditingController();
    _model.textFieldCFocusNode ??= FocusNode();

    _model.textFieldC2TextController ??= TextEditingController();
    _model.textFieldC2FocusNode ??= FocusNode();

    _model.textFieldC3TextController ??= TextEditingController();
    _model.textFieldC3FocusNode ??= FocusNode();

    _model.textFieldC4TextController ??= TextEditingController();
    _model.textFieldC4FocusNode ??= FocusNode();

    _model.textController6 ??= TextEditingController();
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
        List<OrdersRecord> c3PresupuestarOrdersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final c3PresupuestarOrdersRecord =
            c3PresupuestarOrdersRecordList.isNotEmpty
                ? c3PresupuestarOrdersRecordList.first
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
                                        '0y2o0kjd' /* Presupuesto */,
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
              child: FutureBuilder<ApiCallResponse>(
                future: ExcelCall.call(),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: SpinKitDualRing(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 40.0,
                        ),
                      ),
                    );
                  }
                  final stackExcelResponse = snapshot.data!;

                  return Container(
                    width: double.infinity,
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
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'w7q7c4oj' /* Order ID: */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Baloo 2',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: 150.0,
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController1,
                                                    focusNode: _model
                                                        .textFieldFocusNode1,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Baloo 2',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'kl3va22b' /* ... */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Baloo 2',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grey3,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Baloo 2',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          lineHeight: 0.5,
                                                        ),
                                                    maxLines: null,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                            onPressed: ((_model.textController1
                                                                .text ==
                                                            '') ||
                                                    (_model.dropDownValue1 ==
                                                            null ||
                                                        _model.dropDownValue1 ==
                                                            '') ||
                                                    (_model.dropDownTT1Value ==
                                                            null ||
                                                        _model.dropDownTT1Value ==
                                                            '') ||
                                                    (_model.textFieldCTextController
                                                                .text ==
                                                            '') ||
                                                    (_model.countControllerValue ==
                                                        null) ||
                                                    (_model.textController6
                                                                .text ==
                                                            ''))
                                                ? null
                                                : () async {
                                                    await authManager
                                                        .refreshUser();
                                                    var _shouldSetState = false;
                                                    if (currentUserEmailVerified) {
                                                      _model.cobro =
                                                          await MercadopagoCall
                                                              .call();

                                                      _shouldSetState = true;
                                                      await queryOrdersRecordOnce(
                                                        queryBuilder:
                                                            (ordersRecord) =>
                                                                ordersRecord
                                                                    .where(
                                                          'orderid',
                                                          isEqualTo: _model
                                                              .textController1
                                                              .text,
                                                        ),
                                                        singleRecord: true,
                                                      ).then(
                                                          (s) => s.firstOrNull);

                                                      await buttonOrdersRecord!
                                                          .reference
                                                          .update(
                                                              createOrdersRecordData(
                                                        services:
                                                            '${_model.dropDownValue1}${_model.dropDownValue2}${_model.dropDownValue3}${_model.dropDownValue4}',
                                                        status: 'Aprobacion',
                                                        materials: _model
                                                            .textController6
                                                            .text,
                                                        workPrise:
                                                            valueOrDefault<
                                                                double>(
                                                          functions.excelcost(),
                                                          0.0,
                                                        ),
                                                        workHour: _model
                                                            .countControllerValue
                                                            ?.toString(),
                                                      ));
                                                      FFAppState().prisework =
                                                          c3PresupuestarOrdersRecord!
                                                                  .workPrise /
                                                              2;
                                                      FFAppState()
                                                          .update(() {});
                                                    } else {
                                                      context.pushNamed(
                                                          C1InicioTasadorWidget
                                                              .routeName);

                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }

                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      enableDrag: false,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
                                                                .primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                C4PresupuestoExitosoWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));

                                                    context.pushNamed(
                                                        C2MisPresupuestosWidget
                                                            .routeName);

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                  },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '7xyt5kdg' /* Crear presupuesto */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 56.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              disabledColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 0.0, 0.0),
                          child: StreamBuilder<List<OrdersRecord>>(
                            stream: queryOrdersRecord(
                              queryBuilder: (ordersRecord) =>
                                  ordersRecord.where(
                                'orderid',
                                isEqualTo: _model.textController1.text,
                              ),
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
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40.0,
                                    ),
                                  ),
                                );
                              }
                              List<OrdersRecord> listViewOrdersRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final listViewOrdersRecord =
                                  listViewOrdersRecordList.isNotEmpty
                                      ? listViewOrdersRecordList.first
                                      : null;

                              return ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [
                                  Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: ExcelCall.call(),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child: SpinKitDualRing(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final columnExcelResponse =
                                                snapshot.data!;

                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .dropDownValueController1 ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options: [
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'denqc4rt' /* ALBAÑIL */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '5kfhuv1p' /* PLOMERO */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'i2n1k14h' /* GASISTA */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '96g7gmhf' /* ELECTRICISTA */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '37888lga' /* JARDINERIA Y PAISAJISMO */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '1vaozed6' /* TECHISTA */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '73kygx4v' /* PINTOR */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '3zd3r9d6' /* TECNICO DE AIRE */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'h2uass2z' /* CARPINTERO */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'b1mwkwf4' /* CONSTRUCCIÓN Y ARQUITECTURA */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'zzgh2emu' /* DECORACION */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '8wtuo5st' /* TECNICO EN ELECTRODOMESTICOS */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '31pa3t6w' /* PEQUEÑOS ARREGLOS */,
                                                      )
                                                    ],
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .dropDownValue1 =
                                                            val),
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 48.5,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Baloo 2',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'zln1jd74' /* Tipo de servicio */,
                                                    ),
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .grey3,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    hidesUnderline: true,
                                                    isOverButton: false,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .dropDownTT1ValueController ??=
                                                            FormFieldController<
                                                                String>(null),
                                                        options: () {
                                                          if (_model
                                                                  .dropDownValue1 ==
                                                              'PINTOR') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros[3:18]
''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue1 ==
                                                              'CONSTRUCCIÓN Y ARQUITECTURA') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros[20:26]
''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue1 ==
                                                              'ELECTRICISTA') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros[28:52]''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue1 ==
                                                              'TECNICO DE AIRE') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue1 ==
                                                              'DECORACION') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue1 ==
                                                              'PLOMERO') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue1 ==
                                                              'GASISTA') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue1 ==
                                                              'ALBAÑIL') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue1 ==
                                                              'TECHISTA') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue1 ==
                                                              'JARDINERIA Y PAISAJISMO') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue1 ==
                                                              'CARPINTERO') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue1 ==
                                                              'PEQUEÑOS ARREGLOS') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else {
                                                            return columnExcelResponse
                                                                .jsonBody;
                                                          }
                                                        }()
                                                            .where((e) => (_model
                                                                    .apiResult16r
                                                                    ?.jsonBody ??
                                                                ''))
                                                            .toList(),
                                                        onChanged: (val) =>
                                                            safeSetState(() =>
                                                                _model.dropDownTT1Value =
                                                                    val),
                                                        width: 200.0,
                                                        height: 40.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Baloo 2',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'soer03gv' /* Tipo de trabajo */,
                                                        ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderWidth: 0.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        width: 200.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textFieldCTextController,
                                                          focusNode: _model
                                                              .textFieldCFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Baloo 2',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'm6oklih7' /* Cantidad */,
                                                            ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Baloo 2',
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Baloo 2',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          maxLength: 7,
                                                          buildCounter: (context,
                                                                  {required currentLength,
                                                                  required isFocused,
                                                                  maxLength}) =>
                                                              null,
                                                          keyboardType:
                                                              const TextInputType
                                                                  .numberWithOptions(
                                                                  decimal:
                                                                      true),
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .textFieldCTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .allow(RegExp(
                                                                    '[0-9]'))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 10.0))
                                                  .addToStart(
                                                      SizedBox(height: 0.0)),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: ExcelCall.call(),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child: SpinKitDualRing(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final columnExcelResponse =
                                                snapshot.data!;

                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .dropDownValueController2 ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options: [
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ed69wt0j' /* ALBAÑIL */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ahznnvyk' /* PLOMERO */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'nx6s8nhg' /* GASISTA */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ghcoksyo' /* ELECTRICISTA */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '39tnu965' /* JARDINERIA Y PAISAJISMO */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'z4hqxtt9' /* TECHISTA */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '2kez0g4w' /* PINTOR */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'uk537d60' /* TECNICO DE AIRE */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'zu928wnh' /* CARPINTERO */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'ro9ecnp0' /* CONSTRUCCIÓN Y ARQUITECTURA */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'eo55fku2' /* DECORACION */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'dtmhss7g' /* TECNICO EN ELECTRODOMESTICOS */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'z28g2k8p' /* PEQUEÑOS ARREGLOS */,
                                                      )
                                                    ],
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .dropDownValue2 =
                                                            val),
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 48.5,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Baloo 2',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'q523hh0x' /* Tipo de servicio */,
                                                    ),
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .grey3,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    hidesUnderline: true,
                                                    isOverButton: false,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .dropDownTT2ValueController ??=
                                                            FormFieldController<
                                                                String>(null),
                                                        options: () {
                                                          if (_model
                                                                  .dropDownValue2 ==
                                                              'PINTOR') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros[3:18]
''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue2 ==
                                                              'CONSTRUCCIÓN Y ARQUITECTURA') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros[20:26]
''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue2 ==
                                                              'ELECTRICISTA') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros[28:52]''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue2 ==
                                                              'TECNICO DE AIRE') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue2 ==
                                                              'DECORACION') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue2 ==
                                                              'PLOMERO') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue2 ==
                                                              'GASISTA') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue2 ==
                                                              'ALBAÑIL') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue2 ==
                                                              'TECHISTA') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue2 ==
                                                              'JARDINERIA Y PAISAJISMO') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue2 ==
                                                              'CARPINTERO') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue2 ==
                                                              'PEQUEÑOS ARREGLOS') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else {
                                                            return columnExcelResponse
                                                                .jsonBody;
                                                          }
                                                        }()
                                                            .where((e) => (_model
                                                                    .apiResult16r
                                                                    ?.jsonBody ??
                                                                ''))
                                                            .toList(),
                                                        onChanged: (val) =>
                                                            safeSetState(() =>
                                                                _model.dropDownTT2Value =
                                                                    val),
                                                        width: 200.0,
                                                        height: 40.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Baloo 2',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          'oojo6xe9' /* Tipo de trabajo */,
                                                        ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderWidth: 0.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        width: 200.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textFieldC2TextController,
                                                          focusNode: _model
                                                              .textFieldC2FocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Baloo 2',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'v1oi3bck' /* Cantidad */,
                                                            ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Baloo 2',
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Baloo 2',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          maxLength: 7,
                                                          buildCounter: (context,
                                                                  {required currentLength,
                                                                  required isFocused,
                                                                  maxLength}) =>
                                                              null,
                                                          keyboardType:
                                                              const TextInputType
                                                                  .numberWithOptions(
                                                                  decimal:
                                                                      true),
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .textFieldC2TextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .allow(RegExp(
                                                                    '[0-9]'))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 10.0))
                                                  .addToStart(
                                                      SizedBox(height: 0.0)),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: ExcelCall.call(),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 40.0,
                                                  height: 40.0,
                                                  child: SpinKitDualRing(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 40.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final columnExcelResponse =
                                                snapshot.data!;

                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .dropDownValueController3 ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options: [
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'pq1j4fbj' /* ALBAÑIL */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'qi1s86ei' /* PLOMERO */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'jl8ge6m2' /* GASISTA */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'mdj20woy' /* ELECTRICISTA */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'syo37u09' /* JARDINERIA Y PAISAJISMO */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'msnb5dyw' /* TECHISTA */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'tviyrifn' /* PINTOR */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '72qjq3k1' /* TECNICO DE AIRE */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'hl4adnwy' /* CARPINTERO */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'r05qfb02' /* CONSTRUCCIÓN Y ARQUITECTURA */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'm631k11b' /* DECORACION */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'adrv46se' /* TECNICO EN ELECTRODOMESTICOS */,
                                                      ),
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'arsqcc7k' /* PEQUEÑOS ARREGLOS */,
                                                      )
                                                    ],
                                                    onChanged: (val) =>
                                                        safeSetState(() => _model
                                                                .dropDownValue3 =
                                                            val),
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 48.5,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Baloo 2',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      '69lneqq5' /* Tipo de servicio */,
                                                    ),
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .grey3,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderWidth: 0.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    hidesUnderline: true,
                                                    isOverButton: false,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .dropDownTT3ValueController ??=
                                                            FormFieldController<
                                                                String>(null),
                                                        options: () {
                                                          if (_model
                                                                  .dropDownValue3 ==
                                                              'PINTOR') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros[3:18]
''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue3 ==
                                                              'CONSTRUCCIÓN Y ARQUITECTURA') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros[20:26]
''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue3 ==
                                                              'ELECTRICISTA') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros[28:52]''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue3 ==
                                                              'TECNICO DE AIRE') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue3 ==
                                                              'DECORACION') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue3 ==
                                                              'PLOMERO') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue3 ==
                                                              'GASISTA') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue3 ==
                                                              'ALBAÑIL') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue3 ==
                                                              'TECHISTA') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue3 ==
                                                              'JARDINERIA Y PAISAJISMO') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue3 ==
                                                              'CARPINTERO') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else if (_model
                                                                  .dropDownValue3 ==
                                                              'PEQUEÑOS ARREGLOS') {
                                                            return (getJsonField(
                                                              columnExcelResponse
                                                                  .jsonBody,
                                                              r'''$.rubros''',
                                                              true,
                                                            ) as List)
                                                                .map<String>((s) =>
                                                                    s.toString())
                                                                .toList();
                                                          } else {
                                                            return columnExcelResponse
                                                                .jsonBody;
                                                          }
                                                        }()
                                                            .where((e) => (_model
                                                                    .apiResult16r
                                                                    ?.jsonBody ??
                                                                ''))
                                                            .toList(),
                                                        onChanged: (val) =>
                                                            safeSetState(() =>
                                                                _model.dropDownTT3Value =
                                                                    val),
                                                        width: 200.0,
                                                        height: 40.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Baloo 2',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '3kjzmenn' /* Tipo de trabajo */,
                                                        ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderWidth: 0.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        width: 200.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textFieldC3TextController,
                                                          focusNode: _model
                                                              .textFieldC3FocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Baloo 2',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'ti1llvgv' /* Cantidad */,
                                                            ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Baloo 2',
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Baloo 2',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          maxLength: 7,
                                                          buildCounter: (context,
                                                                  {required currentLength,
                                                                  required isFocused,
                                                                  maxLength}) =>
                                                              null,
                                                          keyboardType:
                                                              const TextInputType
                                                                  .numberWithOptions(
                                                                  decimal:
                                                                      true),
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .textFieldC3TextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                          inputFormatters: [
                                                            FilteringTextInputFormatter
                                                                .allow(RegExp(
                                                                    '[0-9]'))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 10.0))
                                                  .addToStart(
                                                      SizedBox(height: 0.0)),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: ExcelCall.call(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 40.0,
                                                height: 40.0,
                                                child: SpinKitDualRing(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 40.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final columnExcelResponse =
                                              snapshot.data!;

                                          return Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, -1.0),
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .dropDownValueController4 ??=
                                                      FormFieldController<
                                                          String>(null),
                                                  options: [
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'shl3qxcj' /* ALBAÑIL */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '2axyns9f' /* PLOMERO */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'yp2czqfv' /* GASISTA */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '91zl4oyi' /* ELECTRICISTA */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'tlby4gbk' /* JARDINERIA Y PAISAJISMO */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'fmkgnjj5' /* TECHISTA */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'cveycjxl' /* PINTOR */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'qt64sygh' /* TECNICO DE AIRE */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'vzo4wdkg' /* CARPINTERO */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'suj9szaw' /* CONSTRUCCIÓN Y ARQUITECTURA */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '9fimkn8k' /* DECORACION */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'y1xh7j48' /* TECNICO EN ELECTRODOMESTICOS */,
                                                    ),
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'bnym9up7' /* PEQUEÑOS ARREGLOS */,
                                                    )
                                                  ],
                                                  onChanged: (val) =>
                                                      safeSetState(() => _model
                                                              .dropDownValue4 =
                                                          val),
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 48.5,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Baloo 2',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'b4vtax66' /* Tipo de servicio */,
                                                  ),
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .grey3,
                                                  elevation: 2.0,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0.0,
                                                  borderRadius: 8.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  hidesUnderline: true,
                                                  isOverButton: false,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .dropDownTT4ValueController ??=
                                                          FormFieldController<
                                                              String>(null),
                                                      options: () {
                                                        if (_model
                                                                .dropDownValue4 ==
                                                            'PINTOR') {
                                                          return (getJsonField(
                                                            columnExcelResponse
                                                                .jsonBody,
                                                            r'''$.rubros[3:18]
''',
                                                            true,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList();
                                                        } else if (_model
                                                                .dropDownValue4 ==
                                                            'CONSTRUCCIÓN Y ARQUITECTURA') {
                                                          return (getJsonField(
                                                            columnExcelResponse
                                                                .jsonBody,
                                                            r'''$.rubros[20:26]
''',
                                                            true,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList();
                                                        } else if (_model
                                                                .dropDownValue4 ==
                                                            'ELECTRICISTA') {
                                                          return (getJsonField(
                                                            columnExcelResponse
                                                                .jsonBody,
                                                            r'''$.rubros[28:52]''',
                                                            true,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList();
                                                        } else if (_model
                                                                .dropDownValue4 ==
                                                            'TECNICO DE AIRE') {
                                                          return (getJsonField(
                                                            columnExcelResponse
                                                                .jsonBody,
                                                            r'''$.rubros''',
                                                            true,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList();
                                                        } else if (_model
                                                                .dropDownValue4 ==
                                                            'DECORACION') {
                                                          return (getJsonField(
                                                            columnExcelResponse
                                                                .jsonBody,
                                                            r'''$.rubros''',
                                                            true,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList();
                                                        } else if (_model
                                                                .dropDownValue4 ==
                                                            'PLOMERO') {
                                                          return (getJsonField(
                                                            columnExcelResponse
                                                                .jsonBody,
                                                            r'''$.rubros''',
                                                            true,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList();
                                                        } else if (_model
                                                                .dropDownValue4 ==
                                                            'GASISTA') {
                                                          return (getJsonField(
                                                            columnExcelResponse
                                                                .jsonBody,
                                                            r'''$.rubros''',
                                                            true,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList();
                                                        } else if (_model
                                                                .dropDownValue4 ==
                                                            'ALBAÑIL') {
                                                          return (getJsonField(
                                                            columnExcelResponse
                                                                .jsonBody,
                                                            r'''$.rubros''',
                                                            true,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList();
                                                        } else if (_model
                                                                .dropDownValue4 ==
                                                            'TECHISTA') {
                                                          return (getJsonField(
                                                            columnExcelResponse
                                                                .jsonBody,
                                                            r'''$.rubros''',
                                                            true,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList();
                                                        } else if (_model
                                                                .dropDownValue4 ==
                                                            'JARDINERIA Y PAISAJISMO') {
                                                          return (getJsonField(
                                                            columnExcelResponse
                                                                .jsonBody,
                                                            r'''$.rubros''',
                                                            true,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList();
                                                        } else if (_model
                                                                .dropDownValue4 ==
                                                            'CARPINTERO') {
                                                          return (getJsonField(
                                                            columnExcelResponse
                                                                .jsonBody,
                                                            r'''$.rubros''',
                                                            true,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList();
                                                        } else if (_model
                                                                .dropDownValue4 ==
                                                            'PEQUEÑOS ARREGLOS') {
                                                          return (getJsonField(
                                                            columnExcelResponse
                                                                .jsonBody,
                                                            r'''$.rubros''',
                                                            true,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList();
                                                        } else {
                                                          return columnExcelResponse
                                                              .jsonBody;
                                                        }
                                                      }()
                                                          .where((e) => (_model
                                                                  .apiResult16r
                                                                  ?.jsonBody ??
                                                              ''))
                                                          .toList(),
                                                      onChanged: (val) =>
                                                          safeSetState(() =>
                                                              _model.dropDownTT4Value =
                                                                  val),
                                                      width: 200.0,
                                                      height: 40.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Baloo 2',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '0d5u5dbl' /* Tipo de trabajo */,
                                                      ),
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 0.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      width: 200.0,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textFieldC4TextController,
                                                        focusNode: _model
                                                            .textFieldC4FocusNode,
                                                        autofocus: false,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Baloo 2',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            '7subss4d' /* Cantidad */,
                                                          ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Baloo 2',
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Baloo 2',
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                        maxLength: 7,
                                                        buildCounter: (context,
                                                                {required currentLength,
                                                                required isFocused,
                                                                maxLength}) =>
                                                            null,
                                                        keyboardType:
                                                            const TextInputType
                                                                .numberWithOptions(
                                                                decimal: true),
                                                        cursorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        validator: _model
                                                            .textFieldC4TextControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[0-9]'))
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                20.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'xg3ulymt' /* Cantidad de horas */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Baloo 2',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 120.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      shape: BoxShape.rectangle,
                                                    ),
                                                    child:
                                                        FlutterFlowCountController(
                                                      decrementIconBuilder:
                                                          (enabled) => Icon(
                                                        Icons.remove_rounded,
                                                        color: enabled
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                        size: 20.0,
                                                      ),
                                                      incrementIconBuilder:
                                                          (enabled) => Icon(
                                                        Icons.add_rounded,
                                                        color: enabled
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                        size: 20.0,
                                                      ),
                                                      countBuilder: (count) =>
                                                          Text(
                                                        count.toString(),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .titleLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Baloo 2',
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                      count: _model
                                                          .countControllerValue ??= 0,
                                                      updateCount: (count) =>
                                                          safeSetState(() =>
                                                              _model.countControllerValue =
                                                                  count),
                                                      stepSize: 1,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ]
                                                .divide(SizedBox(height: 10.0))
                                                .addToStart(
                                                    SizedBox(height: 0.0)),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 200.0,
                                    child: TextFormField(
                                      controller: _model.textController6,
                                      focusNode: _model.textFieldFocusNode2,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Baloo 2',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'yimjq5k7' /* Materiales */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
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
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Baloo 2',
                                            letterSpacing: 0.0,
                                          ),
                                      maxLines: 4,
                                      minLines: 2,
                                      cursorColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      validator: _model.textController6Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'whp7696j' /* Describe el servicio/s que nec... */,
                              ),
                              textAlign: TextAlign.start,
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
                        ),
                        if (currentUserEmail ==
                            'gonzalez.ferreira.rafael@gmail.com')
                          Align(
                            alignment: AlignmentDirectional(-1.0, 1.0),
                            child: Text(
                              (String rubro, int cantidad, String costo) {
                                return (rubro = costo) * cantidad;
                              }(
                                  _model.dropDownTT1Value!,
                                  valueOrDefault<int>(
                                    int.tryParse(
                                        _model.textFieldCTextController.text),
                                    0,
                                  ),
                                  valueOrDefault<String>(
                                    ExcelCall.costo(
                                      stackExcelResponse.jsonBody,
                                    )
                                        ?.contains(_model.dropDownTT1Value)
                                        .toString(),
                                    '0',
                                  )),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Baloo 2',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 4.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        if (currentUserEmail ==
                            'gonzalez.ferreira.rafael@gmail.com')
                          Align(
                            alignment: AlignmentDirectional(-1.0, 1.0),
                            child: Text(
                              (String rubro, int cantidad, String costo) {
                                return (rubro = costo) * cantidad;
                              }(
                                  _model.dropDownTT2Value!,
                                  valueOrDefault<int>(
                                    int.tryParse(
                                        _model.textFieldC2TextController.text),
                                    0,
                                  ),
                                  valueOrDefault<String>(
                                    ExcelCall.costo(
                                      stackExcelResponse.jsonBody,
                                    )
                                        ?.contains(_model.dropDownTT2Value)
                                        .toString(),
                                    '0',
                                  )),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Baloo 2',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 4.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        if (currentUserEmail ==
                            'gonzalez.ferreira.rafael@gmail.com')
                          Align(
                            alignment: AlignmentDirectional(-1.0, 1.0),
                            child: Text(
                              (String rubro, int cantidad, String costo) {
                                return (rubro = costo) * cantidad;
                              }(
                                  _model.dropDownTT3Value!,
                                  valueOrDefault<int>(
                                    int.tryParse(
                                        _model.textFieldC3TextController.text),
                                    0,
                                  ),
                                  valueOrDefault<String>(
                                    ExcelCall.costo(
                                      stackExcelResponse.jsonBody,
                                    )
                                        ?.contains(_model.dropDownTT3Value)
                                        .toString(),
                                    '0',
                                  )),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Baloo 2',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 4.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        if (currentUserEmail ==
                            'gonzalez.ferreira.rafael@gmail.com')
                          Align(
                            alignment: AlignmentDirectional(-1.0, 1.0),
                            child: Text(
                              (String rubro, int cantidad, String costo) {
                                return (rubro = costo) * cantidad;
                              }(
                                  _model.dropDownTT4Value!,
                                  valueOrDefault<int>(
                                    int.tryParse(
                                        _model.textFieldC4TextController.text),
                                    0,
                                  ),
                                  valueOrDefault<String>(
                                    ExcelCall.costo(
                                      stackExcelResponse.jsonBody,
                                    )
                                        ?.contains(_model.dropDownTT4Value)
                                        .toString(),
                                    '0',
                                  )),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Baloo 2',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 4.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
