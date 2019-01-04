import 'package:pref_gen_annotations/pref_gen_annotations.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:pref_gen_flutter/pref_gen_flutter.dart';
part 'persistent.g.dart';


@ReactivePreferencesHolder()
abstract class Persistent implements PersistentPreferences {
  @DefaultValue([])
  List<String> newsSources;
  factory Persistent(PreferenceAdapter adapter) = _$Persistent;
}

final persistentSettings = Persistent(SharedPreferencesAdapter());