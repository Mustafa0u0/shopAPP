import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/constants/utils.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  // log(': ${response.body}');
  var body = jsonDecode(response.body);
  // showSnackBar(context, 'e.toString()');
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(
          context, body.containsKey('msg') ? body['msg'] : ' msg error');
      break;
    case 500:
      showSnackBar(
          context, body.containsKey('error') ? body['error'] : ' error');
      break;
    default:
      showSnackBar(context, response.body);
  }
}
