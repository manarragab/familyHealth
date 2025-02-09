import 'package:abg/data/const/export.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class Pushercontroller extends MainGetxController {
  PusherModel pusherModel = PusherModel();
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  void pusherInit(String id) async {
    try {
      await pusher.init(
          apiKey: pusherModel.key,
          cluster: pusherModel.cluster,
          enableStats: true,
          useTLS: true,
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
          onAuthorizer: onAuthorizer);
      await startConnect(id);
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

  /* dynamic onAuthorizer(
      String channelName, String socketId, dynamic options, String id) {
    return {
      {
        "auth": pusherModel.key, // token
        "shared_secret": pusherModel.secret,
        "channel_data": "private-group.$id" // user-info
      }
    };
  }*/

  dynamic onAuthorizer(
      String channelName, String socketId, dynamic options) async {
    return {};
    //  String token = Shared.getstring("token")!;
    /*var authUrl = "http://192.168.1.102:8000//broadcasting/auth";
    var result = await Dio().post(
      Uri.parse(authUrl),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${token}',
      },
      body: 'socket_id=$socketId&channel_name=$channelName',
    );
    var json = jsonDecode(result.body);
    return json;*/
  }

  void onTriggerEventPressed(String id, String eventName) async {
    pusher.trigger(PusherEvent(
      channelName: pusherModel.groupChannel(id),
      eventName: eventName,
    ));
  }

  dynamic startConnect(String id) async {
    await pusher.subscribe(channelName: pusherModel.groupChannel(id));
    return await pusher.connect();
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
  String groupChannel(String id) => "private-group.$id";

  String privateChannel(String id) => "private-private_chat.$id";

  final String id = "1931559";
  final String key = "d3aed3ecfd129c54f4e7";
  final String secret = "56d8e768b275dd36bb67";
  final String cluster = "eu";
}
