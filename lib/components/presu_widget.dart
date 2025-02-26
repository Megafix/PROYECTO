import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'presu_model.dart';
export 'presu_model.dart';

class PresuWidget extends StatefulWidget {
  const PresuWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
    this.parameter6,
  });

  final dynamic parameter1;
  final dynamic parameter2;
  final dynamic parameter3;
  final dynamic parameter4;
  final dynamic parameter5;
  final dynamic parameter6;

  @override
  State<PresuWidget> createState() => _PresuWidgetState();
}

class _PresuWidgetState extends State<PresuWidget> {
  late PresuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PresuModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
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
            final columnExcelResponse = snapshot.data!;

            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: FlutterFlowDropDown<String>(
                    controller: _model.dropDownValueController1 ??=
                        FormFieldController<String>(null),
                    options: [
                      FFLocalizations.of(context).getText(
                        '5hjkwkhk' /* ALBAÑIL */,
                      ),
                      FFLocalizations.of(context).getText(
                        'pzjrlmqh' /* PLOMERO */,
                      ),
                      FFLocalizations.of(context).getText(
                        '0urxejvk' /* GASISTA */,
                      ),
                      FFLocalizations.of(context).getText(
                        '1ucfdkgj' /* ELECTRICISTA */,
                      ),
                      FFLocalizations.of(context).getText(
                        'zavqnwcv' /* JARDINERIA Y PAISAJISMO */,
                      ),
                      FFLocalizations.of(context).getText(
                        'ue1wiu6d' /* TECHISTA */,
                      ),
                      FFLocalizations.of(context).getText(
                        'kur7k55q' /* PINTOR */,
                      ),
                      FFLocalizations.of(context).getText(
                        '3pwjhrjp' /* TECNICO DE AIRE */,
                      ),
                      FFLocalizations.of(context).getText(
                        'xops7m7s' /* CARPINTERO */,
                      ),
                      FFLocalizations.of(context).getText(
                        'c3ae1uk6' /* CONSTRUCCIÓN Y ARQUITECTURA */,
                      ),
                      FFLocalizations.of(context).getText(
                        '5scyf7s2' /* DECORACION */,
                      ),
                      FFLocalizations.of(context).getText(
                        'eqx0u22b' /* TECNICO EN ELECTRODOMESTICOS */,
                      ),
                      FFLocalizations.of(context).getText(
                        '0t221d5u' /* PEQUEÑOS ARREGLOS */,
                      )
                    ],
                    onChanged: (val) =>
                        safeSetState(() => _model.dropDownValue1 = val),
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 48.5,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Baloo 2',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                        ),
                    hintText: FFLocalizations.of(context).getText(
                      '007te46b' /* Tipo de servicio */,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).grey3,
                    elevation: 2.0,
                    borderColor: Colors.transparent,
                    borderWidth: 0.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
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
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController2 ??=
                            FormFieldController<String>(null),
                        options: () {
                          if (_model.dropDownValue1 == 'PINTOR') {
                            return (getJsonField(
                              columnExcelResponse.jsonBody,
                              r'''$.rubros[3:18]
''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList();
                          } else if (_model.dropDownValue1 ==
                              'CONSTRUCCIÓN Y ARQUITECTURA') {
                            return (getJsonField(
                              columnExcelResponse.jsonBody,
                              r'''$.rubros[20:26]
''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList();
                          } else if (_model.dropDownValue1 == 'ELECTRICISTA') {
                            return (getJsonField(
                              columnExcelResponse.jsonBody,
                              r'''$.rubros[28:52]''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList();
                          } else if (_model.dropDownValue1 ==
                              'TECNICO DE AIRE') {
                            return (getJsonField(
                              columnExcelResponse.jsonBody,
                              r'''$.rubros''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList();
                          } else if (_model.dropDownValue1 == 'DECORACION') {
                            return (getJsonField(
                              columnExcelResponse.jsonBody,
                              r'''$.rubros''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList();
                          } else if (_model.dropDownValue1 == 'PLOMERO') {
                            return (getJsonField(
                              columnExcelResponse.jsonBody,
                              r'''$.rubros''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList();
                          } else if (_model.dropDownValue1 == 'GASISTA') {
                            return (getJsonField(
                              columnExcelResponse.jsonBody,
                              r'''$.rubros''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList();
                          } else if (_model.dropDownValue1 == 'ALBAÑIL') {
                            return (getJsonField(
                              columnExcelResponse.jsonBody,
                              r'''$.rubros''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList();
                          } else if (_model.dropDownValue1 == 'TECHISTA') {
                            return (getJsonField(
                              columnExcelResponse.jsonBody,
                              r'''$.rubros''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList();
                          } else if (_model.dropDownValue1 ==
                              'JARDINERIA Y PAISAJISMO') {
                            return (getJsonField(
                              columnExcelResponse.jsonBody,
                              r'''$.rubros''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList();
                          } else if (_model.dropDownValue1 == 'CARPINTERO') {
                            return (getJsonField(
                              columnExcelResponse.jsonBody,
                              r'''$.rubros''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList();
                          } else if (_model.dropDownValue1 ==
                              'PEQUEÑOS ARREGLOS') {
                            return (getJsonField(
                              columnExcelResponse.jsonBody,
                              r'''$.rubros''',
                              true,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList();
                          } else {
                            return columnExcelResponse.jsonBody;
                          }
                        }()
                            .where((e) => widget.parameter1!)
                            .toList(),
                        onChanged: (val) =>
                            safeSetState(() => _model.dropDownValue2 = val),
                        width: 200.0,
                        height: 40.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Baloo 2',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'qmv5zpug' /* Tipo de trabajo */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
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
                    Expanded(
                      child: Container(
                        width: 200.0,
                        child: TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Baloo 2',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              '4ofwyeme' /* Cantidad */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Baloo 2',
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Baloo 2',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                          maxLength: 7,
                          buildCounter: (context,
                                  {required currentLength,
                                  required isFocused,
                                  maxLength}) =>
                              null,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
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
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 20.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '4w5lt4r9' /* Cantidad de dias */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Baloo 2',
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Container(
                      width: 120.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: FlutterFlowCountController(
                        decrementIconBuilder: (enabled) => Icon(
                          Icons.remove_rounded,
                          color: enabled
                              ? FlutterFlowTheme.of(context).secondaryText
                              : FlutterFlowTheme.of(context).alternate,
                          size: 20.0,
                        ),
                        incrementIconBuilder: (enabled) => Icon(
                          Icons.add_rounded,
                          color: enabled
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).alternate,
                          size: 20.0,
                        ),
                        countBuilder: (count) => Text(
                          count.toString(),
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Baloo 2',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        count: _model.countControllerValue ??= 0,
                        updateCount: (count) => safeSetState(
                            () => _model.countControllerValue = count),
                        stepSize: 1,
                        contentPadding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                      ),
                    ),
                  ],
                ),
              ]
                  .divide(SizedBox(height: 10.0))
                  .addToStart(SizedBox(height: 0.0)),
            );
          },
        ),
      ),
    );
  }
}
