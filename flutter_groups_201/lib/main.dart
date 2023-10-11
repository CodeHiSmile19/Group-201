import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 32),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE84C4F).withOpacity(0.22),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Flexible(
                            child: Text(
                              "Jl . Jayakatwang no 301",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SvgPicture.asset('assets/vectors/ic_arrow_down.svg'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 73),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 32,
                        height: 32,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(0xFF1D2D50),
                        ),
                        child: SvgPicture.asset('assets/vectors/ic_bell.svg'),
                      ),
                      Positioned(
                        bottom: -3,
                        right: 0,
                        child: Container(
                          height: 14,
                          width: 14,
                          decoration: BoxDecoration(
                            color: Color(0xFF1E5F74),
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 325,
            width: double.infinity,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: foods.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 16);
              },
              itemBuilder: (context, index) {
                final item = foods[index];
                return Container(
                  width: 300,
                  height: 323,
                  // padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(
                        '${item.image}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FoodEntity {
  String? foodName;
  String? image;

  FoodEntity({
    this.image,
    this.foodName,
  });
}

List<FoodEntity> foods = [
  FoodEntity(
    foodName: "Pizza",
    image:
        "https://img.freepik.com/photos-gratuite/vue-dessus-pizza-au-pepperoni-saucisses-aux-champignons-poivron-olive-mais-bois-noir_141793-2158.jpg?w=2000",
  ),
  FoodEntity(
    foodName: "Noodle",
    image:
        "https://assets.bonappetit.com/photos/5c5d936be81bbf522a957993/1:1/w_2700,h_2700,c_limit/sambolognese-ramen-noodles.jpg",
  ),
];
