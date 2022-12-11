import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/presentation/controller/home/home_bloc.dart';
import 'package:grocery_app/presentation/controller/home/home_event.dart';
import 'package:grocery_app/presentation/controller/home/home_state.dart';
import 'package:grocery_app/presentation/screens/component/compenent.dart';

import '../../../../../../core/services/service_locator.dart';
import '../../../../../../core/utils/end_point.dart';
import '../../../../../../core/utils/enum.dart';
import 'add_to_cart_bottom.dart';
import 'counter_component.dart';
import 'display_details_component.dart';

class ProductDetailsBody extends StatelessWidget {
  final int id;
  const ProductDetailsBody({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context)=>sl<HomeBloc>()..add(GetProductDetailsDataEvent(id: id)),
      child: BlocConsumer<HomeBloc,HomeState>(
        builder: (context,state){
          switch(state.productDetailsState){
            case RequestState.loading:
              return const Center(child:  CircularProgressIndicator(),);
            case RequestState.loaded:
              var data=state.productDetailsData;
             return  Padding(
               padding: const EdgeInsets.all(10.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Stack(
                     children: [
                       Container(
                         width: 413.6,
                         height: 371.44,
                         alignment: Alignment.center,
                         decoration: BoxDecoration(
                           color: Color(0xffF2F3F2),
                           borderRadius: BorderRadius.only(topLeft: Radius.circular(0),topRight: Radius.circular(0),bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
                           image: DecorationImage(
                             image:
                             data!.image.isEmpty || data.image == null?
                             Image.asset('assets/icons/Group.png').image :
                             Image.network(
                               '$baseUrlImage${data.image}',
                                 fit: BoxFit.fitWidth,
                               errorBuilder: (context, object, stackTrace) {
                                 return Image.asset('assets/icons/Group.png');
                               },
                             ).image,
                           ),
                         ),
                         child : data.image.split('.').last.toLowerCase() == 'svg' ?
                         SvgPicture.network(
                           '$baseUrlImage/${data.image}',
                           fit: BoxFit.fitWidth,
                           width: 250,
                           placeholderBuilder: (BuildContext context) => Container(
                               padding: const EdgeInsets.all(10.0),
                               child: const CircularProgressIndicator()),
                         ) : Container(),
                       ),
                       Positioned(child: IconButton(onPressed: (){
                         Navigator.pop(context);
                       }, icon:const  Icon(Icons.arrow_back_ios_new_rounded))),
                       Positioned(
                           right: 0,
                           child: IconButton(onPressed: (){
                           },
                               icon:const  Image(image: AssetImage("assets/icons/up.png"))))

                     ],
                   ),
                   Row(
                     children: [
                       Text(
                         data!.name,
                         style: Theme.of(context)
                             .textTheme
                             .headline1!
                             .copyWith(color: Colors.black, fontSize: 25),
                       ),
                       const Spacer(),
                       IconButton(
                           onPressed: () {}, icon: Icon(Icons.favorite_outline_sharp))
                     ],
                   ),
                   Text(
                     "${data.quantity}pcs,PriceEG",
                     style: Theme.of(context)
                         .textTheme
                         .caption!
                         .copyWith(color: Colors.grey, fontSize: 15),
                   ),
                   SizedBox(
                     height: height * 0.04,
                   ),

                   SizedBox(
                     height: height * 0.02,
                   ),
                   myDivider(),
                   DisplayDetailsComponent(id: id),
                   myDivider(),
                   Row(
                     children: [
                       const Text(
                         "Nutrition",
                         style: TextStyle(fontSize: 17),
                       ),
                       const Spacer(),
                       Container(
                         decoration: BoxDecoration(
                             color: Color(0xff7C7C7C),
                             borderRadius: BorderRadius.circular(10)),
                         child: Padding(
                           padding: const EdgeInsets.all(3.0),
                           child: Text(
                             "100gr",
                             style: TextStyle(color: Colors.grey, fontSize: 12),
                           ),
                         ),
                       ),
                       IconButton(
                           onPressed: () {},
                           icon: Icon(
                             Icons.arrow_forward_ios,
                             size: 18,
                             color: Colors.black,
                           ))
                     ],
                   ),
                   myDivider(),
                   Row(
                     children: [
                       const Text(
                         "Review",
                         style: TextStyle(fontSize: 17),
                       ),
                       const Spacer(),
                       RatingBar.builder(
                         initialRating: 3,
                         minRating: 1,
                         direction: Axis.horizontal,
                         allowHalfRating: true,
                         itemCount: 5,
                         itemBuilder: (context, _) => Icon(
                           Icons.star,
                           color: Colors.amber,
                         ),
                         onRatingUpdate: (rating) {
                           print(rating);
                         },
                       ),
                       IconButton(
                           onPressed: () {},
                           icon: Icon(
                             Icons.arrow_forward_ios,
                             size: 18,
                             color: Colors.black,
                           ))
                     ],
                   ),
                   AddToCartBottom(id:id),
                 ],
               ),
             );
            case RequestState.error:
              return Center(child: Text(state.productDetailsMessage),);

          }
        },
        listener: (context,state){

        },
      ),
    );
  }
}
