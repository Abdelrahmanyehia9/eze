part of "../home_screen.dart";

class _ChatFeaturesGrid extends StatelessWidget {
  final List<ChatFeatureEntity> features;
  final ValueChanged<ChatFeatureEntity> onChanged;
  const _ChatFeaturesGrid(this.features, {required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: features.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: UISizes.sp2 * 1.1,
        crossAxisSpacing: UISizes.sp6,
        mainAxisSpacing: UISizes.sp6,
      ),
      itemBuilder: (_, i) => _FeatureBox(entity: features[i], onChanged: onChanged,),
    );
  }
}

class _FeatureBox extends StatelessWidget {
  final ChatFeatureEntity entity;
  final ValueChanged<ChatFeatureEntity> onChanged ;
  const _FeatureBox({required this.entity, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final feature = entity.feature;
    final color = feature.color(context);
    return Container(
      decoration: BoxDecoration(
        color: color.veryLight,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(UISizes.r8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (feature.svg != null)
            SvgPicture.asset(
              width: UISizes.sp24,
              feature.svg!,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
          AppText(
            feature.title,
            textAlign: TextAlign.center,
            style: context.textTheme.labelSmall,
            color: color,
          ),
          AppSwitch(
            width: UISizes.w32,
            height: UISizes.h16,
            value: entity.enabled,
            onChanged: (r)=>onChanged.call(entity.copyWith(enabled: r)),
            activeColor: color,
          ),
        ],
      ),
    );
  }
}
