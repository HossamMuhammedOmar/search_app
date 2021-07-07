import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';

class UserAdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
        return Scaffold(
          backgroundColor: Color(0xff2A2D40),
          appBar: AppBar(
            backgroundColor: Color(0xff212332),
            title: Text('Users List'),
          ),
          body: state is! AdminUserCountLoaingState
              ? ListView.separated(
                  itemBuilder: (context, index) => _buildItem(
                        _cubit.userAdminModle[index],
                        _cubit,
                        _cubit.userAdminIDS[index],
                        context,
                      ),
                  separatorBuilder: (context, index) => Container(
                        width: double.infinity,
                        height: 2,
                        color: Color(0xff323548),
                      ),
                  itemCount: _cubit.userAdminModle.length)
              : Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                )),
        );
      },
    );
  }

  Widget _buildItem(item, HomeCubit cubit, id, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item['email'] != null)
              Text(
                '${item['email']}',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            SizedBox(height: 5),
            if (item['name'] != null)
              Text(
                '${item['name']}',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            if (item['phone'] != null)
              Text(
                '${item['phone']}',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            if (item['type'] == 'store')
              Text(
                '${item['shop']['address']['storeName']}',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            SizedBox(height: 5),
            if (item['type'] == 'store')
              Text(
                '${item['shop']['address']['storePhone']}',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            SizedBox(height: 5),
            if (item['type'] == 'store')
              Text(
                '${item['shop']['address']['governorate']}',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            SizedBox(height: 5),
            if (item['type'] == 'store')
              Text(
                '${item['shop']['categories']}',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
            SizedBox(height: 5),
            if (item['type'] == 'user')
              Text(
                '${item['type']}',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xffE2A435),
                ),
              ),
            if (item['type'] == 'store')
              Text(
                '${item['type']}',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff0596FF),
                ),
              ),
            if (item['type'] == 'user')
              Text(
                'BLOCK ${item['block']}',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff0AE6A8),
                ),
              ),
            SizedBox(height: 5),
            Text(
              '${item['uId']}',
              maxLines: 1,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            if (item['type'] == 'user')
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      cubit.blockUser(uId: id);
                    },
                    color: Color(0xffFA2538).withOpacity(0.5),
                    textColor: Colors.white,
                    child: Text('BLOCK'),
                  ),
                  SizedBox(width: 10),
                  MaterialButton(
                    onPressed: () {
                      cubit.unBlockUser(uId: id);
                    },
                    color: Color(0xff01EAFF).withOpacity(0.5),
                    textColor: Colors.white,
                    child: Text('UN BLOCK'),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
