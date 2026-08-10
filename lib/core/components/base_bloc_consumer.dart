import 'package:eze/core/extensions/color.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eze/core/cubit/base_state.dart';
import 'package:eze/core/errors/exceptions.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BaseBlocConsumer<B extends BlocBase<BaseState<S>>, S>
    extends StatelessWidget {
  final Widget Function(BaseState state)? builder;
  final Widget Function()? loadingBuilder;
  final Widget Function(S data)? successBuilder;
  final Widget Function(AppException error)? failureBuilder;
  final Widget Function()? emptyBuilder;
  final void Function(S data)? onSuccess;
  final void Function()? onLoading;
  final void Function(AppException error)? onFailure;
  final void Function()? onEmpty;
  final B? bloc;
  final bool loadingAnimationEnabled;

  const BaseBlocConsumer({
    super.key,
    this.bloc,
    this.builder,
    this.loadingBuilder,
    this.successBuilder,
    this.failureBuilder,
    this.emptyBuilder,
    this.onSuccess,
    this.onLoading,
    this.onFailure,
    this.onEmpty,
    this.loadingAnimationEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final B cubit = bloc ?? context.read<B>();

    return SkeletonizerConfig(
      data: SkeletonizerConfigData(
        enableSwitchAnimation: true,

        effect: ShimmerEffect(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          baseColor: context.colors.surfaceContainerLow,
          highlightColor: context.colors.surfaceContainerLowest,
        ),
        containersColor: context.colors.surfaceContainerLow.lighten(0.03),
      ),
      child: BlocConsumer<B, BaseState<S>>(
        bloc: cubit,

        listener: (context, state) {
          if (state.isFailure && onFailure != null) {
            onFailure!(state.error!);
          } else if (state.isLoading && onLoading != null) {
            onLoading!();
          } else if (state.isSuccess && onSuccess != null) {
            onSuccess!(state.data as S);
          } else if (state.isEmpty && onEmpty != null) {
            onEmpty!();
          }
        },
        builder: (context, state) {
          if (builder != null) return builder!(state);
          if (state.isLoading && loadingBuilder != null) {
            return Skeletonizer(
              enabled: loadingAnimationEnabled,
              child: loadingBuilder!(),
            );
          }
          if (state.isSuccess && successBuilder != null) {
            return successBuilder!(state.data as S);
          }
          if (state.isFailure) {
            return failureBuilder == null
                ? const SizedBox.shrink()
                : failureBuilder!(state.error!);
          }
          if (state.isEmpty) {
            return emptyBuilder == null
                ? const SizedBox.shrink()
                : emptyBuilder!();
          }
          // return Text(state.status.toString());
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
