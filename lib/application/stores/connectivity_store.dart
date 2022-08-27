// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

import 'package:mobx/mobx.dart';

part 'connectivity_store.g.dart';

class ConnectivityStore = _ConnectivityStore with _$ConnectivityStore;

abstract class _ConnectivityStore with Store {
  final Connectivity _connectivity = Connectivity();

  _ConnectivityStore() {
    initConnectivity();

    _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  @action
  void updateConnectionStatus(ConnectivityResult result) {
    connectionStatus = result;
  }

// Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      // developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    return updateConnectionStatus(result);
  }

  @observable
  ConnectivityResult connectionStatus = ConnectivityResult.none;

  @observable
  ObservableStream<ConnectivityResult> connectivityStream =
      ObservableStream(Connectivity().onConnectivityChanged);

  void dispose() {}
}

class ConnectionStatus = _ConnectionStatus with _$ConnectionStatus;

abstract class _ConnectionStatus with Store {}
