import 'package:bot_toast/bot_toast.dart';
import 'package:gword/app/core/helpers/notification_manager.dart';
import 'package:gword/app/core/widgets/notifications/notification_widget.dart';
import 'package:gword/app/core/widgets/notifications/toast_widget.dart';

class BotToastNotificationManager extends INotificationManager {
  @override
  void showErrorNotification(String message) {
    BotToast.showCustomNotification(
      toastBuilder: (cancelFunc) {
        return NotificationWidget(message: message, success: false);
      },
    );
  }

  @override
  void showSuccessNotification(String message) {
    BotToast.showCustomNotification(
      toastBuilder: (cancelFunc) {
        return NotificationWidget(message: message, success: true);
      },
    );
  }

  @override
  void showToast(String message) {
    BotToast.showCustomText(
      toastBuilder: (cancelFunc) {
        return ToastWidget(text: message);
      },
    );
  }
}
