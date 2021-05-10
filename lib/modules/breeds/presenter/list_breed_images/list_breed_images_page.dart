import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breed_images/list_breed_images_bloc.dart';
import 'package:pet_ceo/modules/breeds/presenter/list_breed_images/states/state.dart';
import 'package:pet_ceo/modules/breeds/presenter/utils/utils.dart';

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
        title: Text(Utils.capitalize(widget.breedName)),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: controller.stream,
            builder: (context, snapshot) {
              final state = controller.state;

              if (state is ListBreedImagesSuccess) {
                final list = state.list;

                return Expanded(
                  child: LazyLoadScrollView(
                    onEndOfPage: () => controller.add(widget.breedName),
                    scrollOffset: 70,
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, id) {
                        final item = list[id];
                        return ListTile(
                          title: Image.network(item.imageUrl),
                        );
                      },
                    ),
                  ),
                );
              } else if (state is ListBreedImagesError) {
                return Center(
                  child: Text("Houve um erro"),
                );
              } else {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
