import 'package:flutter/material.dart';
import 'package:pagination/src/hook/pagination.dart';
import 'package:pagination/src/page/item_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ItemsPage extends HookConsumerWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(itemsController.notifier);
    final asyncItem = ref.watch(itemsController);
    final scrollController =
        usePagination(controller.loadMore, () => controller.canLoadMore());
    return Scaffold(
      body: switch (asyncItem) {
        AsyncValue(value: var data) when data != null && data.data.isNotEmpty =>
          ListView.builder(
            controller: scrollController,
            itemCount: data.data.length +
                (asyncItem.isLoading ||
                        asyncItem.hasError ||
                        !controller.canLoadMore()
                    ? 1
                    : 0),
            itemBuilder: (context, index) {
              if (data.data.length == index) {
                // here we will handle isLoading and hasError and done
                if (asyncItem.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (asyncItem.hasError) {
                  return Center(child: Text(asyncItem.error.toString()));
                }
                if (!controller.canLoadMore()) {
                  return const Center(child: Text("No more data"));
                }
              }
              final item = data.data[index];

              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.name),
              );
            },
          ),
        AsyncLoading() => const Center(child: CircularProgressIndicator()),
        AsyncError(error: var error) => Center(
            child: Text(error.toString()),
          ),
        _ => const Center(
            child: Text("No data"),
          ),
      },
    );
  }
}
