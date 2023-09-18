part of com.rick_and_morty.typing;

abstract class AppViewModel<T> extends StateNotifier<T> {
  AppViewModel(T state) : super(state);

  BuildContext? context;

  void showLoading(BuildContext ctx) {
    if (context != null) {
      return;
    }
    context = ctx;
    showDialog<void>(
      context: ctx,
      barrierDismissible: false,
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white[0]!),
          ),
        ),
      ),
    );
  }

  void closeLoading() {
    if (context != null) {
      Navigator.of(context!).pop();
      context = null;
    }
  }
}
