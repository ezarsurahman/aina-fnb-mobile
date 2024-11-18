import 'package:aina_fnb_mobile/screens/food_detail.dart';
import 'package:flutter/material.dart';
import 'package:aina_fnb_mobile/models/food_entry.dart';
import 'package:aina_fnb_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class FoodEntryPage extends StatefulWidget {
  const FoodEntryPage({super.key});

  @override
  State<FoodEntryPage> createState() => _FoodEntryPageState();
}

class _FoodEntryPageState extends State<FoodEntryPage> {
  Future<List<FoodEntry>> fetchFood(CookieRequest request) async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    final response = await request.get('http://localhost:8000/json/');
    
    // Melakukan decode response menjadi bentuk json
    var data = response;
    
    // Melakukan konversi data json menjadi object FoodEntry
    List<FoodEntry> listFood = [];
    for (var d in data) {
      if (d != null) {
        listFood.add(FoodEntry.fromJson(d));
      }
    }
    return listFood;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchFood(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
            
          } else {
            if (snapshot.data.length == 0) {
              
              return Center(
                child:
                  Column(
                    children: [
                      Text(
                        'Belum ada Menu pada Aina FNB.',
                        style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.primary),
                      ),
                      SizedBox(height: 8),
                    ],
                  )
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => InkWell(
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    decoration:  BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image.network("${snapshot.data![index].fields.img}"),
                        Text(
                          "${snapshot.data![index].fields.name}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields.price}"),
                        const SizedBox(height: 10),
                        // Text("${snapshot.data![index].fields.ready}"),
                        // const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields.description}")
                      ],
                    ),
                  ),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FoodDetailPage(foodID:  snapshot.data![index].pk),
                    ))
                },
                )
              );
            }
          }
        },
      ),
    );
  }
}