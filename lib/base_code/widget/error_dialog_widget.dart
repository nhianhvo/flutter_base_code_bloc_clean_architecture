import 'package:flutter/material.dart';

import '../../data_source/resource/res_color.dart';
import '../../data_source/resource/res_font.dart';
import 'base_dialog_widget.dart';

class ErrorDialogWidget extends BaseDialogWidget {
  final String? title;
  final String? content;
  final VoidCallback? onClose;

  ErrorDialogWidget({
    this.title,
    this.content,
    this.onClose,
  });

  @override
  Widget buildDialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0.0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        // To make the card compact
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.cancel,
                color: ResColors.errorColor,
              ),
              const SizedBox(width: 8),
              Text(
                title ?? 'An error has occurred!',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: ResFonts.nunitoExtraBold,
                  color: ResColors.errorColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            content ?? '',
            style: const TextStyle(
              fontSize: 16,
              fontFamily: ResFonts.nunitoSemiBold,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 100,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (onClose != null) {
                      onClose!();
                    }
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: ResFonts.nunitoBold,
                      color: ResColors.errorColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
