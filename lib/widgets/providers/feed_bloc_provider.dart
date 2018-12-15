import 'package:vinegar/blocs/blocs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FeedBlocProvider extends StatefulWidget {
  final Widget child;
  final FeedBloc bloc;

  FeedBlocProvider({Key key, @required this.child, @required this.bloc})
      : super(key: key);

  @override
  _FeedBlocProviderState createState() => _FeedBlocProviderState();

  static FeedBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_FeedBlocProvider)
            as _FeedBlocProvider)
        .bloc;
  }
}

class _FeedBlocProviderState extends State<FeedBlocProvider> {
  @override
  Widget build(BuildContext context) {
    return _FeedBlocProvider(bloc: widget.bloc, child: widget.child);
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}

class _FeedBlocProvider extends InheritedWidget {
  final FeedBloc bloc;

  _FeedBlocProvider({
    Key key,
    @required this.bloc,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_FeedBlocProvider old) => bloc != old.bloc;
}
