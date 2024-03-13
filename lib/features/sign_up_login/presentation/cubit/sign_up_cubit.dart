import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/sign_up_login/presentation/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
}
