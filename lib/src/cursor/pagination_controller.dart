import 'dart:async';

import 'package:riverpod/riverpod.dart';
import 'package:pagination/src/cursor/pagination_request.dart';
import 'package:pagination/src/cursor/pagination_response.dart';
// ignore: implementation_imports
import 'package:riverpod/src/async_notifier.dart';

// ignore: invalid_use_of_internal_member
mixin PaginationController<T> on AsyncNotifierBase<PaginationResponse<T>> {
  FutureOr<PaginationResponse<T>> loadData(PaginationRequest query);
// this is new here
  PaginationRequest nextPage(PaginationResponse<T> current);
  Future<void> loadMore() async {
    final oldState = state;
    if (oldState.requireValue.isCompleted) return;
    state = AsyncLoading<PaginationResponse<T>>().copyWithPrevious(oldState);
    state = await AsyncValue.guard<PaginationResponse<T>>(() async {
      final res = await loadData(nextPage(oldState.requireValue));
      res.data.insertAll(0, state.requireValue.data);
      return res;
    });
  }

  bool canLoadMore() {
    if (state.isLoading) return false;
    if (!state.hasValue) return false;
    if (state.requireValue.isCompleted) return false;
    return true;
  }
}
