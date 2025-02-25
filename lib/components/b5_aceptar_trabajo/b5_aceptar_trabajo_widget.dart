import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'b5_aceptar_trabajo_model.dart';
export 'b5_aceptar_trabajo_model.dart';

class B5AceptarTrabajoWidget extends StatefulWidget {
  const B5AceptarTrabajoWidget({super.key});

  @override
  State<B5AceptarTrabajoWidget> createState() => _B5AceptarTrabajoWidgetState();
}

class _B5AceptarTrabajoWidgetState extends State<B5AceptarTrabajoWidget> {
  late B5AceptarTrabajoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => B5AceptarTrabajoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(),
        StreamBuilder<List<OrdersRecord>>(
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
                    color: FlutterFlowTheme.of(context).primary,
                    size: 40.0,
                  ),
                ),
              );
            }
            List<OrdersRecord> containerOrdersRecordList = snapshot.data!;
            // Return an empty Container when the item does not exist.
            if (snapshot.data!.isEmpty) {
              return Container();
            }
            final containerOrdersRecord = containerOrdersRecordList.isNotEmpty
                ? containerOrdersRecordList.first
                : null;

            return Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 30.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                icon: Icon(
                                  FFIcons.kx,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 14.0,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'w08giuea' /* Condiciones */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Baloo 2',
                                      fontSize: 29.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'oy2cw817' /* -Cuplir con los tiempos estima... */,
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Baloo 2',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                unselectedWidgetColor:
                                    FlutterFlowTheme.of(context).alternate,
                              ),
                              child: Checkbox(
                                value: _model.checkboxValue ??= true,
                                onChanged: (newValue) async {
                                  safeSetState(
                                      () => _model.checkboxValue = newValue!);
                                },
                                side: BorderSide(
                                  width: 2,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                checkColor: FlutterFlowTheme.of(context).info,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(B8LegalFWidget.routeName);
                              },
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'vsf2yw9f' /* Termino y condiciones */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Baloo 2',
                                      color: Color(0xFF4B39EF),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<List<FreelancersRecord>>(
                                  stream: queryFreelancersRecord(
                                    queryBuilder: (freelancersRecord) =>
                                        freelancersRecord.where(
                                      'uid',
                                      isEqualTo: valueOrDefault(
                                          currentUserDocument?.userid, ''),
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 40.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<FreelancersRecord>
                                        buttonFreelancersRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final buttonFreelancersRecord =
                                        buttonFreelancersRecordList.isNotEmpty
                                            ? buttonFreelancersRecordList.first
                                            : null;

                                    return FFButtonWidget(
                                      onPressed: () async {
                                        await containerOrdersRecord!.reference
                                            .update(createOrdersRecordData(
                                          status: 'En proceso',
                                          displayName: currentUserDisplayName,
                                          fid: buttonFreelancersRecord?.fid,
                                        ));
                                        Navigator.pop(context);

                                        context.pushNamed(
                                            B6DetallesdelServicioWidget
                                                .routeName);
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'hpyvwm5w' /* Aceptar servicio */,
                                      ),
                                      options: FFButtonOptions(
                                        height: 56.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 16.0, 24.0, 16.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Baloo 2',
                                              color: Colors.white,
                                              fontSize: 25.0,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 0.0)),
                    ),
                  ].divide(SizedBox(height: 0.0)),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
