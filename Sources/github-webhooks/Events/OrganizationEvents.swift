import Foundation

// MARK: - Organization Event

public enum OrganizationAction: String, Codable, Sendable, Hashable {
    case deleted
    case memberAdded = "member_added"
    case memberInvited = "member_invited"
    case memberRemoved = "member_removed"
    case renamed
}

public struct GitHubOrganizationInvitation: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let login: String?
    public let email: String?
    public let role: String?
    public let createdAt: String?
    public let failedAt: String?
    public let failedReason: String?
    public let teamCount: Int?
    public let inviterUrl: String?
    public let invitationsUrl: String?
    public let inviter: GitHubUser?
}

public struct OrganizationEvent: Codable, Sendable {
    public let action: OrganizationAction
    public let invitation: GitHubOrganizationInvitation?
    public let membership: GitHubMembership?
    public let organization: GitHubOrganization?
    public let sender: GitHubUser
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Member Event

public enum MemberAction: String, Codable, Sendable, Hashable {
    case added
    case edited
    case removed
}

public struct GitHubMemberChanges: Codable, Sendable, Hashable {
    public let oldPermission: GitHubChangedValue?
    public let permission: GitHubMemberPermissionChange?
    public let roleName: GitHubChangedValue?
}

public struct GitHubMemberPermissionChange: Codable, Sendable, Hashable {
    public let from: String?
    public let to: String?
}

public struct MemberEvent: Codable, Sendable {
    public let action: MemberAction
    public let member: GitHubUser?
    public let changes: GitHubMemberChanges?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Membership Event

public enum MembershipAction: String, Codable, Sendable, Hashable {
    case added
    case removed
}

public struct MembershipEvent: Codable, Sendable {
    public let action: MembershipAction
    public let scope: String
    public let member: GitHubUser?
    public let team: GitHubTeam
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Team Event

public enum TeamAction: String, Codable, Sendable, Hashable {
    case addedToRepository = "added_to_repository"
    case created
    case deleted
    case edited
    case removedFromRepository = "removed_from_repository"
}

public struct GitHubTeamChanges: Codable, Sendable, Hashable {
    public let description: GitHubChangedValue?
    public let name: GitHubChangedValue?
    public let privacy: GitHubChangedValue?
    public let notificationSetting: GitHubChangedValue?
    public let repository: GitHubTeamRepositoryChanges?
}

public struct GitHubTeamRepositoryChanges: Codable, Sendable, Hashable {
    public let permissions: GitHubTeamPermissionsChange?
}

public struct GitHubTeamPermissionsChange: Codable, Sendable, Hashable {
    public let from: GitHubTeamPermissions?
}

public struct GitHubTeamPermissions: Codable, Sendable, Hashable {
    public let admin: Bool?
    public let maintain: Bool?
    public let push: Bool?
    public let triage: Bool?
    public let pull: Bool?
}

public struct TeamEvent: Codable, Sendable {
    public let action: TeamAction
    public let team: GitHubTeam
    public let changes: GitHubTeamChanges?
    public let repository: GitHubRepository?
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Team Add Event

/// Triggered when a repository is added to a team.
public struct TeamAddEvent: Codable, Sendable {
    public let team: GitHubTeam
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Org Block Event

public enum OrgBlockAction: String, Codable, Sendable, Hashable {
    case blocked
    case unblocked
}

public struct OrgBlockEvent: Codable, Sendable {
    public let action: OrgBlockAction
    public let blockedUser: GitHubUser
    public let organization: GitHubOrganization?
    public let sender: GitHubUser
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}
