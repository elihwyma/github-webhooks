import Foundation

// MARK: - Push Event

public struct PushEvent: Codable, Sendable {
    public let ref: String
    public let before: String
    public let after: String
    public let created: Bool
    public let deleted: Bool
    public let forced: Bool
    public let baseRef: String?
    public let compare: String
    public let commits: [GitHubPushCommit]
    public let headCommit: GitHubPushCommit?
    public let pusher: GitHubCommitAuthor
    public let repository: GitHubRepository
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Create Event

/// Triggered when a branch or tag is created.
public struct CreateEvent: Codable, Sendable {
    /// The git ref that was created. Not included when `refType` is `repository`.
    public let ref: String?
    /// The type of git ref object created: `branch` or `tag`.
    public let refType: String
    /// The name of the repository's default branch.
    public let masterBranch: String
    public let description: String?
    /// The type of actor that created the ref: `user` or `deploy_key`.
    public let pusherType: String
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Delete Event

/// Triggered when a branch or tag is deleted.
public struct DeleteEvent: Codable, Sendable {
    public let ref: String
    /// The type of git ref object deleted: `branch` or `tag`.
    public let refType: String
    /// The type of actor that deleted the ref: `user` or `deploy_key`.
    public let pusherType: String
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Commit Comment Event

public enum CommitCommentAction: String, Codable, Sendable, Hashable {
    case created
}

public struct CommitCommentEvent: Codable, Sendable {
    public let action: CommitCommentAction
    public let comment: GitHubComment
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Status Event

public struct GitHubStatusBranch: Codable, Sendable, Hashable {
    public let name: String
    public let commit: GitHubStatusBranchCommit?
    public let protected: Bool?
}

public struct GitHubStatusBranchCommit: Codable, Sendable, Hashable {
    public let sha: String?
    public let url: String?
}

public struct GitHubStatusCommit: Codable, Sendable, Hashable {
    public let sha: String?
    public let nodeId: String?
    public let commit: GitHubStatusCommitDetails?
    public let url: String?
    public let htmlUrl: String?
    public let commentsUrl: String?
    public let author: GitHubUser?
    public let committer: GitHubUser?
    public let parents: [GitHubStatusCommitParent]?
}

public struct GitHubStatusCommitDetails: Codable, Sendable, Hashable {
    public let author: GitHubCommitAuthor?
    public let committer: GitHubCommitAuthor?
    public let message: String?
    public let url: String?
    public let commentCount: Int?
}

public struct GitHubStatusCommitParent: Codable, Sendable, Hashable {
    public let sha: String?
    public let url: String?
    public let htmlUrl: String?
}

/// Triggered when the status of a Git commit changes.
public struct StatusEvent: Codable, Sendable {
    public let id: Int
    public let sha: String
    public let name: String
    public let targetUrl: String?
    public let context: String
    public let description: String?
    /// The new state: `pending`, `success`, `failure`, or `error`.
    public let state: String
    public let commit: GitHubStatusCommit?
    public let branches: [GitHubStatusBranch]
    public let createdAt: String
    public let updatedAt: String
    public let avatarUrl: String?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Gollum Event (Wiki)

public struct GitHubWikiPage: Codable, Sendable, Hashable {
    public let pageName: String
    public let title: String
    public let summary: String?
    /// The action that was performed on the page: `created` or `edited`.
    public let action: String
    public let sha: String
    public let htmlUrl: String
}

/// Triggered when a wiki page is created or updated.
public struct GollumEvent: Codable, Sendable {
    public let pages: [GitHubWikiPage]
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Public Event

/// Triggered when a private repository is made public.
public struct PublicEvent: Codable, Sendable {
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}
