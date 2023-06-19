import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider/favorit.provider.dart';

class FavoritPage extends StatelessWidget {
  const FavoritPage({super.key});

  @override
  Widget build(BuildContext context) {
     Widget mainContent = const Center(
      child: Text('please pick some favorite!!'),
     );
     
    final provider = Provider.of<FavoritProvider>(context);
    final listData = provider.listData;
    if(listData.isNotEmpty){
      mainContent= ListView.builder(
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
                              Icons.delete_sharp,
                              color: Color.fromARGB(255, 131, 131, 131),
                            )
                          : const Icon(Icons.favorite_border))
                ],
              ),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('final page'),
      ),
      body:mainContent,
    );
  }
}
