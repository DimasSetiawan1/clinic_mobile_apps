import 'dart:developer';

import 'package:clinic_mobile_apps/core/extensions/build_context_ext.dart';
import 'package:clinic_mobile_apps/presentation/patient/chat/dialogs/payment_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebview extends StatefulWidget {
  final String invoiceUrl;
  final int orderId;
  const PaymentWebview(
      {super.key, required this.invoiceUrl, required this.orderId});

  @override
  State<PaymentWebview> createState() => _PaymentWebviewState();
}

class _PaymentWebviewState extends State<PaymentWebview> {
  late final WebViewController _controller;
  bool _isLoading = false;
  Future<void> _handlePaymentSuccess() async {
    showDialog(context: context, builder: (_) => const PaymentSuccessDialog());
  }

  Future<void> _handlePaymentFailure() async {
    context.showDialogError(
      'Pembayaran Gagal',
      'Ops. Terjadi kesalahan, mohon ulangi sesaat lagi ya, Sob.',
    );

    if (mounted) {
      context.popToRoot();
    }
  }

  @override

  /// Disposes the WebViewController and cleans up any resources used by this widget.

  void dispose() {
    _controller.clearCache();
    super.dispose();
  }

  @override
  void initState() {
    const PlatformWebViewControllerCreationParams params =
        PlatformWebViewControllerCreationParams();
    _controller = WebViewController.fromPlatformCreationParams(params);
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            log('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            setState(() => _isLoading = true);
            log('Page started loading: $url');
          },
          onPageFinished: (String url) {
            setState(() => _isLoading = false);
            log('Page finished loading: $url');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains('flutter/success')) {
              _handlePaymentSuccess();
              return NavigationDecision.prevent;
            } else if (request.url.contains('flutter/failure')) {
              _handlePaymentFailure();
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onUrlChange: (change) {},
          onWebResourceError: (WebResourceError error) {
            log('''
              Page resource error:
              code: ${error.errorCode}
              description: ${error.description}
              errorType: ${error.errorType}
              isForMainFrame: ${error.isForMainFrame}
          ''');
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(widget.invoiceUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(child: WebViewWidget(controller: _controller)),
    );
  }
}
