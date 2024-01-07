import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lottie/lottie.dart';

enum ProgressDialogType { Normal, Download }

bool _isShowing = false;
BuildContext? _context, _dismissingContext;
bool _barrierDismissible = true, _showLogs = false;

class ProgressDialog {
  _Body? _dialog;

  ProgressDialog(BuildContext context,
      {ProgressDialogType? type,
      bool? isDismissible,
      bool? showLogs,
      TextDirection? textDirection,
      Widget? customBody}) {
    _context = context;
    _barrierDismissible = isDismissible ?? true;
    _showLogs = showLogs ?? false;
  }

  bool isShowing() {
    return _isShowing;
  }

  Future<bool> hide() async {
    try {
      if (_isShowing) {
        _isShowing = false;
        Navigator.of(_dismissingContext!).pop();
        if (_showLogs) debugPrint('ProgressDialog dismissed');
        return Future.value(true);
      } else {
        if (_showLogs) debugPrint('ProgressDialog already dismissed');
        return Future.value(false);
      }
    } catch (err) {
      debugPrint('Seems there is an issue hiding dialog');
      debugPrint(err.toString());
      return Future.value(false);
    }
  }

  Future<bool> show() async {
    try {
      if (!_isShowing) {
        _dialog = new _Body();
        showDialog<dynamic>(
          context: _context!,
          barrierDismissible: _barrierDismissible,
          builder: (BuildContext context) {
            _dismissingContext = context;
            return WillPopScope(
              onWillPop: () async => _barrierDismissible,
              child: Center(
                  //backgroundColor: _backgroundColor,
                  //insetAnimationCurve: _insetAnimCurve,
                  //insetAnimationDuration: Duration(milliseconds: 100),
                  //elevation: 8,
                  //backgroundColor: Colors.transparent,
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: _dialog),
            );
          },
        );
        // Delaying the function for 200 milliseconds
        // [Default transitionDuration of DialogRoute]
        //await Future.delayed(Duration(milliseconds: 200));
        if (_showLogs) debugPrint('ProgressDialog shown');
        _isShowing = true;
        return true;
      } else {
        if (_showLogs) debugPrint("ProgressDialog already shown/showing");
        return false;
      }
    } catch (err) {
      _isShowing = false;
      debugPrint('Exception while showing the dialog');
      debugPrint(err.toString());
      return false;
    }
  }
}

class _Body extends StatefulWidget {
  _BodyState _dialog = _BodyState();

  @override
  State<StatefulWidget> createState() {
    return _dialog;
  }
}

class _BodyState extends State<_Body> {
  @override
  void dispose() {
    _isShowing = false;
    if (_showLogs) debugPrint('ProgressDialog dismissed by back button');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Lottie.asset("assets/lottie/loader_animation.json"),
    );
  }
}

class LoaderAnimation extends StatefulWidget {
  const LoaderAnimation({super.key});

  @override
  State<LoaderAnimation> createState() => _LoaderAnimationState();
}

class _LoaderAnimationState extends State<LoaderAnimation> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 130,
          child: Lottie.asset("assets/lottie/loader_animation.json")),
    );
  }
}

// showBottomLoader(context){
//   showCustomBottomSheet(context,const Center(
//     child: LoaderAnimation(),
//   ));
// }
