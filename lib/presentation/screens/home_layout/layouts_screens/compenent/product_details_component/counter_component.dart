import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/presentation/controller/cart/cart_state.dart';

import '../../../../../../core/services/service_locator.dart';
import '../../../../../controller/cart/cart_bloc.dart';
import '../../../../../controller/home/home_bloc.dart';
import '../../../../../controller/home/home_event.dart';
import '../../../../../controller/home/home_state.dart';
//
// class CounterComponent extends StatefulWidget {
//   final int price;
//
//   const CounterComponent({Key? key,required this.price}) : super(key: key);
//
//   @override
//   State<CounterComponent> createState() => _CounterComponentState();
// }
//
// class _CounterComponentState extends State<CounterComponent> {
//   int count=1;
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context)=>sl<CartBloc>(),
//         child: BlocConsumer<CartBloc,CartState>(
//           builder: (context,state){
//
//             return Row(
//               children: [
//                 IconButton(
//                     onPressed: (){
//                       state.count>1?
//                      setState((){
//                        count--;
//                      })
//                       :null;
//                     },
//                     icon: const
//                     Image(
//                       image: AssetImage("assets/icons/minus.png"),)
//                 ),
//                 Container(
//                   height: 45.67,
//                   width: 45.67,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Colors.white,
//                       border:Border.all(width: 2,color: Colors.grey.shade200)
//                   ),
//                   child: Center(child: Text("${state.count}")),
//                 ),
//                 IconButton(
//                     onPressed: (){
//                       setState(() {
//                         count++;
//                       });
//                     },
//                     icon: const
//                     Image(
//                       image: AssetImage("assets/icons/plus.png"),)
//                 ),
//
//                 if(widget.visiable==true)
//                   Text(
//                     "\$${count*widget.price}",
//                     style: Theme.of(context)
//                         .textTheme
//                         .headline1!
//                         .copyWith(fontSize: 25, color: Colors.black),
//
//                   ),
//               ],
//             );
//           },
//           listener: (context,state){},));
//   }
// }

class CounterComponent extends StatefulWidget {
  final int price;
  final bool visiable;
  const CounterComponent({Key? key,required this.price,required this.visiable}) : super(key: key);

  @override
  State<CounterComponent> createState() => _CounterComponentState();
}

class _CounterComponentState extends State<CounterComponent> {
  int count=1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>sl<CartBloc>(),
        child: BlocConsumer<CartBloc,CartState>(
            builder: (context,state){

          return Row(
            children: [
              IconButton(
                  onPressed: (){
                    count>1?
                    setState(() {
                      count--;
                    }):null;
                  },
                  icon: const
                  Image(
                    image: AssetImage("assets/icons/minus.png"),)
              ),
              Container(
                height: 45.67,
                width: 45.67,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border:Border.all(width: 2,color: Colors.grey.shade200)
                ),
                child: Center(child: Text("$count")),
              ),
              IconButton(
                  onPressed: (){
                    setState(() {
                      count++;
                    });
                  },
                  icon: const
                  Image(
                    image: AssetImage("assets/icons/plus.png"),)
              ),

              if(widget.visiable==true)
                 Text(
                "\$${count*widget.price}",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 25, color: Colors.black),

              ),
            ],
          );
        },
        listener: (context,state){},));
  }
}
