import 'package:flutter/material.dart';
import 'package:mediasquest/models/media_model.dart';
import 'package:mediasquest/providers/medias_provider.dart';
import 'package:mediasquest/themes/app_color.dart';
import 'package:provider/provider.dart';

class MediasList extends StatelessWidget {
  const MediasList({super.key});

  @override
  Widget build(BuildContext context) {
    final MediasProvider mediasProvider = Provider.of<MediasProvider>(context);
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: mediasProvider.medias.length,
      itemBuilder: (context, index) {
        final MediaModel media = mediasProvider.medias[index];
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: AppColor.secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      media.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                  ),
                  Text(
                    media.role!.name,
                    style: TextStyle(color: AppColor.disabledColor),
                  )
                ],
              ),
              GestureDetector(
                onTap: () => mediasProvider.updateStatus(media.id, media.status.id),
                child: Row(
                  children: [
                    Text(
                      media.status.name
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      media.status.name == "Finit"
                        ? Icons.check_circle
                        : Icons.radio_button_checked,
                      color: media.status.name == "Pas commencé"
                        ? AppColor.errorColor
                        : AppColor.accentColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
