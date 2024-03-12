import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'package:trelltech/arbory/services/auth_service.dart';
import 'package:trelltech/arbory/services/user_info_service.dart';
import 'package:trelltech/arbory/services/organization_service.dart';

// Mocking the http client
class MockClient extends Mock implements http.Client {}

void main() {
  group('Organizations', () {
    late Organizations organizations;
    late TokenMember mockTokenMember;
    late MockClient mockHttpClient;

    setUp(() {
      mockTokenMember = TokenMember(Auth());
      mockHttpClient = MockClient();
      organizations = Organizations(mockTokenMember);
    });

    test('createOrganization sends a valid request', () async {
      final expectedDisplayName = 'New Organization';
      final expectedDesc = 'Description for the new organization';
      final expectedName = 'new_organization';
      final expectedWebsite =
          Uri.parse('https://api.trello.com/1/organizations/');

      when(mockTokenMember.auth.apiToken).thenReturn('valid_api_token');
      when(mockTokenMember.member?.id).thenReturn('valid_member_id');

      final expectedUrl = Uri.parse(
          "https://api.trello.com/1/organizations?displayName=$expectedDisplayName&desc=$expectedDesc&name=$expectedName&website=$expectedWebsite");

      final expectedResponse =
          http.Response('{"id": "new_organization_id"}', 200);

      when(mockHttpClient.post(expectedUrl, headers: anyNamed('headers')))
          .thenAnswer((_) async => expectedResponse);

      // Act
      await organizations.createOrganization(
        expectedDisplayName,
        expectedDesc,
        expectedName,
        expectedWebsite,
      );

      // Assert
      verify(mockHttpClient.post(expectedUrl, headers: {
        'Authorization':
            'OAuth oauth_consumer_key="${Auth.apiKey}", oauth_token="valid_api_token"',
      }));
    });

    test('createOrganization updates organizations on success', () async {
      // Arrange
      final expectedDisplayName = 'New Organization';
      final expectedDesc = 'Description for the new organization';
      final expectedName = 'new_organization';
      final expectedWebsite = Uri.parse('https://example.com');

      when(mockTokenMember.auth.apiToken).thenReturn('valid_api_token');
      when(mockTokenMember.member?.id).thenReturn('valid_member_id');

      final expectedUrl = Uri.parse(
          "https://api.trello.com/1/organizations?displayName=$expectedDisplayName&desc=$expectedDesc&name=$expectedName&website=$expectedWebsite");

      final expectedResponse =
          http.Response('{"id": "new_organization_id"}', 200);

      when(mockHttpClient.post(expectedUrl, headers: anyNamed('headers')))
          .thenAnswer((_) async => expectedResponse);

      // Act
      await organizations.createOrganization(
        expectedDisplayName,
        expectedDesc,
        expectedName,
        expectedWebsite,
      );

      // Assert
      expect(organizations.organizations.length, 1);
      expect(organizations.organizationsById.containsKey('new_organization_id'),
          true);
    });
  });
}
