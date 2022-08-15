import 'package:flutter/material.dart';
import 'package:fruit_listview/src/models/fruit_data_model.dart';
import 'package:fruit_listview/src/pages/fruit_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

  static List<String> fruitname = ['Apple','Banana','Mango','Orange','Pineapple'];

  static List url = [
    'https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
    'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
    'https://media.istockphoto.com/photos/mango-isolated-on-white-background-picture-id911274308?k=20&m=911274308&s=612x612&w=0&h=YY8-xqycxsqFea5B-JdhlcgExlXYWMiFoLJdQ-LUx5E=',
    'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
    'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg'
  ];

  static List description = [
    'Apple is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
    'Banana is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
    'Mango is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
    'Orange is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
    'Pineapple is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'
  ];

  final List<FruitDataModel> FruitData = List.generate(fruitname.length, (index) =>
      FruitDataModel('${fruitname[index]}', '${url[index]}', '${description[index]}')
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff14b0c4),
        title: Text(widget.title),

      ),
      body: ListView.builder(
          itemCount: FruitData.length,
          itemBuilder: (context,index){
            return Container(
              height: 100,
              child: Card(
                child: Align(
                  alignment: Alignment.center,
                  child: ListTile(
                    title: Text(
                      FruitData[index].name,
                      style: TextStyle(fontSize: 25),
                    ),
                    leading: SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.network(FruitData[index].ImageUrl),
                    ),
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => FruitDetail(fruitDataModel: FruitData[index])
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          }
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader( // <-- SEE HERE
              decoration: BoxDecoration(color: const Color(0xff1f6883)),
              accountName: Text(
                "Panitan Kuedoy",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "6350110013@psu.ac.th",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/jom.jpg'),
              ),
            ),

            ListTile(
              leading: Icon(
                Icons.apple,
              ),
              title: const Text('Apple'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => FruitDetail(fruitDataModel: FruitData[0],)

                    )
                );
                },
            ),
            Divider(
              thickness: 0.8,
            ),



    ListTile(
              leading: Icon(
                Icons.app_registration,
              ),
              title: const Text('Banana'),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => FruitDetail(fruitDataModel: FruitData[1],)

            )
        );
      },
    ),
            Divider(
              thickness: 0.8,
            ),

            ListTile(
              leading: Icon(
                Icons.coffee,
              ),
              title: const Text('Mango'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => FruitDetail(fruitDataModel: FruitData[2],)

                    )
                );
              },
            ),
            Divider(
              thickness: 0.8,
            ),


            ListTile(
              leading: Icon(
                Icons.ac_unit,
              ),
              title: const Text('Orange'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => FruitDetail(fruitDataModel: FruitData[3],)

                    )
                );
              },
            ),
            Divider(
              thickness: 0.8,
            ),

            ListTile(
              leading: Icon(
                Icons.access_time_outlined,
              ),
              title: const Text('Pineapple'),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => FruitDetail(fruitDataModel: FruitData[4],)

                    )
                );
              },
            ),
            Divider(
              thickness: 0.8,
            ),
          ],
        ),
      ),
    );
  }
}
