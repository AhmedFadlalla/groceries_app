import 'package:flutter/material.dart';

class BaseCounter extends StatelessWidget {
  final int? counter;

  final VoidCallback? incrementFunction;
  final VoidCallback? decrementFunction;
  const BaseCounter({
    Key? key,
    this.counter, this.decrementFunction, this.incrementFunction
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon:const Icon(Icons.remove),
          onPressed: decrementFunction,
          color: Theme.of(context).primaryColor,
        ),
        Text(counter.toString()),
        IconButton(
          icon:const Icon(Icons.add),
          onPressed: incrementFunction,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }
}
