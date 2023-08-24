import 'package:flutter/material.dart';

enum ActionsDirection { vertical, horizontal }

class KGDialog extends StatelessWidget {
  final String filePath, title, middleText;
  final String? textConfirm, textCancel;
  final void Function()? onConfirm, onCancel;
  final double? imageWidth, imageHeight;
  final ActionsDirection actionsDirection;

  const KGDialog({
    super.key,
    required this.filePath,
    required this.title,
    required this.middleText,
    this.imageWidth,
    this.imageHeight,
    this.actionsDirection = ActionsDirection.vertical,
    this.textConfirm,
    this.textCancel,
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0XFF1C1B1F),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            middleText,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 12,
                color: Color(0XFF1C1B1F),
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20.0),
          actionsDirection == ActionsDirection.vertical
              ? Column(
                  children: [
                    textConfirm != null
                        ? SizedBox(
                            width: 200.0,
                            child: _buildActionButton(
                                true, onConfirm, textConfirm),
                          )
                        : const SizedBox(),
                    textConfirm != null || textCancel != null
                        ? const SizedBox(
                            height: 8,
                          )
                        : const SizedBox(),
                    textCancel != null
                        ? SizedBox(
                            width: 200.0,
                            child:
                                _buildActionButton(false, onCancel, textCancel),
                          )
                        : const SizedBox(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textCancel != null
                        ? SizedBox(
                            width: 100.0,
                            child:
                                _buildActionButton(false, onCancel, textCancel),
                          )
                        : const SizedBox(),
                    textConfirm != null || textCancel != null
                        ? const SizedBox(
                            width: 8,
                          )
                        : const SizedBox(),
                    textConfirm != null
                        ? SizedBox(
                            width: 100.0,
                            child: _buildActionButton(
                                true, onConfirm, textConfirm),
                          )
                        : const SizedBox(),
                  ],
                )
        ],
      ),
    );
  }

  ElevatedButton _buildActionButton(
      bool isConfirm, void Function()? onPressed, String? text) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(12),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
      child: Text(
        text ?? '',
        style: TextStyle(
            color:
                isConfirm ? const Color(0xffFFFBFE) : const Color(0XFF383838),
            fontSize: 16.0,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
