import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.loggedIn
            ? A4InicioWidget()
            : A1PrimerPantallaWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? A4InicioWidget()
              : A1PrimerPantallaWidget(),
          routes: [
            FFRoute(
              name: A1PrimerPantallaWidget.routeName,
              path: A1PrimerPantallaWidget.routePath,
              builder: (context, params) => A1PrimerPantallaWidget(),
            ),
            FFRoute(
              name: A2CreaCuentaWidget.routeName,
              path: A2CreaCuentaWidget.routePath,
              builder: (context, params) => A2CreaCuentaWidget(),
            ),
            FFRoute(
              name: A3VerificacionWidget.routeName,
              path: A3VerificacionWidget.routePath,
              builder: (context, params) => A3VerificacionWidget(),
            ),
            FFRoute(
              name: A4InicioWidget.routeName,
              path: A4InicioWidget.routePath,
              builder: (context, params) => A4InicioWidget(),
            ),
            FFRoute(
              name: A8MisServiciosWidget.routeName,
              path: A8MisServiciosWidget.routePath,
              builder: (context, params) => A8MisServiciosWidget(),
            ),
            FFRoute(
              name: A9DetallesWidget.routeName,
              path: A9DetallesWidget.routePath,
              builder: (context, params) => A9DetallesWidget(),
            ),
            FFRoute(
              name: A5PresupuestoWidget.routeName,
              path: A5PresupuestoWidget.routePath,
              builder: (context, params) => A5PresupuestoWidget(),
            ),
            FFRoute(
              name: A72DIreccionWidget.routeName,
              path: A72DIreccionWidget.routePath,
              builder: (context, params) => A72DIreccionWidget(),
            ),
            FFRoute(
              name: A71AnadirNuevaTarjetaWidget.routeName,
              path: A71AnadirNuevaTarjetaWidget.routePath,
              builder: (context, params) => A71AnadirNuevaTarjetaWidget(),
            ),
            FFRoute(
              name: A13NotificacionesWidget.routeName,
              path: A13NotificacionesWidget.routePath,
              builder: (context, params) => A13NotificacionesWidget(),
            ),
            FFRoute(
              name: A14ConfiguracionWidget.routeName,
              path: A14ConfiguracionWidget.routePath,
              builder: (context, params) => A14ConfiguracionWidget(),
            ),
            FFRoute(
              name: A10PerfilWidget.routeName,
              path: A10PerfilWidget.routePath,
              builder: (context, params) => A10PerfilWidget(),
            ),
            FFRoute(
              name: A73CambiarContrasenaWidget.routeName,
              path: A73CambiarContrasenaWidget.routePath,
              builder: (context, params) => A73CambiarContrasenaWidget(),
            ),
            FFRoute(
              name: A11LegalWidget.routeName,
              path: A11LegalWidget.routePath,
              builder: (context, params) => A11LegalWidget(),
            ),
            FFRoute(
              name: A35IniciaSecionWidget.routeName,
              path: A35IniciaSecionWidget.routePath,
              builder: (context, params) => A35IniciaSecionWidget(),
            ),
            FFRoute(
              name: B1PostulateWidget.routeName,
              path: B1PostulateWidget.routePath,
              builder: (context, params) => B1PostulateWidget(),
            ),
            FFRoute(
              name: B2InicioFreelancerWidget.routeName,
              path: B2InicioFreelancerWidget.routePath,
              builder: (context, params) => B2InicioFreelancerWidget(),
            ),
            FFRoute(
              name: B3MisServiciosWidget.routeName,
              path: B3MisServiciosWidget.routePath,
              builder: (context, params) => B3MisServiciosWidget(),
            ),
            FFRoute(
              name: B4SolicitudesWidget.routeName,
              path: B4SolicitudesWidget.routePath,
              builder: (context, params) => B4SolicitudesWidget(),
            ),
            FFRoute(
              name: C1InicioTasadorWidget.routeName,
              path: C1InicioTasadorWidget.routePath,
              builder: (context, params) => C1InicioTasadorWidget(),
            ),
            FFRoute(
              name: C2MisPresupuestosWidget.routeName,
              path: C2MisPresupuestosWidget.routePath,
              builder: (context, params) => C2MisPresupuestosWidget(),
            ),
            FFRoute(
              name: C3PresupuestarWidget.routeName,
              path: C3PresupuestarWidget.routePath,
              builder: (context, params) => C3PresupuestarWidget(),
            ),
            FFRoute(
              name: B6DetallesdelServicioWidget.routeName,
              path: B6DetallesdelServicioWidget.routePath,
              builder: (context, params) => B6DetallesdelServicioWidget(),
            ),
            FFRoute(
              name: B7NotificacionesFWidget.routeName,
              path: B7NotificacionesFWidget.routePath,
              builder: (context, params) => B7NotificacionesFWidget(),
            ),
            FFRoute(
              name: C4NotificacionesTWidget.routeName,
              path: C4NotificacionesTWidget.routePath,
              builder: (context, params) => C4NotificacionesTWidget(),
            ),
            FFRoute(
              name: B8LegalFWidget.routeName,
              path: B8LegalFWidget.routePath,
              builder: (context, params) => B8LegalFWidget(),
            ),
            FFRoute(
              name: A94ReportarWidget.routeName,
              path: A94ReportarWidget.routePath,
              builder: (context, params) => A94ReportarWidget(),
            ),
            FFRoute(
              name: C5ConfiguracionTWidget.routeName,
              path: C5ConfiguracionTWidget.routePath,
              builder: (context, params) => C5ConfiguracionTWidget(),
            ),
            FFRoute(
              name: B9ConfiguracionFWidget.routeName,
              path: B9ConfiguracionFWidget.routePath,
              builder: (context, params) => B9ConfiguracionFWidget(),
            ),
            FFRoute(
              name: C6PerfilTWidget.routeName,
              path: C6PerfilTWidget.routePath,
              builder: (context, params) => C6PerfilTWidget(),
            ),
            FFRoute(
              name: B10PerfilFWidget.routeName,
              path: B10PerfilFWidget.routePath,
              builder: (context, params) => B10PerfilFWidget(),
            ),
            FFRoute(
              name: B11CambiarContrasenaFWidget.routeName,
              path: B11CambiarContrasenaFWidget.routePath,
              builder: (context, params) => B11CambiarContrasenaFWidget(),
            ),
            FFRoute(
              name: C7CambiarContrasenaTWidget.routeName,
              path: C7CambiarContrasenaTWidget.routePath,
              builder: (context, params) => C7CambiarContrasenaTWidget(),
            ),
            FFRoute(
              name: C8ReportarTWidget.routeName,
              path: C8ReportarTWidget.routePath,
              builder: (context, params) => C8ReportarTWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/a1PrimerPantalla';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: SpinKitDualRing(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 40.0,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.scale,
        alignment: Alignment.bottomCenter,
        duration: Duration(milliseconds: 250),
      );
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();

    // Handle erroneous links from Firebase Dynamic Links.

    String? location;

    /*
    Handle `links` routes that have dynamic-link entangled with deep-link 
    */
    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.queryParameters.containsKey('deep_link_id')) {
      final deepLinkId = widget.state.uri.queryParameters['deep_link_id'];
      if (deepLinkId != null) {
        final deepLinkUri = Uri.parse(deepLinkId);
        final link = deepLinkUri.toString();
        final host = deepLinkUri.host;
        location = link.split(host).last;
      }
    }

    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.toString().contains('request_ip_version')) {
      location = '/';
    }

    if (location != null) {
      SchedulerBinding.instance
          .addPostFrameCallback((_) => context.go(location!));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
