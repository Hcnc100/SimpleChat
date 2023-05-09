import 'package:chat_app/models/api/register_dto.dart';
import 'package:chat_app/ui/screens/register_screen/view_model/register_state.dart';

class CredentialsDTO {
  final String email;
  final String password;

  CredentialsDTO({
    required this.email,
    required this.password,
  });

  factory CredentialsDTO.fromRegisterState(RegisterState registerState) =>
      CredentialsDTO(
        email: registerState.email,
        password: registerState.password,
      );
}
