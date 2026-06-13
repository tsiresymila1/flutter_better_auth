import 'package:flutter/material.dart';
import 'package:flutter_better_auth/flutter_better_auth.dart';

import '../harness/widgets.dart';

class OrganizationTab extends StatefulWidget {
  const OrganizationTab({super.key});
  @override
  State<OrganizationTab> createState() => _OrganizationTabState();
}

class _OrganizationTabState extends State<OrganizationTab> {
  final _console = ConsoleController();
  final _name = TextEditingController(text: 'Acme');
  final _slug = TextEditingController(text: 'acme');
  final _orgId = TextEditingController();
  final _inviteEmail = TextEditingController(text: 'member@mail.com');
  final _role = TextEditingController(text: 'member');

  BetterAuthClient get c => FlutterBetterAuth.client;

  @override
  void dispose() {
    _console.dispose();
    for (final ctl in [_name, _slug, _orgId, _inviteEmail, _role]) {
      ctl.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HarnessTab(
      console: _console,
      children: [
        Field('name', _name),
        Field('slug', _slug),
        Field('organizationId', _orgId),
        const SectionLabel('Organizations'),
        Act(
          'Check slug',
          () => runAction(
            _console,
            'organization.checkSlug',
            () => c.organization.checkSlug(slug: _slug.text),
          ),
        ),
        Act(
          'Create organization',
          () => runAction(
            _console,
            'organization.create',
            () => c.organization.create(name: _name.text, slug: _slug.text),
          ),
        ),
        Act(
          'List organizations',
          () => runAction(
            _console,
            'organization.listOrganizations',
            () => c.organization.listOrganizations(),
          ),
        ),
        Act(
          'Get full organization',
          () => runAction(
            _console,
            'organization.getFullOrganization',
            () => c.organization.getFullOrganization(
              organizationId: _orgId.text.isEmpty ? null : _orgId.text,
            ),
          ),
        ),
        Act(
          'Leave organization',
          () => runAction(
            _console,
            'organization.leave',
            () => c.organization.leave(organizationId: _orgId.text),
          ),
        ),
        const SectionLabel('Members'),
        Act(
          'List members',
          () => runAction(
            _console,
            'organization.listMembers',
            () => c.organization.listMembers(limit: 20),
          ),
        ),
        Field('invite email', _inviteEmail),
        Field('role', _role),
        Act(
          'Invite member',
          () => runAction(
            _console,
            'organization.inviteMember',
            () => c.organization.inviteMember(
              email: _inviteEmail.text,
              role: _role.text,
              organizationId: _orgId.text.isEmpty ? null : _orgId.text,
            ),
          ),
        ),
      ],
    );
  }
}
