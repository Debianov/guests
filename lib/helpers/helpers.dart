// ignore_for_file: unnecessary_new

import 'dart:async';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter/material.dart';


class Helpers {
  late ProgressDialog progressDialog;

  showProgress(BuildContext context, String message, bool isDismissible) async {
    progressDialog = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: isDismissible);
    progressDialog.style(
        message: message,
        borderRadius: 10.0,
        backgroundColor: Colors.blue,
        progressWidget: Container(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            )),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        messageTextStyle: TextStyle(
            color: Colors.white, fontSize: 19.0, fontWeight: FontWeight.w600));
    await progressDialog.show();
  }

  hideProgress() async {
    await progressDialog.hide();
  }
}

Helpers helpers = Helpers();
