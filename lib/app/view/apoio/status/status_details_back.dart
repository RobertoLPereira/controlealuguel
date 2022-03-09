import '../../../domain/entities/status.dart';
import 'package:flutter/cupertino.dart';

class StatusDetailsBack {
  BuildContext context;
  Status status;

  StatusDetailsBack(this.context) {
    status = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }
}
