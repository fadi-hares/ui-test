import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../resourses/color_manager.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondary,
      appBar: AppBar(
        leadingWidth: 50,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: ColorManager.primary,
            size: 30,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.search,
              color: ColorManager.primary,
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: ColorManager.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Recent Transactions',
                      style: TextStyle(
                        color: ColorManager.primary,
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        color: ColorManager.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 7),
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'All',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'Income',
                        style: TextStyle(color: ColorManager.primary),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'Expense',
                        style: TextStyle(color: ColorManager.primary),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  'Today',
                  style: TextStyle(
                    color: ColorManager.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              Padding(
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
                  child: const ListTile(
                    leading: Icon(
                      CupertinoIcons.mail,
                      size: 40,
                      color: ColorManager.primary,
                    ),
                    title: Text(
                      'Payment',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Payment from Andrea',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 10,
                      ),
                    ),
                    trailing: Text(
                      '\$30.00',
                      style: TextStyle(
                        color: ColorManager.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
              _getFullCircleWidget(),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: ColorManager.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text('See Details'),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getFullCircleWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 25),
            child: _getCircleWidget(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: _getCircleAvatarWidget('assets/images/2.jpeg'),
          ),
          Positioned(
            left: 5,
            top: 100,
            child: _getCircleAvatarWidget('assets/images/3.jpg'),
          ),
          Positioned(
            top: 100,
            right: 5,
            child: _getCircleAvatarWidget('assets/images/4.jpeg'),
          ),
          Positioned(
            bottom: 15,
            right: 35,
            child: _getCircleAvatarWidget('assets/images/5.jpg'),
          ),
          Positioned(
            bottom: 15,
            left: 35,
            child: _getCircleAvatarWidget('assets/images/6.jpg'),
          ),
        ],
      ),
    );
  }

  Widget _getCircleAvatarWidget(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Colors.black12,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: ClipOval(
        child: Image(
          fit: BoxFit.cover,
          height: 50,
          width: 50,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }

  Widget _getCircleWidget() {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: ColorManager.darkSecondary,
            width: 3,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorManager.secondary,
              width: 30,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorManager.secondary2,
                width: 20,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorManager.secondary,
                  width: 20,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorManager.primary,
                    width: 3,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 5,
                    ),
                  ),
                  child: const ClipOval(
                    child: Image(
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                      image: AssetImage('assets/images/1.png'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
