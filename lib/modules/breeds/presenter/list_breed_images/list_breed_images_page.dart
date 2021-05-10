import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breed_images/list_breed_images_bloc.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breed_images/states/state.dart';

class ListBreedImagesPage extends StatefulWidget {
  final String breedName;

  const ListBreedImagesPage({Key key, this.breedName}) : super(key: key);

  @override
  _ListBreedImagesPageState createState() => _ListBreedImagesPageState();
}

class _ListBreedImagesPageState
    extends ModularState<ListBreedImagesPage, ListBreedImagesBloc> {
  @override
  void initState() {
    super.initState();
    controller.add(widget.breedName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.breedName),
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream: controller.stream,
              builder: (context, snapshot) {
                final state = controller.state;

                if (state is ListBreedImagesStart) {
                  return Center(
                    child: Text("Digite um texto"),
                  );
                }
                if (state is ListBreedImagesError) {
                  return Center(
                    child: Text("Houve um erro"),
                  );
                }

                if (state is ListBreedImagesLoading) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                final list = (state as ListBreedImagesSuccess).list;

                return Expanded(
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, id) {
                        final item = list[id];
                        return ListTile(
                          title: Image.network(item.imageUrl),
                        );
                      }),
                );
              })
        ],
      ),
    );
  }
}
