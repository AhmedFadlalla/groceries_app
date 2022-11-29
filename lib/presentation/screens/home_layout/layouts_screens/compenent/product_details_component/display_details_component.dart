import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/presentation/controller/home/home_bloc.dart';
import 'package:grocery_app/presentation/controller/home/home_event.dart';
import 'package:grocery_app/presentation/controller/home/home_state.dart';

import '../../../../../../core/services/service_locator.dart';
class DisplayDetailsComponent extends StatefulWidget {
  final int id;
  const DisplayDetailsComponent({Key? key,required this.id}) : super(key: key);

  @override
  State<DisplayDetailsComponent> createState() => _DisplayDetailsComponentState();
}

class _DisplayDetailsComponentState extends State<DisplayDetailsComponent> {
  bool visiable=false;
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>sl<HomeBloc>()..add(GetProductDetailsDataEvent(id: widget.id)),
      child: BlocConsumer<HomeBloc,HomeState>(
          builder: (context,state){
        return Column(
          children: [
            Row(
              children: [
                const Text(
                  "Product Details",
                  style: TextStyle(
                      fontSize: 17
                  ),
                ),
                const Spacer(),
                IconButton(onPressed: (){
                  setState(() {
                    visiable=!visiable;
                  });
                }, icon: Icon(visiable==false?Icons.keyboard_arrow_down_outlined:Icons.keyboard_arrow_up_sharp,color: Colors.black,size: 28,))
              ],
            ),
            visiable==true?Text(
              state.productDetailsData!.description,
              style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Color(0xff7C7C7C),
                  fontSize: 15
              ),):Text(""),
          ],
        );
      }, listener: (context,state){}),

    );
  }
}
