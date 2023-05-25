
import 'package:flutter/material.dart';
import 'providers/Item_provider.dart';
import '/providers/items_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Items()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List of Items',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.data_object),
            Text('  List of Items'),
          ],
        ),
        actions:const <Widget> [
          Icon(Icons.more_vert),
        ],
      ),
       drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget> [
          DrawerHeader(
            decoration:const BoxDecoration(
              color: Colors.blue
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/beza.jpg'
                      ),
                      
                    ),
                ),
                  SizedBox(height: 18.0,
                  ),
                  Center(
                    child: Text(
                      'Bezawit Endale',
                    style: TextStyle(
                      color: Colors.white,
                       fontSize: 18.0,
                    ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'bezaendale27@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
              ],
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ListTile(
                leading: Icon(Icons.dashboard),
                title: Text('Dashbord'),
                onTap: (){
                  //update ui
                },
              ),
            ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ListTile(
                      leading: const Icon(Icons.data_object),
                                title: Text('Items'),
                                onTap: (){
                                  //update ui
                                },
                              ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ListTile(
                      leading: Icon(Icons.settings),
                                title: Text('Setting'),
                                onTap: (){
                                  //update ui
                                },
                              ),
                  ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: ListTile(
                  leading: Icon(Icons.person),
                title: Text('Account'),
                onTap: (){
                  //update ui
                },
                           ),
              ),
            ],
           ),
       ),
       
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

const SizedBox(height: 1),
              Expanded(
                child: ListView.builder(
                  itemCount: context.watch<Items>().items.length,
                  itemBuilder: (context, index) {
                    final item = context.watch<Items>().items[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color:
                          Color.fromARGB(179, 221, 216, 216),
                          width: 0.5)
                          ),
                        leading: Container(
                          width: 68,
                          height: 158,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                           ),
                          
                          child: Image.network(item.imageUrl,width: 10,)
                        ),
                        title: Text(item.name,style: const TextStyle(
                          fontWeight: FontWeight.bold),),
                        subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                        trailing: Icon(Icons.edit,color: Colors.black,),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ItemDetails(item: item),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: FloatingActionButton(
                       child: Icon(Icons.add),
                       onPressed: () {
                         // do something when the add icon is pressed
                       },
                     ),
               ),

            ],
          ),
        ),
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  final Item item;

  const ItemDetails({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(item.imageUrl),
            SizedBox(height: 16),
            Text(item.description),
          ],
        ),
      ),
    );
  }
}

