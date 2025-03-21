// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mediasquest/providers/creators_provider.dart';
import 'package:mediasquest/providers/types_provider.dart';
import 'package:mediasquest/themes/app_color.dart';
import 'package:mediasquest/views/widgets/creators_list.dart';
import 'package:mediasquest/views/widgets/main_layout.dart';
import 'package:mediasquest/views/widgets/reload.dart';
import 'package:provider/provider.dart';

class CreatorsScreen extends StatefulWidget {
  const CreatorsScreen({super.key, required this.typeId});

  final int typeId;

  @override
  State<CreatorsScreen> createState() => _CreatorsScreenState();
}

class _CreatorsScreenState extends State<CreatorsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<CreatorsProvider>(context, listen: false).fetchCreators(widget.typeId));
  }

  @override
  Widget build(BuildContext context) {
    final CreatorsProvider creatorsProvider = Provider.of<CreatorsProvider>(context);
    return MainLayout(
      title: Provider.of<TypesProvider>(context).types.firstWhere((element) => element.id == widget.typeId).name,
      body: creatorsProvider.isLoading
        ? Center(
          child: LoadingAnimationWidget.fourRotatingDots(
            color: AppColor.accentColor,
            size: MediaQuery.of(context).size.width / 5,
          ),
        )
        : creatorsProvider.error != null
          ? Reload(
            error: creatorsProvider.error!,
            onTap: () => creatorsProvider.fetchCreators(widget.typeId),
          )
          : CreatorsList(typeId: widget.typeId,)
    );
  }
}
