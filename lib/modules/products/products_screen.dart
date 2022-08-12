import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shop_pop/modules/cubit/states.dart';
import 'package:shop_pop/modules/cubit/states.dart';


import '../../models/shop_app/categories_model.dart';
import '../../models/shop_app/home_model.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../cubit/states.dart';
import '../cubit/states.dart';
import '../cubit/states.dart';
import '../cubit/states.dart';
import '../cubit/states.dart';
import '../cubit/states.dart';
import '../cubit/states.dart';
import '../product_details/product_details_screen.dart';

class ProductsScreen extends StatelessWidget {
   ProductsScreen({Key? key}) : super(key: key);
  bool tri=true;
  int num=0;
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopCubit, ShopStates>(
      builder: (context, state) {
        return Conditional.single(
          context: context,
          conditionBuilder: (BuildContext context) =>
              ShopCubit.get(context).homeModel != null &&
              ShopCubit.get(context).categoriesModel != null,
          widgetBuilder: (BuildContext context) => productsBuilder(
              ShopCubit.get(context).homeModel,
              ShopCubit.get(context).categoriesModel,
              context),
          fallbackBuilder: (BuildContext context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
      listener: (context, state) {
        if (state is ShopSuccessFavoritesState) {
          if (!state.model.status) {
            showToast(
              text: state.model.message,
              state: ToastStates.ERROR,
            );
          }
        }
      },
    );
  }

  Widget productsBuilder(HomeModel? model, CategoriesModel? categoriesModel,
          BuildContext context) =>
      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: model!.data.banners
                  .map(
                    (e) => Image(
                      image: NetworkImage(e.image),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'New Products',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey[300],
              child: GridView.count(
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1 / 1.58,
                crossAxisCount: 2,
                children: List.generate(
                    model.data.products.length,
                    (index) => buildGridProduct(
                        model.data.products[index], context, index)),
              ),
            ),
          ],
        ),
      );

  Widget buildGridProduct(

    ProductsModel model,
    BuildContext context,
    int index,
  ) =>
      Container(
        color: Colors.white,
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                navigateTo(
                    context, ProductDetailsScreen(index: index, model: model));
              },
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.image),
                    width: double.infinity,
                    height: 180,
                  ),
                  if (model.discount != 0)
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        color: Colors.red,
                        child: Text(
                          'Discount ${model.discount} %',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
             Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      model.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        height: 1.3,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${model.price.round()}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red[800],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      if (model.discount != 0)
                        Text(
                            '${model.oldPrice.round()}',
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 14,
                              color: Colors.black45,
                            ),
                          ),

Spacer(),

                      InkWell(
                        onTap: () {
                          ShopCubit.get(context)
                              .changeFavorites(productId: model.id);
                        },
                        child:  Container(
                            //radius: 10,
                            color: Colors.white,
                            child: ShopCubit.get(context).favorites[model.id]!
                                ? Icon(
                                    Icons.favorite,
                                    size: 26,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.favorite_outline,
                                    size: 26,
                                    color: Colors.redAccent,
                                  ),
                          ),

                      ),
                      SizedBox(width: 10,),

                      InkWell(
                        onTap: () {
                          num=1;
                          tri=false;
                          ShopCubit.get(context).addToCart(model);



                        },
                        child: State is ShopSuccessAddItemToCartState?
                        Container(
                         // radius: 10,
                          color: Colors.white,
                          child:  Icon(
                            Icons.shopping_cart,
                            size: 26,
                            color: Colors.redAccent,
                          )

                        ): Container(
     child: Icon(
     Icons.add_shopping_cart_outlined,
     size: 26,
     color: Colors.redAccent,
     ),
   ),
                      ),
                      SizedBox(width: 10,),
                    ],
                  ),
                ],
              ),

          ],
        ),
      );

  Widget buildCategoryItem(DataModel model) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(model.image),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          Container(
            width: 100,
            color: Colors.black.withOpacity(0.8),
            child: Text(
              model.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
}
