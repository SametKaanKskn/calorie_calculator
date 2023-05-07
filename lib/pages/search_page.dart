import 'package:calorie_calculator/models/task_model.dart';
import 'package:calorie_calculator/view/widgets/custom_search_delegate.dart';
import 'package:calorie_calculator/view/widgets/task_list_item.dart';
import 'package:calorie_calculator/view_modal/providers/food_api_provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<Task> _allTasks;
  @override
  void initState() {
    super.initState();
    _allTasks = <Task>[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 10,
        backgroundColor: Colors.amber,

        title: GestureDetector(
          onTap: () {
            _showAddTaskBottomSheet();
            //text e tıklanıldıgında ilgili ekran açılabilecek.
          },
          child: const Text(
            "Aramak İstediginiz Besini Giriniz",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
        centerTitle: true, //text ortalandı
        actions: [
          IconButton(
              onPressed: () {
                _showSearchPage();
              },
              icon: Icon(
                Icons.search,
                color: Colors.blue,
              )),
          //Görevler arasında arama işlemi yaptırma butonu
          IconButton(
            onPressed: () {
              _showAddTaskBottomSheet();
            },
            //Bu butona tıkladıgınıldınga bu butonu çalıştır
            icon: const Icon(Icons.add, color: Colors.blue),
            //Görev ekleme butonu eklendi
          ),
        ],
      ),
      body: _allTasks.isNotEmpty
          ? ListView.builder(
              itemBuilder: (
                context,
                index,
              ) {
                var _oankiListeElemani = _allTasks[index];
                return Dismissible(
                    background: Container(
                      color: Colors.red,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 35,
                          ),
                        ],
                      ),
                    ),
                    key: Key(_oankiListeElemani.id),
                    onDismissed: (direction) {
                      _allTasks.removeAt(index);
                      setState(() {});
                    },
                    child: TaskItem(task: _oankiListeElemani));
              },
              itemCount: _allTasks.length,
            )
          : Center(
              child: Text("BESİNLER"),
            ),
    );
  }

//Sınıfın içerisinde oldugumuz için metot yerine fonksiyon oluşturdum.
  void _showAddTaskBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          //Padding kısmında klavye açıldıktan sonra text kısmının klavyenin yukarıda kalması saglandı.
          width: MediaQuery.of(context)
              .size
              .width, //Ekranın genişligi kadar bütün ekrana yayılma
          height: 100, // Yükseklik vererek daha rahat yazma
          child: ListTile(
            //ListTile verme sebebim kendiliginden gölge vermesi
            title: TextField(
              autofocus: true,
              style: const TextStyle(fontSize: 20),
              decoration:
                  const InputDecoration(hintText: "Eklemek İstediginiz Besin"),
              onSubmitted: (value) {
                Provider.of<FoodApiProvider>(context, listen: false)
                    .getNutrition(value);
                Navigator.of(context)
                    .pop(); //kullanıcıdan veri aldıktan sonra kapanmasını saglayacak.
                if (value.length > 3) {
                  DatePicker.showDatePicker(context, onConfirm: (time) {
                    var yeniEklenecekGorev =
                        Task.create(name: value, createdAt: time);
                    _allTasks.add(yeniEklenecekGorev);
                    setState(() {});
                  });
                }
              },
            ),
          ),
        );
      },
    );
  }

  void _showSearchPage() async {
    await showSearch(
        context: context, delegate: CustomSearchDelegate(allTasks: _allTasks));
  }
}
