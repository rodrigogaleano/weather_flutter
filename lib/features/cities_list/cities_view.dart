import 'package:flutter/material.dart';

import '../../support/style/app_colors.dart';
import '../../support/style/app_fonts.dart';
import 'components/city_item/city_item_view.dart';

abstract class CitiesViewModelProtocol with ChangeNotifier {
  bool get isLoading;
  String get errorMessage;
  TextEditingController get searchBarController;
  List<CityItemViewModelProtocol> get cityViewModels;

  void removeFocus();
}

class CitiesView extends StatelessWidget {
  final CitiesViewModelProtocol viewModel;

  const CitiesView({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (_, __) {
            return GestureDetector(
              onTap: viewModel.removeFocus,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    centerTitle: true,
                    toolbarHeight: 100,
                    title: Text(
                      'cities', // TODO: l10n
                      style: AppFonts.circeBold(36, AppColors.black),
                    ),
                    expandedHeight: 180,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextFormField(
                            controller: viewModel.searchBarController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: 'search', // TODO: l10n
                              contentPadding: EdgeInsets.all(12),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ..._bodySlivers,
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> get _bodySlivers {
    if (viewModel.isLoading) {
      return [
        const SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ];
    }

    if (viewModel.errorMessage.isNotEmpty) {
      return [
        SliverFillRemaining(
          child: Center(
            child: Text(viewModel.errorMessage),
          ),
        ),
      ];
    }

    if (viewModel.searchBarController.text.isEmpty) {
      return [
        const SliverFillRemaining(
          child: Center(
            child: Text('Faça uma pesquisa'),
          ),
        ),
      ];
    }

    return [
      SliverList(
        delegate: SliverChildListDelegate(
          viewModel.cityViewModels.map((viewModel) {
            return CityItemView(viewModel: viewModel);
          }).toList(),
        ),
      ),
    ];
  }
}
