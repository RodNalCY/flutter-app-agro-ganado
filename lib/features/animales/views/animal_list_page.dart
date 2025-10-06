import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/animales/views/animal_home_page.dart';
// import 'package:proinnovate_flutter_app/features/core/widgets/flushbar_widget.dart';
import 'package:proinnovate_flutter_app/features/core/widgets/navigator_widget.dart';
import 'package:provider/provider.dart';
import '../repositories/animal_repository.dart';
import '../services/animal_api_service.dart';
import '../viewmodels/animal_view_model.dart';
import 'widgets/animal_card.dart';

class AnimalListPage extends StatelessWidget {
  const AnimalListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AnimalViewModel(
        repository: AnimalRepository(apiService: AnimalApiService()),
      )..fetchAnimals(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // FlushbarWidget.show(
            //   context: context,
            //   message: "Animal cargado correctamente",
            //   icon: Icons.info_outline,
            //   color: Colors.blue,
            // );
            NavigatorWidget.pushWithSlideUp(context, AnimalHomePage());
          },
          backgroundColor: Color(0xFF13161c),
          child: const Icon(Icons.add, size: 32, color: Colors.white),
          shape: const CircleBorder(),
        ),
        body: Column(
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 10,
                ),
                child: PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: Consumer<AnimalViewModel>(
                    builder: (context, viewModel, child) {
                      return TextField(
                        decoration: InputDecoration(
                          hintText: "Buscar animal...",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (value) {
                          viewModel.filterAnimals(value);
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            Consumer<AnimalViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const LinearProgressIndicator(
                    backgroundColor: Colors.white,
                    color: Color(0xFF13161c),
                  );
                }

                if (viewModel.error != null) {
                  return Center(child: Text("${viewModel.error}"));
                }

                if (viewModel.animals.isEmpty) {
                  return const Center(
                    child: Text("No hay animales disponibles"),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.animals.length,
                    itemBuilder: (context, index) {
                      return AnimalCard(animal: viewModel.animals[index]);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
