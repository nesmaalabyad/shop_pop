import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/icon_broken.dart';
import '../cart/cart_screen.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../edit/edit_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => ShopCubit()..getUserData(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) => ShopCubit.get(context).userDataModel!=null,
            widgetBuilder: (BuildContext context) {
              var model = ShopCubit.get(context).userDataModel;
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 63,
                          backgroundColor:Colors.redAccent[100],

                          child: const CircleAvatar(
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.white,
                            radius: 60.0,
                          child: Icon(Icons.person,size: 100,),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Text(
                            '${model!.data!.name?.toUpperCase()}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontSize: 18,
                            ),
                          )),
                      const SizedBox(
                        height: 50,
                      ),

                      InkWell(
                        onTap: () {
                          navigateTo(context, const EditScreen());
                        },
                        child: Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.redAccent[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Icon(Icons.edit,color: Colors.white,),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios,color: Colors.white,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      InkWell(
                        onTap: () {
                          navigateTo(context, const CartScreen());
                        },
                        child: Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.redAccent[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Icon(Icons.shopping_cart,color: Colors.white,),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Cart',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios,color: Colors.white,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          print(ShopCubit.get(context).cartItems!.length);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.redAccent[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Icon(Icons.info_outline_rounded,color: Colors.white,),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  ' Account info',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios,color: Colors.white,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                        },
                        child: Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.redAccent[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Icon(Icons.add_business_outlined,color: Colors.white,),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'About Us',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios,color: Colors.white,),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          print(ShopCubit.get(context).cartItems!.length);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.redAccent[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Icon(Icons.chat,color: Colors.white,),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  ' Contact Us',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios,color: Colors.white,),
                              ],
                            ),
                          ),
                        ),
                      ),


                      const SizedBox(height: 20,),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child:InkWell(
                          onTap: () {
                            signOut(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.redAccent[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: const [
                                  Icon(Icons.logout,color: Colors.white,),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    ' LOGOUT',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios,color: Colors.white,),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ),
                    ],
                  ),
                ),
              );
            },
            fallbackBuilder: (BuildContext context) => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

