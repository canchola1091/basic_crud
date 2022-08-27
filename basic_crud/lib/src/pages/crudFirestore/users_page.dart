

import 'package:basic_crud/src/controllers/firestore/users_controller.dart';
import 'package:basic_crud/src/models/firestore/user_model.dart';
import 'package:basic_crud/src/pages/crudFirestore/detail_user.dart';
import 'package:basic_crud/src/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:basic_crud/src/theme/theme.dart' as th;
import 'package:get/route_manager.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
      init: UsersController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const CustomText(fTxt: 'Lista de usuarios', fSize: 17.0),
          centerTitle: true,
        ),
        body: StreamBuilder<List<UserModel>>(
          stream: _.readUsers(),
          builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
            if(snapshot.hasError){
              return _errorText(snapshot.error.toString());
            } else if(snapshot.hasData) {
              final List<UserModel> _users = snapshot.data!;
              return _listUsers(_users);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: th.primaryColor,
          child: const Icon(Icons.group_add),
          tooltip: 'Crear usuario',
          onPressed: _.goToCreateUser
        )
      )
    );
  }

  Widget _errorText(String error) {
    return Center(
      child: CustomText(
        fTxt: 'Ocurrio un error $error',
        fSize: 17.0
      )
    );
  }

  Widget _listUsers(List<UserModel> users) {
    return  ListView.separated(
      itemCount: users.length,
      separatorBuilder: (__, int i) => Divider(color: th.primaryColor, indent: 20.0, endIndent: 20.0),
      itemBuilder: (___, int index) => _itemUser(users[index])
    );
  }

  Widget _itemUser(UserModel userModel) {
    return GetBuilder<UsersController>(
      builder: (_) => ListTile(
        leading: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () => _.goToEditUser(userModel)
        ),
        title: CustomText(fTxt: userModel.name, fSize: 17.0),
        subtitle: CustomText(fTxt: userModel.email, fSize: 16.0),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => _.showAlertDeleteUser(userModel.id)
        ),
        onTap: () => Get.to( () => DetailUserPage(user: userModel))
      )
    );
  }


}