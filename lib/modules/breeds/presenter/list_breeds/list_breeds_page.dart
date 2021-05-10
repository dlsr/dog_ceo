import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breeds/list_breeds_bloc.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breeds/states/state.dart';

class ListBreedsPage extends StatefulWidget {
  @override
  _ListBreedsPageState createState() => _ListBreedsPageState();
}

class _ListBreedsPageState
    extends ModularState<ListBreedsPage, ListBreedsBloc> {
  @override
  void initState() {
    super.initState();
    controller.add(Events.fetch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Raças disponíveis"),
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream: controller.stream,
              builder: (context, snapshot) {
                final state = controller.state;

                if (state is ListBreedsStart) {
                  return Center(
                    child: Text("Digite um texto"),
                  );
                }
                if (state is ListBreedsError) {
                  return Center(
                    child: Text("Houve um erro"),
                  );
                }

                if (state is ListBreedsLoading) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final list = (state as ListBreedsSuccess).list;

                return Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, id) {
                        final item = list[id];
                        return ListTile(
                          title: Text(item.breedName),
                          onTap: () {
                            Modular.to.pushNamed(
                              "/list_breed_images",
                              arguments: {
                                "breedName": item.breedName,
                              },
                            );
                          },
                        );
                      }),
                );
              })
        ],
      ),
    );
  }
}
