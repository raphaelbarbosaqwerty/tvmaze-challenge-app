import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/domain/errors/errors.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/home_store.dart';
import 'package:tvseries_maze_challenge_clean/app/modules/home/presenter/states/home_state.dart';

import 'components/custom_gridview/custom_gridview_widget.dart';
import 'components/search_bar_field/search_bar_field_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "TVMaze"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  //use 'controller' variable to access controller
  FocusNode searchField;
  HomeStore store;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchField = FocusNode();
    store = controller;
  }

  @override
  void dispose() {
    searchField.dispose();
    super.dispose();
  }

  Widget _buildError(Failure error) {
    if (error is EmptyList) {
      return Center(
        child: Text('Nothing found'),
      );
    } else if (error is ErrorSearch) {
      return Center(
        child: Text('Error in TVMaze'),
      );
    } else {
      return Center(
        child: RaisedButton(
          child: Text('Try again'),
          onPressed: () async {
            store.nextPageNumber();
            await store.fetchSeries();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBarField(searchField: searchField, store: controller),
        actions: [
          IconButton(icon: 
            Icon(Icons.search), 
            onPressed: () => searchField.requestFocus()
          )
        ],
      ),
      body: SingleChildScrollView(
        child: RxBuilder(
          builder: (_) {
            var state = store.state;

            if(state.value is ErrorState) {
              return _buildError(state.value.error as Failure);
            }

            if(state.value is SuccessState) {
              return Column(
                children: [
                  CustomGridView(state: state),
                  if(store.serieName.value == '')
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                            child: RaisedButton(
                              child: Text('< Back'),
                              onPressed: store.pageNumber.value > 0 ? () async {
                                if(store.pageNumber.value > 0) {
                                  store.backPageNumber();
                                  await store.fetchSeries();
                                }
                              } : null,
                            ),
                          ),
                          Center(
                            child: RaisedButton(
                              child: Text('${store.pageNumber.value}'),
                              onPressed: () {},
                            ),
                          ),
                          Center(
                            child: RaisedButton(
                              child: Text('Next >'),
                              onPressed: () async {
                                store.nextPageNumber();
                                await store.fetchSeries();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
            } else if (state.value is LoadingState) {
              return Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

