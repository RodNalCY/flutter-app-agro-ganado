import 'package:flutter/material.dart';
import 'package:proinnovate_flutter_app/features/animales/views/animal_add_page.dart';
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
        appBar: AppBar(
          title: const Text(
            "Lista de Animales",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.lightBlueAccent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<AnimalViewModel>(
                builder: (context, viewModel, child) {
                  return TextField(
                    decoration: InputDecoration(
                      hintText: "Buscar animal...",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    AnimalAddPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0); // 👈 entra desde abajo
                      const end = Offset.zero;
                      const curve = Curves.ease;

                      var tween = Tween(
                        begin: begin,
                        end: end,
                      ).chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: FadeTransition(
                          // 👈 combina fade + slide
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
              ),
            );
          },
          backgroundColor: Colors.lightBlue,
          child: const Icon(Icons.add, size: 32, color: Colors.white),
          shape: const CircleBorder(),
        ),
        body: Consumer<AnimalViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const LinearProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.blue,
              );
            }

            if (viewModel.error != null) {
              return Center(child: Text("Error: ${viewModel.error}"));
            }

            if (viewModel.animals.isEmpty) {
              return const Center(child: Text("No hay animales disponibles"));
            }

            return ListView.builder(
              itemCount: viewModel.animals.length,
              itemBuilder: (context, index) {
                return AnimalCard(animal: viewModel.animals[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
