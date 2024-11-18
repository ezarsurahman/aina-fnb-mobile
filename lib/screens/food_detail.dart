import 'package:aina_fnb_mobile/screens/list_food_entry.dart';
import 'package:flutter/material.dart';
import 'package:aina_fnb_mobile/models/food_entry.dart';
import 'package:aina_fnb_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class FoodDetailPage extends StatefulWidget {
  final String foodID;
  const FoodDetailPage({super.key, required this.foodID});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  Future<FoodEntry> fetchFoodDetail(CookieRequest request) async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    final response = await request.get('http://localhost:8000/json/${widget.foodID}/'); 
    
    // Melakukan decode response menjadi bentuk json
    var data = response;
    var hasil = FoodEntry.fromJson(data[0]);
    
    // Melakukan konversi data json menjadi object FoodEntry
    List<FoodEntry> listFood = [];
    for (var d in data) {
      if (d != null) {
        listFood.add(FoodEntry.fromJson(d));
      }
    }
    return hasil;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Detail'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchFoodDetail(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
            
          } else {
              return Container(
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
                        Image.network("${snapshot.data.fields.img}"),
                        Text(
                          "${snapshot.data.fields.name}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("${snapshot.data.fields.price}"),
                        const SizedBox(height: 10),
                        Text("${snapshot.data.fields.ready}"),
                        const SizedBox(height: 10),
                        Text("${snapshot.data.fields.description}"),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () async {
                                if (context.mounted) {
                                  Navigator.pop(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              minimumSize: Size(double.infinity, 50),
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                            ),
                            child: const Text('Kembali'),
                          ),
                        ),
                        
                      ],
                    ),
                    
                  );
          }
        }
      )
    );
  }
}