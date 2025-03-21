// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mediasquest/providers/types_provider.dart';
import 'package:mediasquest/themes/app_color.dart';
import 'package:mediasquest/views/widgets/main_layout.dart';
import 'package:mediasquest/views/widgets/reload.dart';
import 'package:mediasquest/views/widgets/types_list.dart';
import 'package:provider/provider.dart';

class TypesScreen extends StatefulWidget {
  const TypesScreen({super.key});

  @override
  State<TypesScreen> createState() => _TypesScreenState();
}

class _TypesScreenState extends State<TypesScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<TypesProvider>(context, listen: false).fetchTypes());
  }

  @override
  Widget build(BuildContext context) {
    final TypesProvider typesProvider = Provider.of<TypesProvider>(context);
    return MainLayout(
      title: "Types",
      body: typesProvider.isLoading
        ? Center(
          child: LoadingAnimationWidget.fourRotatingDots(
            color: AppColor.accentColor,
            size: MediaQuery.of(context).size.width / 5,
          ),
        )
        : typesProvider.error != null
          ? Reload(
            error: typesProvider.error!,
            onTap: () => typesProvider.fetchTypes(),
          )
          : TypesList()
    );
  }
}
