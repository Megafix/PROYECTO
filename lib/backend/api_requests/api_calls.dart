import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ExcelCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'excel',
      apiUrl:
          'https://sheets.googleapis.com/v4/spreadsheets/1yAz4IPuAIHUQ1K-Lu-7F5HUCmp0rJ6SLwNwIcfEnvDU/values/Sheet1?key=AIzaSyCCpAaylL2mmgGB2MhZ0zcgTorKlJ9JjSE',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? rubros(dynamic response) => (getJsonField(
        response,
        r'''$.values[2:200][0]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? range(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.range''',
      ));
  static String? majorDimension(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.majorDimension''',
      ));
  static List<String>? costo(dynamic response) => (getJsonField(
        response,
        r'''$.values[2:200][1]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? every(dynamic response) => (getJsonField(
        response,
        r'''$.values[2:200][0,1]''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List? values(dynamic response) => getJsonField(
        response,
        r'''$.values''',
        true,
      ) as List?;
}

class CalendarCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'calendar',
      apiUrl:
          'https://www.googleapis.com/calendar/v3/calendars/c4d5fc670eed102100d54d1733eee8484b1c4f975afdcec9dce909d50575f781@group.calendar.google.com/events',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer 416740174321-0chqvgfe47qb671cr680tmnlsh5ngul3.apps.googleusercontent.com',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StripeCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'stripe',
      apiUrl: 'https://api.stripe.com',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MercadopagoCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "work_prise": "\$work_prise",
  "email": "\$email"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'mercadopago',
      apiUrl: 'https://api.mercadopago.com/v1/payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-320738281269718-022117-d25aa3eec6a3f53a0a7b9965a35d149b-2280283251',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MppaymentsCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "items": [
    {
      "title": "Pago por servicio",
      "quantity": 1,
      "currency_id": "ARS",
      "unit_price":"\$prisework"
    }
  ],
  "payer": {
    "email": "\$email"
  },
  "back_urls": {
    "success": "https://TU_APP/success",
    "failure": "https://TU_APP/failure",
    "pending": "https://TU_APP/pending"
  },
  "auto_return": "approved"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'mppayments',
      apiUrl: 'https://api.mercadopago.com/checkout/preferences',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer APP_USR-320738281269718-022117-d25aa3eec6a3f53a0a7b9965a35d149b-2280283251',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? paymenturl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.init_point''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
