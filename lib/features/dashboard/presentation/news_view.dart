import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsView extends StatefulWidget {
  final String authorizationUrl;

  const NewsView({
    super.key,
    required this.authorizationUrl,
  });

  @override
  State<NewsView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<NewsView> {
  late WebViewController controller;
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setUserAgent('Flutter;Webview')
      ..loadRequest(Uri.parse(widget.authorizationUrl))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.authorizationUrl));
  }

  Future<void> _refresh() async {
    await controller.reload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 20,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            if (loadingPercentage < 100)
              LinearProgressIndicator(
                value: loadingPercentage / 100.0,
                backgroundColor: Colors.transparent,
                color: Colors.blue,
                minHeight: 3,
              ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refresh,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: WebViewWidget(
                      controller: controller,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
