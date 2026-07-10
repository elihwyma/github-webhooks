import Foundation

// MARK: - Issues Event

public enum IssueAction: String, Codable, Sendable, Hashable {
    case assigned
    case closed
    case deleted
    case demilestoned
    case edited
    case labeled
    case locked
    case milestoned
    case opened
    case pinned
    case reopened
    case transferred
    case unassigned
    case unlabeled
    case unlocked
    case unpinned
}

public struct GitHubIssueChanges: Codable, Sendable, Hashable {
    public let title: GitHubChangedValue?
    public let body: GitHubChangedValue?
    public let oldIssue: GitHubIssue?
    public let oldRepository: GitHubRepository?
}

public struct IssuesEvent: Codable, Sendable {
    public let action: IssueAction
    public let issue: GitHubIssue
    public let assignee: GitHubUser?
    public let label: GitHubLabel?
    public let changes: GitHubIssueChanges?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Issue Comment Event

public enum IssueCommentAction: String, Codable, Sendable, Hashable {
    case created
    case deleted
    case edited
}

public struct GitHubIssueCommentChanges: Codable, Sendable, Hashable {
    public let body: GitHubChangedValue?
}

public struct IssueCommentEvent: Codable, Sendable {
    public let action: IssueCommentAction
    public let issue: GitHubIssue
    public let comment: GitHubComment
    public let changes: GitHubIssueCommentChanges?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}
