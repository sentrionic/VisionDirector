import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vision_director/application/tasks/comment_list/comment_list_cubit.dart';
import 'package:vision_director/presentation/common/widgets/center_loading_indicator.dart';
import 'package:vision_director/presentation/common/widgets/error_indicator.dart';
import 'package:vision_director/presentation/tasks/detail/widgets/comment_item.dart';

class CommentListWidget extends StatelessWidget {
  const CommentListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentListCubit, CommentListState>(
      builder: (context, state) => state.map(
        initial: (_) => Container(),
        loadInProgress: (_) => const CenterLoadingIndicator(),
        loadSuccess: (state) => state.comments.isEmpty
            ? const _EmptyCommentsList()
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final comment = state.comments[index];
                  return CommentItem(comment: comment);
                },
                itemCount: state.comments.length,
              ),
        loadFailure: (_) => const ErrorIndicator(),
      ),
    );
  }
}

class _EmptyCommentsList extends StatelessWidget {
  const _EmptyCommentsList();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            "Nothing here yet",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
