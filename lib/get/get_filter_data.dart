import 'package:api_integration_full/api_services.dart';
import 'package:flutter/material.dart';

import '../Models/users_list_model.dart';

class GetFilterData extends StatefulWidget {
  const GetFilterData({super.key});

  @override
  State<GetFilterData> createState() => _GetFilterDataState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _GetFilterDataState extends State<GetFilterData>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    getuserList();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool isLoading = false;

  getuserList() {
    setState(() {
      isLoading = true;
    });
    ApiServices().getUserList().then((value) {
      _forMale(value!.users!);
      _forFemale(value!.users!);
      setState(() {
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

  List<Users> male = [];

  List<Users> _forMale(List<Users> list) {
    for (var element in list) {
      if (element.gender == "male") {
        male.add(element);
      }
    }
    return male;
  }

  List<Users> female = [];

  List<Users> _forFemale(List<Users> list) {
    for (var element in list) {
      if (element.gender == "female") {
        female.add(element);
      }
    }
    return male;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GET FILTER DATA'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.male),
              text: "MALE",
            ),
            Tab(
              icon: Icon(Icons.female),
              text: "FEMALE",
            ),

          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  <Widget>[
          maleUsers(),
          femaleUsers(),
        ],
      ),
    );
  }

  maleUsers() {
    return ListView.builder(
        itemCount: male.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text((index + 1).toString()),
            ),
            title: Text(male[index].gender.toString()),
          );
        });
  }
  femaleUsers() {
    return ListView.builder(
        itemCount: female.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text((index + 1).toString()),
            ),
            title: Text(female[index].gender.toString()),
          );
        });
  }
}
