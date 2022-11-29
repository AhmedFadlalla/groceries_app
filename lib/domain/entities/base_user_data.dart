import 'package:equatable/equatable.dart';

class BaseUserData extends Equatable {
  final String name;
  final String email;
  final String address;
  final String phone;
  final String image;

  const BaseUserData(
      {required this.name,
      required this.email,
      required this.address,
      required this.phone,
      required this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, phone, address, image];
}
