import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app/bloc/home/cubit.dart';
import 'package:search_app/bloc/home/states.dart';
import 'package:search_app/model/ads_model.dart';
import 'package:search_app/screens/admin_screen/add_new_ads.dart';

class AdsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);

        return Scaffold(
          backgroundColor: Color(0xff2A2C3F),
          appBar: AppBar(
            backgroundColor: Color(0xff212332),
            title: Text('Ads Screen'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _cubit.adsImage = null;
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => AddNewAdsScreen()),
              );
            },
            child: Icon(Icons.add),
          ),
          body: state is! GetAllAdsLoading
              ? ListView.separated(
                  itemBuilder: (context, index) =>
                      _buildItem(_cubit.adsModel[index], _cubit),
                  separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 2,
                    color: Color(0xff323548),
                  ),
                  itemCount: _cubit.adsModel.length,
                )
              : Center(child: CircularProgressIndicator(color: Colors.white)),
        );
      },
    );
  }

  Widget _buildItem(AdsModel item, HomeCubit cubit) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.network(
          '${item.image}',
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 250,
          color: Colors.black.withOpacity(0.2),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: MaterialButton(
            onPressed: () {
              cubit.deleteAdsById(id: item.id, imgUrl: item.image.toString());
            },
            color: Colors.red,
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
