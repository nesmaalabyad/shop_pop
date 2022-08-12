import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../product_details/product_details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) => {},
      builder: (context, state) {

        return Container(
          child: Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) =>
            ShopCubit.get(context).favoritesModel!.data.data.isNotEmpty,
            widgetBuilder: (BuildContext context) => ListView.separated(
              itemBuilder: (context, index) => buildFavItem(
                  ShopCubit.get(context).favoritesModel!.data.data[index].product,
                  context,
              ),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: ShopCubit.get(context).favoritesModel!.data.data.length,
            ),
            fallbackBuilder: (BuildContext context) => defaultFallback(
                text: 'Nothing in the Favorite ... '),
          ),
        );
      },
    );
  }

  Widget buildFavItem( model, BuildContext context,) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: SizedBox(
      height: 120,
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage('${model.image}'),
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
              if (model.discount != 0)
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
//decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
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
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    height: 1.3,
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      '${model.price.round()}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red[800],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
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
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        
                        ShopCubit.get(context)
                            .changeFavorites(productId: model.id,);
                      },
                      icon: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: ShopCubit.get(context).favorites[model.id]!
                            ? Icon(
                          Icons.favorite,
                          size: 20,
                          color: Colors.red,
                        )
                            : Icon(
                          Icons.favorite_outline,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}