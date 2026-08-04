part of '../profile_screen.dart';

class _ProfilePictureAndCover extends StatelessWidget {
  const _ProfilePictureAndCover();

  @override
  Widget build(BuildContext context) {
    final coverSize = UISizes.sp140 * 1.22;
    final profileSize = UISizes.sp110;
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentGeometry.topCenter,
      children: [
        SizedBox(height: coverSize + (profileSize * .5)),
        AppCachedNetworkImage(
          width: context.width,
          height: coverSize,
          "https://static.vecteezy.com/system/resources/thumbnails/071/963/718/small/a-beautiful-portrait-of-a-happy-young-african-woman-photo.jpg",
          placeholder: _placeHolderCover(context.width, coverSize),
        ),
        Positioned(
          bottom: 0,
          child: EditOverlay(
            child: UserCircleAvatar(size: profileSize),
            onEdit: () {},
          ),
        ),
      ],
    );
  }

  Widget _placeHolderCover(double width, double height) => Builder(
    builder: (context) {
      return ColoredBox(
        color: context.colors.secondary,
        child: SizedBox(
          width: width,
          height: height,
          child: Center(child: AppLogo(size: height * .5)),
        ),
      );
    },
  );
}
