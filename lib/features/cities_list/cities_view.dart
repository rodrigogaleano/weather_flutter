import 'package:flutter/material.dart';

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
                    centerTitle: true,
                    title: const Text('Cities'), // TODO: l10n
                    expandedHeight: 160,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.bottomCenter,
                        child: TextFormField(
                          controller: viewModel.searchBarController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: 'City',
                            contentPadding: EdgeInsets.all(12),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
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

    if (viewModel.cityViewModels.isEmpty || viewModel.searchBarController.text.isEmpty) {
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
