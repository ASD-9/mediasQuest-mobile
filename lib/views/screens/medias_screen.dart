// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mediasquest/providers/creators_provider.dart';
import 'package:mediasquest/providers/medias_provider.dart';
import 'package:mediasquest/themes/app_color.dart';
import 'package:mediasquest/views/widgets/medias_list.dart';
import 'package:mediasquest/views/widgets/main_layout.dart';
import 'package:mediasquest/views/widgets/reload.dart';
import 'package:provider/provider.dart';

class MediasScreen extends StatefulWidget {
  const MediasScreen({super.key, required this.creatorId, required this.typeId});

  final int creatorId;
  final int typeId;

  @override
  State<MediasScreen> createState() => _MediasScreenState();
}

class _MediasScreenState extends State<MediasScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<MediasProvider>(context, listen: false).fetchMedias(widget.creatorId, widget.typeId));
  }

  @override
  Widget build(BuildContext context) {
    final MediasProvider mediasProvider = Provider.of<MediasProvider>(context);
    return MainLayout(
      title: Provider.of<CreatorsProvider>(context).creators.firstWhere((element) => element.id == widget.creatorId).name,
      body: mediasProvider.isLoading
        ? Center(
          child: LoadingAnimationWidget.fourRotatingDots(
            color: AppColor.accentColor,
            size: MediaQuery.of(context).size.width / 5,
          ),
        )
        : mediasProvider.error != null
          ? Reload(
            error: mediasProvider.error!,
            onTap: () => mediasProvider.fetchMedias(widget.creatorId, widget.typeId),
          )
          : MediasList()
    );
  }
}
