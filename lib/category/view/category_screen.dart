import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../search/bloc/search_bloc.dart';
import '../bloc/category_bloc.dart';
import '../shimmer/category_shimmer.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
      if (state is CategoryInitial) {
        BlocProvider.of<CategoryBloc>(context).add(CategoryFetchItems());
        return const CategoryShimmer();
      }
      if (state is CategorySuccess) {
        final model = state.model;
        return SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: model.length,
            itemBuilder: (context, index) {
              final data = state.model[index];
              return InkWell(
                onTap: () {
                  BlocProvider.of<SearchBloc>(context).add(
                    SearchFetchItems('${data.name}'),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://source.unsplash.com/daily?${data.name}',
                          fit: BoxFit.cover,
                          width: 150,
                          height: 80,
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          data.name!.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }
      if (state is CategoryError) {
        return Center(
          child: Text(state.errMessage),
        );
      }
      return Container();
    });
  }
}
