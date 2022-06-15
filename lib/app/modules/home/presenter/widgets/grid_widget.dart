import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gword/app/core/resources/color_manager.dart';
import 'package:gword/app/core/resources/styles_manager.dart';
import 'package:gword/app/modules/home/domain/entities/word_entity.dart';

class GridWidget extends StatelessWidget {
  final WordEntity currentTry;
  final List<WordEntity> gridValues;

  const GridWidget({Key? key, required this.gridValues, required this.currentTry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(gridValues.toString());

    int lastFilledIndex = -1;
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final boxSize = width * .12;
    final borderBoxSize = width * .01;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        6,
        (i1) => Padding(
          padding: i1 != 0 ? EdgeInsets.only(top: borderBoxSize) : EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (i2) {
                String currentLetter = '';

                if (gridValues.length > i1) {
                  lastFilledIndex = i1;
                  if (gridValues[i1].word.length > i2) {
                    currentLetter = gridValues[i1].word[i2];
                  }
                } else {
                  if (i1 == (lastFilledIndex + 1) && currentTry.word.length > i2) {
                    currentLetter = currentTry.word[i2];
                  }
                }

                return Container(
                  width: boxSize,
                  height: boxSize,
                  margin: i2 != 0 ? EdgeInsets.only(left: borderBoxSize) : EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: i1 > lastFilledIndex + 1 ? ColorManager.grey : ColorManager.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorManager.grey,
                      width: borderBoxSize,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          currentLetter.toUpperCase(),
                          style: getBoldStyle(color: ColorManager.grey),
                        ),
                      ),
                      if (i1 == (lastFilledIndex + 1) && i2 == currentTry.word.length)
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: -1,
                          child: Container(
                            color: ColorManager.grey,
                            height: borderBoxSize * 1.05,
                          ),
                        )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
