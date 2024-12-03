import 'package:bloc_example/features/post/bloc/post_bloc.dart';
import 'package:bloc_example/features/post/models/post_model.dart';
import 'package:bloc_example/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final PagingController<int, PostModel> _pagingController =
      PagingController(firstPageKey: 1);
  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      context.read<PostBloc>().add(FetchPostEvent(pageKey: pageKey));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Api Example'),
      ),
      body: BlocListener<PostBloc, PostState>(
        listener: (context, state) {
          if (state.status == PostStatus.success) {
            final isLastPage = state.hasReachedMax;
            if (isLastPage) {
              _pagingController.appendLastPage(state.postList);
            } else {
              _pagingController.appendPage(
                state.postList,
                state.currentPage + 1,
              );
            }
          } else if (state.status == PostStatus.failure) {
            _pagingController.error = state.errorMessage;
          }
        },
        child: PagedListView<int, PostModel>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<PostModel>(
            itemBuilder: (context, post, index) => Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  post.name ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    post.body ?? '',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text(
                    post.name?.substring(0, 1) ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            firstPageProgressIndicatorBuilder: (_) => Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.blue,
                size: 50,
              ),
            ),
            newPageProgressIndicatorBuilder: (_) => Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.blue,
                size: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
