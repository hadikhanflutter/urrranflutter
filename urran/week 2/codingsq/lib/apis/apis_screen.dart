import 'package:codingsq/apis/products/services/service_product.dart';
import 'package:codingsq/apis/products/utilities/app_assets.dart';
import 'package:codingsq/apis/products/utilities/rest_api_utilitties.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model_post.dart';

class ApisScreen extends StatefulWidget {
  const ApisScreen({Key? key}) : super(key: key);

  @override
  State<ApisScreen> createState() => _ApisScreenState();
}

class _ApisScreenState extends State<ApisScreen> {
  Future<List<ModelPost>>? _future_list;

  @override
  void initState() {
    super.initState();
    setState(() {
      _future_list = ServiceProduct.LoadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APIS'),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
              future: _future_list,
              builder: (context, AsyncSnapshot<List<ModelPost>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child:
                        RestApiUtilities.ShowLoadingView(BuildContext, context),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      '${snapshot.error}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ));
                  } else if (snapshot.hasData) {
                    List<ModelPost> list = snapshot.data!;
                    if (list.length > 0) {
                      return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                RestApiUtilities.ShowLoadingViewDialog(
                                    BuildContext, context);
                                Navigator.pop(context);
                              },
                              title: Text('${list[index].title}'),
                              subtitle: Text('${list[index].description}'),
                              trailing: Text('${list[index].price}'),
                              leading: CircleAvatar(
                                radius: 20,
                                child: Text('${list[index].id}'),
                              ),
                            );
                          });
                    } else {
                      return Center(
                        child: RestApiUtilities.ShowErrorWithReloadView(
                            BuildContext,
                            context,
                            AppAssets.error_view,
                            'No Record Found', () {
                          setState(() {
                            _future_list = ServiceProduct.LoadProducts();
                          });
                        }),
                      );
                    }
                  } else {
                    return SizedBox();
                  }
                }
                return SizedBox();
              }),
        ),
      ),
    );
  }
}
