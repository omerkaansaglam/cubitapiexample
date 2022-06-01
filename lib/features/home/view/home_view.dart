import 'package:cubitapiexample/features/home/cubit/home_cubit.dart';
import 'package:cubitapiexample/features/home/service/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeService()),
      child: Scaffold(
        body: _buildScaffold(context),
      ),
    );
  }

  Column _buildScaffold(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: SizedBox(
            child:
                BlocConsumer<HomeCubit, HomeState>(listener: (context, state) {
              if (state is HomeError) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("data")));
              }
            }, builder: (context, state) {
              if (state is HomeCompleted) {
                return ListView.builder(
                    itemCount: state.homeModel.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.homeModel[index].title ?? ""),
                        subtitle: Text(state.homeModel[index].body ?? ""),
                        leading: Text(state.homeModel[index].id.toString()),
                      );
                    });
              }
              if (state is HomeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ElevatedButton(
              onPressed: () async {
                await context.read<HomeCubit>().fethData();
              },
              child: Text("Get Data"));
            }),
          ),
        ),
      ],
    );
  }
}
