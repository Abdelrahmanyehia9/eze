part of '../home_screen.dart';

class _HomeChatFeatures extends StatelessWidget {
  const _HomeChatFeatures();

  @override
  Widget build(BuildContext context) {
    return BaseBlocConsumer<SystemControlCubit, SystemControlEntity>(
      successBuilder: _builder,
      loadingBuilder: () => _builder(SystemControlEntity.fake()),
    );
  }

  Widget _builder(SystemControlEntity control) {
    return Builder(
      builder: (context) {
        final settingsCubit = context.read<SystemControlCubit>();
        return Column(
          children: [
            const SectionHeader(title: "عناصر التحكم"),
            _ChatFeaturesGrid(
              control.features,
              onChanged: (entity) {
                settingsCubit.edit(control.updateFeature(entity));
              },
            ),
          ],
        );
      },
    );
  }
}
