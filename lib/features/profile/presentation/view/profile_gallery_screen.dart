import 'package:eze/core/components/app_scaffold.dart';
import 'package:eze/core/components/app_text.dart';
import 'package:eze/core/components/default_appbar.dart';
import 'package:eze/core/extensions/theme.dart';
import 'package:eze/core/helper/ui_sizes.dart';
import 'package:eze/core/utils/app_icons.dart';
import 'package:eze/features/profile/presentation/view/layout/profile_gallery_grid.dart';
import 'package:eze/shared/data/models/typed_media_model.dart';
import 'package:eze/shared/presentation/view/widgets/add_media_container.dart';
import 'package:flutter/material.dart';

class ProfileGalleryScreen extends StatelessWidget {
  final List<TypedMediaModel> gallery;

  const ProfileGalleryScreen({super.key, required this.gallery});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const DefaultAppBar(title: "معرض الصور", centerTitle: true),
      body: ProfileGalleryGrid(
        start: const AddMediaContainer(),
        gallery: gallery,
      ),
    );
  }
}
