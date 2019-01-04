// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persistent.dart';

// **************************************************************************
// ReactiveSharedPreferencesGenerator
// **************************************************************************

class _$Persistent implements Persistent {
  _$Persistent(PreferenceAdapter adapter) : this._adapter = adapter {
    newsSourcesSink = (StreamController<List<String>>.broadcast()
          ..stream.listen((value) async {
            await adapter.setStringList("newsSources", value);
            _newsSourcesSubject.add(value);
          }))
        .sink;
    _adapter.getStringList("newsSources").then((value) {
      return value ?? <String>[];
    }).then(newsSourcesSink.add);
  }

  final PreferenceAdapter _adapter;

  final BehaviorSubject<List<String>> _newsSourcesSubject =
      BehaviorSubject<List<String>>(seedValue: <String>[]);

  Sink<List<String>> newsSourcesSink;

  Stream<List<String>> get newsSourcesStream =>
      _newsSourcesSubject.asBroadcastStream();
  List<String> get newsSources => _newsSourcesSubject.value;
  set newsSources(List<String> value) => newsSourcesSink.add(value);
  void dispose() {
    newsSourcesSink.close();
  }
}

abstract class PersistentPreferences {
  Sink<List<String>> newsSourcesSink;

  Stream<List<String>> get newsSourcesStream;
  void dispose() {
    newsSourcesSink.close();
  }
}
