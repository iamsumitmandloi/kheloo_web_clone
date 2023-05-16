import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'bottom_nav.dart';
import 'floating_action_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'kheloo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgs = [
    'https://kheloo.com/images/Banner11.jpg',
    'https://kheloo.com/images/10minwith.png',
    'https://kheloo.com/images/Banner18.jpg',
    'https://kheloo.com/images/Banner11.jpg',
  ];
  static const textStyle1 = TextStyle(
    color: Color(0XFFF6c859),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.amber,
        flexibleSpace: FlexibleSpaceBar(
          title: SizedBox(
            // height: 55,
            // width: 110,
            child: Image.network(
              'https://kheloo.com/images/logo.gif',
            ),
          ),
          titlePadding: const EdgeInsets.only(
            top: 20,
            left: 15,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.black,
        actions: [
          SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://kheloo.com/images/promotion_icon.png',
                  height: 25,
                ),
                const Text(
                  'Promotions',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Color(0XFFF6c859),
                    fontSize: 9,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          DecoratedBox(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFD370),
                Color(0xFFF7AD07),
              ],
              stops: [0.0, 0.5],
            )),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              child: const Text('Login'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  viewportFraction: 1.0,
                  onPageChanged: (i, r) {
                    setState(() => _current = i);
                  }),
              items: imgs.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      // margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(color: Colors.amber),
                      child: Image.network(
                        i,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgs.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 2.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.amberAccent
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              height: 55,
              width: double.infinity,
              decoration: const BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  image:
                      NetworkImage('https://kheloo.com/images/langstrip.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: const Text(
                      'English',
                      style: textStyle1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: const Text(
                      'हिन्दी',
                      style: textStyle1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: const Text(
                      'తెలుగు',
                      style: textStyle1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: const Text(
                      'ಕನ್ನಡ',
                      style: textStyle1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: const Text(
                      'मराठी',
                      style: textStyle1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: const Text(
                      '...',
                      style: textStyle1,
                    ),
                  ),
                ],
              ),
            ),

            ///jackpot
            Container(
              width: double.infinity,
              height: 145,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://kheloo.com/images/jackpot.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Text(
                '  8988659',
                textAlign: TextAlign.center,
                textScaleFactor: 2.9,
                style: TextStyle(
                  height: 2.7,
                  letterSpacing: 11.1,
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFbe1e2d),
                ),
              ),
            ),

            const SizedBox(height: 15),

            ///live withdraw
            Column(
              children: [
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFF08F0F), // #f08f0f
                        Color(0xFFFFFFFF), // #fff
                      ],
                      stops: [0.0, 0.8],
                    ).createShader(bounds);
                  },
                  child: const Text(
                    'Live Withdrawal',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 160,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.red)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              height: 34,
                              width: 34,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.amber.shade600, width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Aahan',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                Text(
                                  '6 second ago',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Text(
                              '₹ 40',
                              style: TextStyle(color: Colors.white),
                            ),
                          ]),
                          Row(children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              height: 34,
                              width: 34,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.amber.shade600, width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Aahan',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white),
                                ),
                                Text(
                                  '6 second ago',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                            Text(
                              '₹ 70',
                              style: TextStyle(color: Colors.white),
                            ),
                          ]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  height: 34,
                                  width: 34,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.amber.shade600,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Aahan',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '6 second ago',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                                Text(
                                  '₹ 400',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  height: 34,
                                  width: 34,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.amber.shade600,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(20)),
                                  child:
                                      Icon(Icons.person, color: Colors.white),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Aahan',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '6 second ago',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                                Text(
                                  '₹ 400',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ]),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            /// games
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFF08F0F), // #f08f0f
                    Color(0xFFFFFFFF), // #fff
                  ],
                  stops: [0.0, 0.8],
                ).createShader(bounds);
              },
              child: const Text(
                'GAMES',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              color: Color(0xFFF08F0F),
              indent: 110.0,
              endIndent: 110.0,
              thickness: 2.5,
            ),
            const SizedBox(
              height: 14,
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 8),
                  Container(
                    color: const Color(0xFFF08F0F),
                    child: const VerticalDivider(
                      color: Color(0xFFF08F0F),
                      thickness: 5,
                      width: 5,
                      indent: 0,
                      endIndent: 20,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Most Popular   (6)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  DecoratedBox(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFFFD370),
                        Color(0xFFF7AD07),
                      ],
                      stops: [0.0, 0.5],
                    )),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                        ),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                          const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        elevation: MaterialStateProperty.all<double>(0),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: MaterialStateProperty.all<Size>(Size.zero),
                        alignment: Alignment.center,
                      ),
                      child: const Text('Show More'),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 140,
                  width: 160,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber.shade600, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: const Image(
                            image: NetworkImage(
                                'https://luckmedia.link/roy_teen_patti/thumb.webp'),
                            fit: BoxFit.fill),
                      ),
                      Container(
                        height: 32,
                        // padding: EdgeInsets.all(5),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: const Center(
                          child: Text(
                            'Min.10 | Max.10k',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 140,
                  width: 160,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber.shade600, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: const Image(
                            height: 104,
                            width: double.infinity,
                            image: NetworkImage(
                                'https://cdn.hub88.io/spribe/sbe_aviator.png'),
                            fit: BoxFit.fill),
                      ),
                      Container(
                        height: 32,
                        // padding: EdgeInsets.all(5),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: const Center(
                          child: Text(
                            'Min.10 | Max.10k',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 140,
                  width: 160,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber.shade600, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: const Image(
                            image: NetworkImage(
                                'https://luckmedia.link/roy_teen_patti/thumb.webp'),
                            fit: BoxFit.fill),
                      ),
                      Container(
                        height: 32,
                        // padding: EdgeInsets.all(5),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: const Center(
                          child: Text(
                            'Min.10 | Max.10k',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 140,
                  width: 160,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber.shade600, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: const Image(
                            height: 104,
                            width: double.infinity,
                            image: NetworkImage(
                                'https://cdn.hub88.io/spribe/sbe_aviator.png'),
                            fit: BoxFit.fill),
                      ),
                      Container(
                        height: 32,
                        // padding: EdgeInsets.all(5),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: const Center(
                          child: Text(
                            'Min.10 | Max.10k',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
      floatingActionButton: const FloatingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
