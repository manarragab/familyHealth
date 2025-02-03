import 'package:abg/data/const/export.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class Pushercontroller extends MainGetxController {
  PusherModel pusherModel = PusherModel();
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  void pusherInit() async {
    try {
      await pusher.init(
        apiKey: pusherModel.key,
        cluster: pusherModel.cluster,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        onSubscriptionCount: onSubscriptionCount,
        // authEndpoint: "<Your Authendpoint Url>",
        // onAuthorizer: onAuthorizer
      );
      await pusher.subscribe(channelName: "");
      await pusher.connect();
    } catch (e, s) {
      sPrint.error("ERROR: $e", s);
    }
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    sPrint.warning("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    sPrint.warning("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    sPrint.warning("onEvent: $event");
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    sPrint.success("onSubscriptionSucceeded: $channelName data: $data");
    final me = pusher.getChannel(channelName)?.me;
    sPrint.success("Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    sPrint.warning("onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    sPrint.warning("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    sPrint.warning("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    sPrint.warning("onMemberRemoved: $channelName user: $member");
  }

  void onSubscriptionCount(String channelName, int subscriptionCount) {
    sPrint.warning(
        "onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount");
  }

  dynamic onAuthorizer(String channelName, String socketId, dynamic options) {
    return {
      "auth": "foo:bar",
      "channel_data": '{"user_id": 1}',
      "shared_secret": "foobar"
    };
  }

  void onTriggerEventPressed() async {
    pusher.trigger(PusherEvent(
      channelName: "",
      eventName: "",
    ));
  }
}

class PusherModel {
  /// pusher
  /*PUSHER_APP_ID="1931559"
PUSHER_APP_KEY="d3aed3ecfd129c54f4e7"
PUSHER_APP_SECRET="56d8e768b275dd36bb67"
PUSHER_APP_CLUSTER="eu"

Channel names :
private-group.{id}
private-private_chat.{id}

*/
  String groupChannel(num id) => "private-group.$id";
  String privateChannel(num id) => "private-private_chat.$id";

  final String id = "1931559";
  final String key = "d3aed3ecfd129c54f4e7";
  final String secret = "56d8e768b275dd36bb67";
  final String cluster = "eu";
}
