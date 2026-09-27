import 'package:flutter/material.dart';
import '../../../../../widget/customErrorWidget.dart';
import '../../../../../widget/customLoadingWidget.dart';

class CustomFutureBuilder<T> extends StatefulWidget {
  final Future<T> Function() future;
  final Widget Function(T data) onSuccess;
  final bool Function(T data)? isSuccess;
  final String Function(T data)? getError;
  final bool isDark;

  const CustomFutureBuilder({
    super.key,
    required this.future,
    required this.onSuccess,
    required this.isDark,
    this.isSuccess,
    this.getError,
  });

  @override
  State<CustomFutureBuilder<T>> createState() =>
      _CustomFutureBuilderState<T>();
}

class _CustomFutureBuilderState<T>
    extends State<CustomFutureBuilder<T>> {
  late Future<T> future;

  @override
  void initState() {
    super.initState();
    future = widget.future();
  }

  void retry() {
    setState(() {
      future = widget.future();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoadingWidget(
            isDark: widget.isDark,
          );
        }

        if (snapshot.hasError) {
          return CustomErrorWidget(
            error: snapshot.error.toString(),
            isDark: widget.isDark,
            onRetry: retry,
          );
        }

        if (!snapshot.hasData) {
          return CustomErrorWidget(
            error: "Something went wrong",
            isDark: widget.isDark,
            onRetry: retry,
          );
        }

        final data = snapshot.data!;

        if (widget.isSuccess != null &&
            !widget.isSuccess!(data)) {
          return CustomErrorWidget(
            error: widget.getError?.call(data) ??
                "Something went wrong",
            isDark: widget.isDark,
            onRetry: retry,
          );
        }

        return widget.onSuccess(data);
      },
    );
  }
}