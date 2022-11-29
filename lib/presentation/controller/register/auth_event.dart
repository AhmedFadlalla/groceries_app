import 'package:equatable/equatable.dart';
import 'package:grocery_app/domain/entities/base_auth_data.dart';

abstract class BaseAuthEvent extends Equatable{

  @override
  List<Object?> get props => [];
  const BaseAuthEvent();

}
class SignUpEvent extends BaseAuthEvent{
  final String userName;
  final String email;
  final String password;

  SignUpEvent({
    required this.userName,required this.email,required this.password});
}
class SignInEvent extends BaseAuthEvent{
  final String email;
  final String password;

  SignInEvent({required this.email,required this.password});
}
class LogoutEvent extends BaseAuthEvent{}