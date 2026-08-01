part of '../profile_screen.dart';

class _ProfileBio extends StatelessWidget {
  const _ProfileBio();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        spacing: UISizes.sp4,
        children: [
          SectionHeader.smallHeader("نبذة عنى", context: context),
          AppReadMore(
            maxLines: 2,
            text:
                "شخص طموح وهادئ، أقدّر الصداقات الحقيقية وأحب خوض التحديات. أستمتع بالموسيقى، والسفر، وتجربة أشياء جديدة، وأؤمن بأن الاحترام واللطف هما أساس أي علاقة ناجحة.",
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
