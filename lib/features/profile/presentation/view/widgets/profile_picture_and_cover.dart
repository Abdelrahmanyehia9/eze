part of '../profile_screen.dart';

class _ProfilePictureAndCover extends StatelessWidget {
  final String? profilePic ;
  final String? cover ;
  final String username ;
  const _ProfilePictureAndCover({this.cover,required this.username, this.profilePic});

  @override
  Widget build(BuildContext context) {
    final coverSize = UISizes.sp140 * 1.22;
    final profileSize = UISizes.sp110;
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentGeometry.topCenter,
      children: [
        SizedBox(height: coverSize + (profileSize * .5)),
        EditOverlay(
          margin: EdgeInsets.all(UISizes.sp12),
          child: CoverProfile(cover, height: coverSize)
        ),
        Positioned(
          bottom: 0,
          child: EditOverlay(
            child: UserCircleAvatar(size: profileSize, username: username, image: profilePic,),
            onEdit: () {},
          ),
        ),
      ],
    );
  }

}
