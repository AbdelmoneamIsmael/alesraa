import 'package:e_commerce/core/const/spaces.dart';
import 'package:e_commerce/core/widgets/buttom.dart';
import 'package:e_commerce/core/widgets/loading_overlay.dart';
import 'package:e_commerce/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAddProduct extends StatelessWidget {
  const MainAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocProvider(
          create: (context) => AddProductCubit(),
          child: BlocConsumer<AddProductCubit, AddProductState>(
            builder: (context, state) {
              AddProductCubit cubit = BlocProvider.of<AddProductCubit>(context);

              return Stack(
                children: [
                  cubit.page[cubit.pageNumber],
                  Positioned(
                    right: Spaces.width16,
                    left: Spaces.width16,
                    bottom: Spaces.height20 + Spaces.height20,
                    child: PrimeButtom(
                      text: 'Continue',
                      onTap: cubit.cheekAviability()
                          ? () {
                              cubit.changeCurrentPage(
                                  isNext: true, context: context);
                            }
                          : null,
                    ),
                  ),
                  state is LoadingState
                      ? const LoadingOverlay()
                      : const SizedBox(),
                ],
              );
            },
            listener: (context, state) {},
          ),
        ),
      ),
    );
  }
}
