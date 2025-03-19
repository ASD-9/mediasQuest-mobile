import 'package:flutter/material.dart';
import 'package:mediasquest/models/type_model.dart';
import 'package:mediasquest/providers/types_provider.dart';
import 'package:mediasquest/themes/app_color.dart';
import 'package:provider/provider.dart';

class TypesList extends StatelessWidget {
  const TypesList({super.key});

  @override
  Widget build(BuildContext context) {
    final TypesProvider typesProvider = Provider.of<TypesProvider>(context);
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: typesProvider.types.length,
      itemBuilder: (context, index) {
        final TypeModel type = typesProvider.types[index];
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/creators"),
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              type.name,
              style: TextStyle(
                fontSize: 22
              ),
            ),
          ),
        );
      },
    );
  }
}
