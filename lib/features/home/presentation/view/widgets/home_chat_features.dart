part of '../home_screen.dart';

class _HomeChatFeatures extends StatelessWidget {
  const _HomeChatFeatures();

  @override
  Widget build(BuildContext context) {
    return BaseBlocConsumer<SettingsCubit, SettingsEntity>(
      successBuilder: _builder,
      loadingBuilder: ()=>_builder(SettingsEntity.fake()),
    );
  }

  Widget _builder(SettingsEntity settings)=>Column(
    children: [
      const SectionHeader(title: "عناصر التحكم"),
       _ChatFeaturesGrid(settings.sysControl.features),
    ],
  );
}
