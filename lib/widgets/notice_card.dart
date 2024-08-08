import 'package:flutter/material.dart';

class NoticeCard extends StatelessWidget {

  const NoticeCard({
    super.key, 
    required this.title, 
    required this.description, 
    required this.image, 
    required this.time, 
    required this.onTap
  });

  final String title;
  final String description;
  final String image;
  final String time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    Text titleText(){
      return Text(
        title,
        softWrap: true,
        maxLines: 2,
        style: const TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
      );
    }

    Text descriptionText(){
      return Text(
        description,
        softWrap: true,
        maxLines: 3,
        style: const TextStyle(
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    Row containerTimeNotice(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.add_circle_outline),
              Text(
                time,
              ),
            ],
          ),
          const Icon(Icons.play_arrow),
        ],
      );
    }

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(image),
            const SizedBox(width: 8,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  titleText(),

                  descriptionText(),
                  
                  containerTimeNotice(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}