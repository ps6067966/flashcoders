enum Roles {
  admin,
  collaborator,
  client,
  teamMember,
  blogger,
}

extension RolesExtension on Roles {
  String get getName {
    switch (this) {
      case Roles.admin:
        return 'Admin';
      case Roles.collaborator:
        return 'Collaborator';
      case Roles.client:
        return 'Client';
      case Roles.teamMember:
        return 'Team Member';
      case Roles.blogger:
        return 'Blogger';
      default:
        return "";
    }
  }
}
