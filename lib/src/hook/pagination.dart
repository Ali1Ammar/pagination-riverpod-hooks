import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ScrollController usePagination(
    VoidCallback fetchData, bool Function() canLoadMore) {
  final scrollController = useScrollController();

  void scrollListener() {
    if (canLoadMore() &&
        scrollController.position.pixels >=
            scrollController.position.maxScrollExtent) {
      fetchData();
    }
  }

  useEffect(() {
    scrollController.addListener(scrollListener);
    return null;
  }, [scrollController]);

  return scrollController;
}
