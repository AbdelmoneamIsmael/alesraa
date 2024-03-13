import 'package:bloc/bloc.dart';

part 'prodyuct_detail_state.dart';

class ProdyuctDetailCubit extends Cubit<ProdyuctDetailState> {
  ProdyuctDetailCubit() : super(ProdyuctDetailInitial());
}
