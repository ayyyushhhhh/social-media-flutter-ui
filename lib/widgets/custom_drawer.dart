import 'package:flutter/material.dart';
import 'package:social_media_ui/Screens/home_screen.dart';
import 'package:social_media_ui/Screens/login_screen.dart';
import 'package:social_media_ui/Screens/profile_page.dart';
import 'package:social_media_ui/data/data.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerOption({Icon icon, String title, Function onTap}) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl),
              ),
              Positioned(
                  bottom: 20,
                  left: 20,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 3,
                                  color: Theme.of(context).primaryColor)),
                          child: ClipOval(
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(currentUser.profileImageUrl),
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        currentUser.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ))
            ],
          ),
          _buildDrawerOption(
              icon: Icon(Icons.dashboard),
              title: "Home",
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              }),
          _buildDrawerOption(
              icon: Icon(Icons.chat), title: "Chat", onTap: () {}),
          _buildDrawerOption(
              icon: Icon(Icons.location_on), title: "Map", onTap: () {}),
          _buildDrawerOption(
              icon: Icon(Icons.account_circle),
              title: "Profile",
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                              user: currentUser,
                            )));
              }),
          _buildDrawerOption(
              icon: Icon(Icons.settings), title: "Settings", onTap: () {}),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: _buildDrawerOption(
              icon: Icon(Icons.directions_run),
              title: "Logout",
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LogInScreen()));
              },
            ),
          ))
        ],
      ),
    );
  }
}
