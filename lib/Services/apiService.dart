import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


class ApiService {
  static const int timeoutSeconds = 30;

  static Future<Map<String, dynamic>> request({
    required String method,
    required String url,
    Map<String, String>? headers,
    dynamic body,
  }) async {
    try {
      http.Response response;

      headers ??= {
        'Content-Type': 'application/json',
      };

      switch (method.toUpperCase()) {
        case 'GET':
          response = await http.get(Uri.parse(url), headers: headers)
              .timeout(const Duration(seconds: timeoutSeconds));
          break;
        case 'POST':
          response = await http.post(Uri.parse(url),
              headers: headers, body: jsonEncode(body))
              .timeout(const Duration(seconds: timeoutSeconds));
          break;
        case 'PUT':
          response = await http.put(Uri.parse(url),
              headers: headers, body: jsonEncode(body))
              .timeout(const Duration(seconds: timeoutSeconds));
          break;
        case 'DELETE':
          response = await http.delete(Uri.parse(url), headers: headers)
              .timeout(const Duration(seconds: timeoutSeconds));
          break;
        default:
          debugPrint("Unsupported HTTP method: $method");
          throw Exception("Unsupported HTTP method: $method");
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        try {
          debugPrint("Successful ${response.statusCode}");
          return jsonDecode(response.body) as Map<String, dynamic>;
        } catch (_) {
          debugPrint("Unsuccessful ${response.statusCode} ");

          return {"data": response.body};
        }
      } else {
        return {
          "error": true,
          "statusCode": response.statusCode,
          "message": response.body
        };
      }
    } catch (e) {
      return {
        "error": true,
        "message": e.toString(),
      };
    }
  }
}
