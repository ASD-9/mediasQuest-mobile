import 'package:flutter/material.dart';
import 'package:mediasquest/models/creator_model.dart';
import 'package:mediasquest/providers/creators_provider.dart';
import 'package:mediasquest/themes/app_color.dart';
import 'package:provider/provider.dart';

class CreatorsList extends StatelessWidget {
  const CreatorsList({super.key});

  @override
  Widget build(BuildContext context) {
    final CreatorsProvider creatorsProvider = Provider.of<CreatorsProvider>(context);
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: creatorsProvider.creators.length,
      itemBuilder: (context, index) {
        final CreatorModel creator = creatorsProvider.creators[index];
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/medias", arguments: creator.id),
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  creator.name,
                  style: TextStyle(
                    fontSize: 22
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: creator.mediasCompleted / creator.mediasNotCompleted
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${creator.mediasCompleted}/${creator.mediasNotCompleted}",
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
