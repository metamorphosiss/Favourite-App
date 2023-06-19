import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider/favorit.provider.dart';
import 'package:flutter_application_1/screen/favorit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List listData = [];
  //there are a lot way for fetching data like Dio or try  & catch
  Future getData() async {
    final url = Uri.parse('https://reqres.in/api/users?page=2');
    // can also wirte like this  instead of final=> http.Response response ;
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        final Map<String, dynamic> mapResponse = jsonDecode(response.body);

        listData = mapResponse['data'];
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoritProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Screen show ',
            style: TextStyle(wordSpacing: 3),
          ),
        ),
        body: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (ctx, index) => Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                              listData[index]["avatar"],
                            ),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 0),
                        child: Column(
                          children: [
                            Text(listData[index]["email"].toString()),
                            Text(listData[index]["first_name"].toString()),
                            Text(listData[index]["last_name"].toString()),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          provider.toggleFavorit(listData[index]);
                        },
                        icon: provider.isTrue(listData[index])
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(Icons.favorite_border))
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              final route =
                  MaterialPageRoute(builder: (context) => const FavoritPage());
              Navigator.push(context, route);
            },
            label: const Text('favorits')));
  }
}
