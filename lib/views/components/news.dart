import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';

class NewsComponent extends StatefulWidget {
  const NewsComponent({Key? key}) : super(key: key);

  @override
  State<NewsComponent> createState() => _NewsComponentState();
}

class _NewsComponentState extends State<NewsComponent> {
  late Timer _timer;
  late NewsAPI _newsApi;
  late int _currentIdx;

  List<Article>? _news;
  Timer? _animTimer;

  @override
  void initState() {
    _newsApi = NewsAPI('f91474c1a8554714b281e0681e344d44');

    _timer = Timer.periodic(
      const Duration(hours: 1),
          (Timer t) => _requestNews,
    );

    _requestNews();

    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();

    if(_animTimer != null && _animTimer!.isActive){
      _animTimer!.cancel();
    }

    super.dispose();
  }

  void _requestNews() async {
    var n = await _newsApi.getTopHeadlines(country: 'bg');
    _currentIdx = 0;

    setState((){
      _news = n;
    });

    if(_animTimer != null && _animTimer!.isActive){
      _animTimer!.cancel();
    }

    _animTimer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      if (mounted && _news != null) {
        setState(() {
          _currentIdx++;
          if (_currentIdx >= _news!.length) {
            _currentIdx = 0;
          }
        });
      }
    });
  }

  Widget _buildAnimatedSwitcher() {
    var article = _news![_currentIdx];

    return AnimatedSwitcher(
        transitionBuilder: (Widget child, Animation<double> animation) =>
            FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: const Interval(0.5, 1.0),
                ),
              ),
              child: child,
            ),
        duration: const Duration(seconds: 3),
        child: Padding(
          key: Key(_currentIdx.toString()),
          padding: const EdgeInsets.symmetric(horizontal: 300, vertical: 100),
          child: Text(
            article.title!,
            style: const TextStyle(fontSize: 30),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    if(_news == null){
      return const SizedBox();
    }

    return _buildAnimatedSwitcher();
  }
}
