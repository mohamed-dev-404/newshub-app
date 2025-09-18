import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:news_app/widgets/logo.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetails extends StatefulWidget {
  final String articleUrl;
  const ArticleDetails({super.key, required this.articleUrl});

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  late final WebViewController _controller;
  bool isLoading = true; //track loading state

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          // onPageStarted: (String url) {
          //   setState(() {
          //     isLoading = false;
          //   });
          // },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.articleUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Logo(),
      ),
      body: Stack(
        children: [
          // WebView
          WebViewWidget(
            controller: _controller,
            layoutDirection: TextDirection.rtl,
          ),
          
          // Loading Indicator
          if (isLoading)
            Center(
              child: LoadingAnimationWidget.flickr(
                leftDotColor: Colors.orangeAccent,
                rightDotColor: Colors.orange.shade700,
                size: 50,
              ),
            ),
        ],
      ),
    );
  }
}
