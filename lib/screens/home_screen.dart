import 'package:flutter/material.dart';
import 'package:free_dividend/widgets/asset_box.dart';
import 'package:free_dividend/widgets/bottom_navbar.dart';
import 'package:free_dividend/widgets/category_container.dart';
import 'package:free_dividend/widgets/sub_title_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.33);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.amber.shade200,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Welcomeback'), Text('Olivai Blue!')],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            height: 60,
                            width: 60,
                            child: Center(child: Icon(Icons.calendar_month, color: Colors.grey.shade400)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '검색하세요.',
                          suffixIcon: Icon(Icons.search_rounded),
                          border: InputBorder.none,
                          // isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: -9),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  SubTitleText(text: 'Popular Categories'),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    children: [for (int i = 0; i < 10; i++) CategoryContainer(text: 'test-$i')],
                  ),
                  SizedBox(height: 40),
                  SubTitleText(text: 'Most popular assets'),
                  SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width / 3,
                            margin: EdgeInsets.only(right: 8),
                            child: AssetsBox(
                              icon: Icon(Icons.two_k_outlined, size: 30),
                              assetName: 'Twitch',
                              pricePM: '+ 12.17%',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomNavBar(),
        ],
      ),
    );
  }
}
