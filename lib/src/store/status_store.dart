import 'package:flutter/material.dart';
import '../../src/api/apoio/status_api.dart';
import '../../src/states/status_state.dart';

class StatusStore extends ValueNotifier<StatusState> {
  final StatusApi srvStatus;
  //StatusStore(List<Status> value) : super(value);
  StatusStore(this.srvStatus) : super(InitialStatusState());
  Future fetchStatus() async {
    value = LoadingStatusState();
    try {
      final statuss = await srvStatus.fetchStatus();
      value = SucessStatusState(statuss);
    } catch (e) {
      value = ErrorStatusState(e.toString());
    }
  }
}
