import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:provider/provider.dart';
import '../main.dart';
import '../model/post.dart';
import 'data/home_event.dart';
import 'home_view_model.dart';

// 리버포트 고치기 4
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homeViewModelProvider);

    //final viewModel = context.watch<HomeViewModel>();
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ListView.builder(
        itemCount: state.posts.length,
        itemBuilder: (context, index) {
          final post = state.posts[index];
          return GestureDetector(
            onTap: () async {
              //_controller.text = post.content;

              _controller.text = post.comment;

              bool? result = await showDialog<bool>(
                context: context,
                builder: (_) =>
                    _buildUpdateDeleteAlertDialog(viewModel, post, context),
              );

              if (result != null) {}
            },
            child: ListTile(
              title: Text('${post.id} : ${post.comment}'),
              // title: Text('${post.id} : ${post.content}'),

              subtitle: Text(post.updateTime),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => _buildInsertAlertDialog(viewModel, context));
        },
      ),
    );
  }

  AlertDialog _buildInsertAlertDialog(
    HomeViewModel viewModel,
    BuildContext context,
  ) {
    _controller.text = '';
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            viewModel.onEvent(HomeEvent.insert(_controller.text));
            Navigator.pop(context, true);
          },
          child: const Text('Insert'),
        ),
      ],
    );
  }

  AlertDialog _buildUpdateDeleteAlertDialog(
    HomeViewModel viewModel,
    Post post,
    BuildContext context,
  ) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            viewModel.onEvent(HomeEvent.delete(post.id));

            Navigator.pop(context, true);
          },
          child: const Text('Delete'),
        ),
        TextButton(
          onPressed: () {
            viewModel.onEvent(HomeEvent.update(post.id, _controller.text));
            Navigator.pop(context, true);
          },
          child: const Text('Update'),
        ),
      ],
    );
  }
}
