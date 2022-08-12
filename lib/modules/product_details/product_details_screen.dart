import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/shop_app/home_model.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class ProductDetailsScreen extends StatelessWidget {
  int index;
  ProductsModel model;

  ProductDetailsScreen({
    Key? key,
    required this.index,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(

          ),
          body: ListView(
            children: [
              SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Image(
                              image: NetworkImage(model.image),
                              width: double.infinity,
                              height: 350,
                            ),
                            if (model.discount != 0)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(

                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  color: Colors.red,
                                  child:  Text(
                                    'Discount ${model.discount} %',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.name,
                                style: const TextStyle(
                                  height: 1.3,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${model.price.round()} LE',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red[800],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  if (model.discount != 0)
                                    Text(
                                      '${model.oldPrice.round()} LE',
                                      style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  SizedBox(width: 130,),
                                  FloatingActionButton(
                                    mini: true,
                                   elevation: 7.7,
                                    hoverColor: Colors.black,
                                    focusColor: Colors.black,




                                    child: Icon(Icons.add_shopping_cart),


                                    onPressed: () {
                                      cubit.addToCart(model);
                                      showToast(
                                          text: "Item added to the cart",
                                          state: ToastStates.SUCCESS);


                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,

                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Container(
                                        width: 300,
                                        child: Text(

                                          model.description,
                                          style: const TextStyle(


                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),



            ],
          ),

        );
      },
    );
  }
}
