import 'package:flutter/material.dart';
import 'package:food/view/controller/ColdDrink.dart';
import 'package:food/view/controller/Food.dart';
import 'package:food/view/controller/Fruit.dart';
import 'package:food/view/controller/Vegetable.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int initialtabindex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.location_on_rounded,
                  color: Colors.green,
                ),
                const SizedBox(width: 5),
                const Text("Surat,Gujarat"),
                const Spacer(),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'cart');
                    },
                    icon: const Icon(Icons.shopping_bag_outlined,color: Colors.white,),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hii Darshit",
                  style: GoogleFonts.ubuntu(
                    fontSize: 21,
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Find Your food",
                  style: GoogleFonts.ubuntu(
                      fontSize: 27, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                enabled: true,
                filled: true,
                fillColor: Colors.green.shade50,
                hintText: "Search Food",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Container(
                  margin: const EdgeInsets.all(8),
                  height: 43,
                  width: 43,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.settings_suggest,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 17),
          TabBar(
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            labelColor: Colors.green,
            controller: tabController,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.green,
            onTap: (val) {
              setState(() {
                initialtabindex = val;
              });
            },
            tabs: const [
              Tab(text: " Food   "),
              Tab(text: "   Fruit   "),
              Tab(text: "  Vegetables  "),
              Tab(text: "  Cold Drink "),
            ],
          ),
          Expanded(
            child: IndexedStack(
              index: initialtabindex,
              children: const [
                Food(),
                Fruit(),
                Vegetable(),
                ColdDrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
