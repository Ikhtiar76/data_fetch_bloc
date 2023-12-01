import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(FetchDataEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is DataLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is DataLoadedState) {
            var users = state.users;
            return ListView.builder(
              controller: context.read<HomeBloc>().scrollController,
              itemCount: context.read<HomeBloc>().isLoading
                  ? users.length + 1
                  : users.length,
              itemBuilder: (context, index) {
                if (index >= users.length) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else {
                  var user = users[index];
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    color: Colors.blueGrey,
                    height: 200,
                    width: MediaQuery.sizeOf(context).width,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Image.network(user.avatar ?? ''),
                      ),
                      title: Text(
                        '${user.firstName} ${user.lastName}',
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(user.email ?? '',
                          style: const TextStyle(color: Colors.black)),
                    ),
                  );
                }
              },
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
