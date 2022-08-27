// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectivityStore on _ConnectivityStore, Store {
  late final _$connectionStatusAtom =
      Atom(name: '_ConnectivityStore.connectionStatus', context: context);

  @override
  ConnectivityResult get connectionStatus {
    _$connectionStatusAtom.reportRead();
    return super.connectionStatus;
  }

  @override
  set connectionStatus(ConnectivityResult value) {
    _$connectionStatusAtom.reportWrite(value, super.connectionStatus, () {
      super.connectionStatus = value;
    });
  }

  late final _$connectivityStreamAtom =
      Atom(name: '_ConnectivityStore.connectivityStream', context: context);

  @override
  ObservableStream<ConnectivityResult> get connectivityStream {
    _$connectivityStreamAtom.reportRead();
    return super.connectivityStream;
  }

  @override
  set connectivityStream(ObservableStream<ConnectivityResult> value) {
    _$connectivityStreamAtom.reportWrite(value, super.connectivityStream, () {
      super.connectivityStream = value;
    });
  }

  late final _$_ConnectivityStoreActionController =
      ActionController(name: '_ConnectivityStore', context: context);

  @override
  void updateConnectionStatus(ConnectivityResult result) {
    final _$actionInfo = _$_ConnectivityStoreActionController.startAction(
        name: '_ConnectivityStore.updateConnectionStatus');
    try {
      return super.updateConnectionStatus(result);
    } finally {
      _$_ConnectivityStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connectionStatus: ${connectionStatus},
connectivityStream: ${connectivityStream}
    ''';
  }
}

mixin _$ConnectionStatus on _ConnectionStatus, Store {
  @override
  String toString() {
    return '''

    ''';
  }
}
