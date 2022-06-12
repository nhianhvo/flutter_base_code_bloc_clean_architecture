import 'package:flutter/material.dart';

import '../base_code/widget/error_dialog_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  void showErrorPopup(
    BuildContext context, {
    String? content,
    VoidCallback? onClose,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => ErrorDialogWidget(
        content: content,
        onClose: onClose,
      ),
    );
  }
}
