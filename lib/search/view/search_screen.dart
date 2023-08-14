import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../category/view/category_screen.dart';
import '../../main/widget/main_app_bar.dart';
import '../../photos/widget/photos_ui.dart';
import '../bloc/search_bloc.dart';
import '../widget/search_text_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(
        context,
        title: 'Search',
        isSearchPage: true,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const CategoryScreen(),
            const SearchTextField(),
            SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                if (state is SearchInitial) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/onboarding/empty.svg",
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                    ),
                  );
                }
                if (state is SearchLoaded) {
                  final model = state.model;
                  return PhotosUi(
                    model: model,
                  );
                }
                if (state is SearchError) {
                  return Center(
                    child: Text(state.errMessage),
                  );
                }
                return Container();
              }),
            ),
          ],
        ),
      ),
    );
  }
}
