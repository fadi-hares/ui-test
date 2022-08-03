import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../details/details_view.dart';
import '../resourses/color_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.align_horizontal_left_sharp,
                              color: ColorManager.primary,
                              size: 20,
                            ),
                            Icon(
                              Icons.more_vert_sharp,
                              color: ColorManager.primary,
                              size: 20,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const ClipOval(
                          child: Image(
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/1.png'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Hira Riaz',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: ColorManager.primary,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'UX/ UI Designer',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _getColumn('\$8900', 'Income'),
                              const VerticalDivider(
                                thickness: 1,
                                width: 40,
                              ),
                              _getColumn('\$5500', 'Expenses'),
                              const VerticalDivider(
                                thickness: 1,
                                width: 40,
                              ),
                              _getColumn('\$890', 'Loon'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Overview',
                            style: TextStyle(
                              color: ColorManager.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Stack(
                            children: [
                              const Icon(
                                CupertinoIcons.bell,
                                color: ColorManager.primary,
                                size: 20,
                              ),
                              Positioned(
                                right: 0,
                                child: Container(
                                  height: 7,
                                  width: 7,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        'Sept 13, 2020',
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                _getContainer(
                  Icons.arrow_upward,
                  'Sent',
                  'Sending Payment to Clients',
                  '\$150',
                ),
                _getContainer(
                  Icons.arrow_downward,
                  'Receive',
                  'Receiving Salary from Company',
                  '\$250',
                ),
                _getContainer(
                  CupertinoIcons.money_dollar_circle,
                  'Loan',
                  'Loan for the Car',
                  '\$400',
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          if (value == 4) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailsView(),
                ));
          } else {
            setState(() {
              _currentIndex = value;
            });
          }
        },
        currentIndex: _currentIndex,
        backgroundColor: ColorManager.secondary,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: ColorManager.primary,
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
            backgroundColor: ColorManager.secondary,
            icon: const Icon(CupertinoIcons.home),
            activeIcon: _getActiveIcon(CupertinoIcons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorManager.secondary,
            icon: const Icon(Icons.credit_card),
            activeIcon: _getActiveIcon(Icons.credit_card),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorManager.secondary,
            icon: const Icon(Icons.add),
            activeIcon: _getActiveIcon(Icons.add),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorManager.secondary,
            icon: const Icon(CupertinoIcons.money_dollar),
            activeIcon: _getActiveIcon(CupertinoIcons.money_dollar),
            label: '',
          ),
          BottomNavigationBarItem(
            backgroundColor: ColorManager.secondary,
            icon: const Icon(CupertinoIcons.profile_circled),
            activeIcon: _getActiveIcon(CupertinoIcons.profile_circled),
            label: '',
          ),
        ],
      ),
    );
  }

  int _currentIndex = 2;

  _getActiveIcon(IconData iconData) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.primary,
      ),
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }

  _getColumn(String num, String text) {
    return Column(
      children: [
        Text(
          num,
          style: const TextStyle(fontSize: 15, color: ColorManager.primary),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 10, color: Colors.black),
        ),
      ],
    );
  }

  _getContainer(IconData icon, String title, String subtitle, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(2, 5),
            ),
          ],
        ),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorManager.darkSecondary,
            ),
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 10,
            ),
          ),
          trailing: Text(
            price,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
