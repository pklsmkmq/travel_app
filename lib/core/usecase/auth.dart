// ignore_for_file: prefer_interpolation_to_compose_strings, use_build_context_synchronously, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:traver_v2/core/routing/app_route.dart';

class ProsesAuth {
  Future register(BuildContext context, String name, String email,
      String password, String confirmPassword) async {
    Uri url = Uri.parse("${dotenv.env['baseUrl']}/auth/register");

    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword
        }));

    if (response.statusCode == 201) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Registrasi Berhasil"),
            content: Text("Silahkan Cek Email Anda"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                  context.goNamed(Routes.otp, extra: email);
                },
              ),
            ],
          );
        },
      );
    } else {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Registrasi Gagal Silahkan Cek Kembali"),
        ),
      );
    }
  }

  Future verify(BuildContext context, String otp) async {
    Uri url = Uri.parse("${dotenv.env['baseUrl']}/auth/verify-email");

    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({"code": otp}));

    print(response.statusCode);
    if (response.statusCode == 200) {
      return context.goNamed(Routes.success);
    } else {
      print(response.body);
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Kode Verifikasi Salah"),
        ),
      );
    }
  }

  Future login(String email, String password, BuildContext context) async {
    Uri url = Uri.parse("${dotenv.env['baseUrl']}/auth/login");

    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({"email": email, "password": password}));

    if (response.statusCode == 200) {
      
    }
  }
}
