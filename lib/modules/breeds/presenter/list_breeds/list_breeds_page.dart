import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breeds/list_breeds_bloc.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breeds/states/state.dart';
import 'package:pet_ceo/modules/breeds/presenter/utils/utils.dart';

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
        title: Text("Raças"),
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
                  child: ListView.separated(
                      itemCount: list.length,
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemBuilder: (_, id) {
                        final item = list[id];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(
                              Utils.capitalize(item.breedName),
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right),
                            onTap: () {
                              Modular.to.pushNamed(
                                "/list_breed_images",
                                arguments: {
                                  "breedName": item.breedName,
                                },
                              );
                            },
                          ),
                        );
                      }),
                );
              })
        ],
      ),
    );
  }
}
