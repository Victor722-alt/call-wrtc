import 'package:flutter/services.dart';
import 'package:callkit_call_keep/callkit_call_keep.dart';

class CallKitService {
  final CallKitCallKeep _callKit;

  CallKitService() : _callKit = CallKitCallKeep();

  void setupCallKit() async {
    await _callKit.setup("Your app name");
    // Add additional configurations if needed
  }

  void displayIncomingCall(String callId, String callerName) async {
    await _callKit.startCall(callId, callerName, callerName, 'some_callback_url');
  }

  void endCall(String callId) async {
    await _callKit.endCall(callId);
  }

  // Additional methods for handling calls can be added here
}