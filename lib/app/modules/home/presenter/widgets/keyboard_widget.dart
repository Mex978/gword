import 'package:flutter/material.dart';
import 'package:gword/app/core/resources/color_manager.dart';
import 'package:gword/app/core/resources/styles_manager.dart';

const String _kKeyboardBackspaceKey = 'backspace';
const String _kKeyboardEnterKey = 'ENTER';

const List<List<String>> _keyboardLetters = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', _kKeyboardBackspaceKey],
  ['Z', 'X', 'C', 'V', 'B', 'N', 'M', _kKeyboardEnterKey],
];

class KeyboardWidget extends StatelessWidget {
  final ValueChanged<String> onClickInLetter;
  final void Function()? onDeleteLetter;
  final void Function()? onSubmitWord;

  const KeyboardWidget({Key? key, required this.onClickInLetter, required this.onSubmitWord, this.onDeleteLetter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Column(
      children: _keyboardLetters
          .map(
            (letters) => Padding(
              padding: _keyboardLetters.indexOf(letters) != 0 ? EdgeInsets.only(top: width * .01) : EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: letters
                    .map(
                      (letter) => Padding(
                        padding: letters.indexOf(letter) != 0 ? EdgeInsets.only(left: width * .01) : EdgeInsets.zero,
                        child: Material(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(6),
                          color: ColorManager.grey,
                          child: InkWell(
                            onTap: () => getAction(letter),
                            child: SizedBox(
                              width: letter == _kKeyboardEnterKey ? width * .17 : width * .08,
                              height: width * .08,
                              child: Center(
                                child: letter == _kKeyboardBackspaceKey
                                    ? const Icon(
                                        Icons.backspace_outlined,
                                        color: ColorManager.white,
                                      )
                                    : Text(
                                        letter,
                                        style: getBoldStyle(color: ColorManager.white),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          )
          .toList(),
    );
  }

  void getAction(String letter) {
    if (letter == _kKeyboardBackspaceKey) {
      onDeleteLetter?.call();
    } else if (letter == _kKeyboardEnterKey) {
      onSubmitWord?.call();
    } else {
      onClickInLetter(letter);
    }
  }
}
