import 'package:flutter/material.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;


  const CustomBottomNavbar({
    required this.currentIndex,
    required this.onTap

});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blueGrey,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: true,

      items: [
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(255, 112, 56, 75),
          icon: Icon(
            Icons.home_max_sharp,
            color: currentIndex == 0 ? Colors.white : Colors.black,

          ),label: 'Home'
        ),

        BottomNavigationBarItem(icon: Icon(Icons.category_outlined,
        color: currentIndex == 1 ? Colors.white : Colors.black,
        ),
        label: 'Category'
        ),
        

        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined,
        color: currentIndex == 2 ? Colors.white : Colors.black,
        ),
        label: 'Profile'
        ),
      ],
    );
  }
}