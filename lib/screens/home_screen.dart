import 'package:flutter/material.dart';
import 'package:task1/constants.dart';
import 'package:task1/models/match_data.dart';
import 'package:task1/services/networking.dart';
import 'package:task1/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<MatchData> _matchData;
  bool isLoading = true;
  DataApi data = DataApi();

  @override
  void initState() {
    super.initState();
    getDataRequest();
  }

  Future<void> getDataRequest() async {
    _matchData = await data.getData();
    setState(() {
      isLoading = false;
    });
    print(_matchData);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.pink[200],
        bottomNavigationBar: const BottomNavigation(),
        body: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UserProfile(width: width),
                  Expanded(
                    child: SizedBox(
                      height: height / 2 - 60,
                      child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: _matchData.length,
                              itemBuilder: (context, index) {
                                return MatchProfile(
                                    width: width, all_data: _matchData[index]);
                              }),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: height / 3,
              right: width / 2 - 25,
              child: const Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 70,
              ),
            ),
            Positioned(
                top: height / 3 + 20,
                right: width / 2 - 5,
                child: const Text(
                  '70%',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
          ],
        ));
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: width / 2 - 10,
              height: width / 2 + 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/profile.jpg',
                width: width / 2 - 20,
                height: width / 2,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Uddesh Rajoriya',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text('Gwalior, India', style: ksubHeadingGrey),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(text: 'Religion: ', style: ksubHeadingGrey),
                TextSpan(
                  text: 'Hindu',
                  style: ksubHeadingPink,
                ),
              ])),
              TextButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'My Visitors',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class MatchProfile extends StatelessWidget {
  const MatchProfile({Key? key, required this.width, required this.all_data})
      : super(key: key);
  final double width;
  final MatchData all_data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: width / 2 - 10,
              height: width / 2 + 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/match.jpg',
                width: width / 2 - 20,
                height: width / 2,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                child: Text(
                  // 'Uddesh Rajoriya',
                  all_data.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text('Gwalior, India', style: ksubHeadingGrey),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: 'Religion: ', style: ksubHeadingGrey),
                    const TextSpan(
                      text: 'Hindu',
                      style: ksubHeadingPink,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.pink,
                      ),
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.pink,
                      ),
                      child: const Icon(
                        Icons.message_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.pink,
                      ),
                      child: const Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
