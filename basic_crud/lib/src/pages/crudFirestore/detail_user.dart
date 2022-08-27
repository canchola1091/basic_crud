
import 'package:basic_crud/src/models/firestore/user_model.dart';
import 'package:basic_crud/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';


class DetailUserPage extends StatelessWidget {

  final UserModel user;

const DetailUserPage({
    Key? key,
    required this.user
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          fTxt: 'Información de ${user.name}',
          fSize: 17.0,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _itemInfo( 'ID', user.id ),
            _itemInfo( 'Nombre', user.name ),
            _itemInfo( 'Edad', '${user.age} años' ),
            _itemInfo( 'Email', user.email ),
            _itemInfo( 'Teléfono', user.phone ),
          ],
        ),
      )
    );
  }

  Widget _itemInfo(String title, String info) {
    return CustomText(
      fTxt: '$title: $info',
      fSize: 17.0
    );
  }

}