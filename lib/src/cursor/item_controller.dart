import 'dart:async';

import 'package:pagination/src/model/item.dart';
import 'package:pagination/src/cursor/pagination_controller.dart';
import 'package:pagination/src/cursor/pagination_request.dart';
import 'package:pagination/src/cursor/pagination_response.dart';
import 'package:pagination/src/repo/item_repo.dart';
import 'package:riverpod/riverpod.dart';

final itemsController = AsyncNotifierProvider.autoDispose<ItemsController,
    PaginationResponse<Item>>(ItemsController.new);

class ItemsController extends AutoDisposeAsyncNotifier<PaginationResponse<Item>>
    with PaginationController<Item> {
  @override
  Future<PaginationResponse<Item>> build() async {
    return await loadData(PaginationRequest(cursor: null));
  }

  @override
  FutureOr<PaginationResponse<Item>> loadData(PaginationRequest query) {
    return ref.read(itemRepoProvider).getItemByCursorPaginate(query);
  }

  @override
  PaginationRequest nextPage(PaginationResponse<Item> current) =>
      PaginationRequest(cursor: current.data.last.id);
}
