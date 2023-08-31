import 'dart:async';

import 'package:pagination/src/model/item.dart';
import 'package:pagination/src/page/pagination_controller.dart';
import 'package:pagination/src/page/pagination_request.dart';
import 'package:pagination/src/page/pagination_response.dart';
import 'package:pagination/src/repo/item_repo.dart';
import 'package:riverpod/riverpod.dart';

final itemsController = AsyncNotifierProvider.autoDispose<ItemsController,
    PaginationResponse<Item>>(ItemsController.new);

class ItemsController extends AutoDisposeAsyncNotifier<PaginationResponse<Item>>
    with PaginationController<Item> {
  @override
  Future<PaginationResponse<Item>> build() async {
    return await loadData(PaginationRequest(page: 1, perPage: 30));
  }

  @override
  FutureOr<PaginationResponse<Item>> loadData(PaginationRequest query) {
    return ref.read(itemRepoProvider).getItemByPagePaginate(query);
  }
}
