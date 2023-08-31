import 'package:pagination/src/model/item.dart';
import 'package:pagination/src/page/pagination_request.dart' as page_req;
import 'package:pagination/src/page/pagination_response.dart' as page_res;
import 'package:pagination/src/cursor/pagination_request.dart' as cursor_req;
import 'package:pagination/src/cursor/pagination_response.dart' as cursor_res;
import 'package:riverpod/riverpod.dart';

final itemRepoProvider = Provider((ref) => ItemRepo());

class ItemRepo {
  Future<page_res.PaginationResponse<Item>> getItemByPagePaginate(
      page_req.PaginationRequest request) async {
    await Future.delayed(const Duration(seconds: 1));
    return page_res.PaginationResponse(
        data: List.generate(
            request.perPage,
            (index) => Item((request.page + index).toString(),
                "name ${request.page + index}")),
        meta: page_res.MetaData(
            page: request.page, perPage: request.perPage, totalPage: 10));
  }

  Future<cursor_res.PaginationResponse<Item>> getItemByCursorPaginate(
      cursor_req.PaginationRequest request) async {
    await Future.delayed(const Duration(seconds: 1));
    return cursor_res.PaginationResponse(
      data: List.generate(
          10,
          (index) => Item(("${request.cursor} $index").toString(),
              "name ${request.cursor} $index")),
    );
  }
}
