import 'package:abg/data/models/social/social_model.dart';
import 'package:abg/res/configuration/print_types.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

enum SocialType { google, facebook, apple }

class AuthenticateMethods {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<SocialModel?> signWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      await googleSignInAccount!.authentication;
      sPrint.info('accessToken::: ${googleSignInAccount.displayName}');
      sPrint.info('accessToken::: ${googleSignInAccount.email}');
      sPrint.info('accessToken::: ${googleSignInAccount.id}');
      sPrint.info('accessToken::: ${googleSignInAccount.photoUrl}');
      return SocialModel(
          name: googleSignInAccount.displayName.toString(),
          socialType: SocialType.google,
          email: googleSignInAccount.email,
          uid: googleSignInAccount.id,
          image: googleSignInAccount.photoUrl);
    } on PlatformException catch (error, s) {
      sPrint.error(error.toString(), s);
    } on Exception catch (error, s) {
      sPrint.error(error.toString(), s);
    }
    return null;
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
  }

  Future<void> signOutFromFacebook() async {
    await FacebookAuth.instance.logOut();
  }

  Future<SocialModel?> signInWithFacebook() async {
    // Trigger the sign-in flow
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login(
        permissions: [
          'public_profile',
          'email',
        ],
      );
      // Create a credential from the access token
      //final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);
      if (loginResult.accessToken is ClassicToken) {
        print(
            'facebook auth credential accessToken:: ${(loginResult.accessToken as ClassicToken).tokenString}');
        print(
            'facebook auth credential tokenID:: ${(loginResult.accessToken as ClassicToken).userId}');
      } else {
        print(
            'facebook auth credential accessToken:: ${(loginResult.accessToken as LimitedToken).tokenString}');
        print(
            'facebook auth credential tokenID:: ${(loginResult.accessToken as LimitedToken).userId}');
      }
      final userData =
          await FacebookAuth.instance.getUserData(fields: "id,name,email");
      // Once signed in, return the UserCredential
      /*   FacebookResponseModel facebookResponseEntity = await sl<AuthCases>()
          .facebookApi(loginResult.accessToken!.tokenString,
              loginResult.accessToken!.type.name);*/
      //await _auth.signInWithCredential(facebookAuthCredential);
      sPrint.warning("userData:: $userData");
      return SocialModel(
          name: userData['name'],
          socialType: SocialType.facebook,
          email: userData['email'],
          uid: userData['id'],
          image: "");
    } on Exception catch (e, s) {
      sPrint.error(e.toString(), s);
    } catch (e, s) {
      sPrint.error(e.toString(), s);
    }
  }

  Future<SocialModel?> singInWithApple() async {
    try {
      final AuthorizationCredentialAppleID appleResult =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      sPrint.info(appleResult.givenName.toString());
      sPrint.info(appleResult.familyName.toString());
      sPrint.info(appleResult.email.toString());
      sPrint.info(appleResult.identityToken.toString());

      return SocialModel(
          name: '${appleResult.givenName} ${appleResult.familyName}',
          socialType: SocialType.apple,
          email: appleResult.email ?? "",
          uid: appleResult.userIdentifier.toString(),
          image: null);
    } catch (error, s) {
      sPrint.error(error.toString(), s);
      return null;
    }
  }
}
