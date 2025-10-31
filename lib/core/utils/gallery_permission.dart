import 'package:permission_handler/permission_handler.dart';

getPermission(PermissionStatus status) async {
  if (status.isGranted) {
    print("✅ Gallery permission granted!");
    // Proceed to open gallery or use image picker
  } else if (status.isDenied) {
    print("❌ Gallery permission denied.");
  } else if (status.isPermanentlyDenied) {
    print("❌ Permission permanently denied. Opening app settings...");
    await openAppSettings();
  }
}
