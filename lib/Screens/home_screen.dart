import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/widgets/custom_drawer.dart';
import 'package:social_media_ui/widgets/following_Users.dart';
import 'package:social_media_ui/widgets/post_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).primaryColor,
            size: 40,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Frenzy",
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 34,
              fontWeight: FontWeight.bold,
              letterSpacing: 10),
        ),
        bottom: TabBar(
          controller: _tabController,
          unselectedLabelStyle: TextStyle(fontSize: 18),
          labelColor: Theme.of(context).primaryColor,
          indicatorWeight: 3,
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          tabs: [
            Text(
              'Trending',
            ),
            Text(
              'Latest',
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: [
          FollowingUsers(),
          PostCarousel(
              pageController: _pageController, title: "Posts", posts: posts),
        ],
      ),
    );
  }
}
