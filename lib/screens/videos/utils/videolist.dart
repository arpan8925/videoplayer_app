import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:videoplayer_app/helper/constant/color/color.dart';
import 'package:videoplayer_app/helper/constant/widget/text.dart';

Widget videolist(_media, myList, size) {
  return ListView.builder(
      itemCount: _media!.length,
      itemBuilder: (context, index) {
        final duration = Duration(milliseconds: _media[index].duration);
        //print(duration.toString().split("."));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              tileColor: secendaryColor,
              title: sText(
                  myList[index] != null
                      ? myList[index].split('/').last
                      : 'Loading',
                  whitColor,
                  17.0,
                  FontWeight.w500),
              subtitle: sText(
                  _media![index].width.toString() +
                      "x" +
                      _media![index].height.toString(),
                  subTitleColor,
                  12.0,
                  FontWeight.normal),
              trailing: GestureDetector(
                onTap: () {},
                child: Container(
                    height: 25.0,
                    width: 25.0,
                    child: Icon(
                      Icons.more_vert,
                      color: subTitleColor,
                    )),
              ),
              leading: Container(
                width: 100.0,
                child: Stack(
                  children: [
                    Container(
                      width: 100.0,
                      color: Colors.grey[300],
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: MemoryImage(kTransparentImage),
                        image: ThumbnailProvider(
                          mediumId: _media![index].id,
                          mediumType: _media![index].mediumType,
                          highQuality: true,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.play_arrow, color: whitColor),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 39.0,
                        height: 18.0,
                        alignment: Alignment.center,
                        child: sText(duration.toString().split(".").first,
                            whitColor, 10.0, FontWeight.normal),
                        decoration:
                            BoxDecoration(color: blackColor.withOpacity(0.5)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 30.0),
              width: size.width * 0.55,
              child: Divider(
                thickness: 0.5,
                color: subTitleColor,
              ),
            )
          ],
        );
      });
}
