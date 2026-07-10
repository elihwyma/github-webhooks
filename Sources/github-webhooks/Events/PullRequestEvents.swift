import Foundation

// MARK: - Pull Request Event

public enum PullRequestAction: String, Codable, Sendable, Hashable {
    case assigned
    case autoMergeDisabled = "auto_merge_disabled"
    case autoMergeEnabled = "auto_merge_enabled"
    case closed
    case convertedToDraft = "converted_to_draft"
    case demilestoned
    case dequeued
    case edited
    case enqueued
    case labeled
    case locked
    case milestoned
    case opened
    case readyForReview = "ready_for_review"
    case reopened
    case reviewRequestRemoved = "review_request_removed"
    case reviewRequested = "review_requested"
    case synchronize
    case unassigned
    case unlabeled
    case unlocked
}

public struct GitHubPullRequestChanges: Codable, Sendable, Hashable {
    public let title: GitHubChangedValue?
    public let body: GitHubChangedValue?
    public let base: GitHubChangedBase?
    public let reviewers: GitHubChangedReviewers?
}

public struct GitHubChangedValue: Codable, Sendable, Hashable {
    public let from: String?
}

public struct GitHubChangedBase: Codable, Sendable, Hashable {
    public let ref: GitHubChangedValue?
    public let sha: GitHubChangedValue?
}

public struct GitHubChangedReviewers: Codable, Sendable, Hashable {
    public let users: GitHubChangedReviewerUsers?
    public let teams: GitHubChangedReviewerTeams?
}

public struct GitHubChangedReviewerUsers: Codable, Sendable, Hashable {
    public let added: [GitHubUser]?
    public let removed: [GitHubUser]?
}

public struct GitHubChangedReviewerTeams: Codable, Sendable, Hashable {
    public let added: [GitHubTeam]?
    public let removed: [GitHubTeam]?
}

public struct PullRequestEvent: Codable, Sendable {
    public let action: PullRequestAction
    public let number: Int
    public let pullRequest: GitHubPullRequest
    public let assignee: GitHubUser?
    public let label: GitHubLabel?
    public let requestedReviewer: GitHubUser?
    public let requestedTeam: GitHubTeam?
    public let changes: GitHubPullRequestChanges?
    public let beforeCommitOid: String?
    public let afterCommitOid: String?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Pull Request Review Event

public enum PullRequestReviewAction: String, Codable, Sendable, Hashable {
    case submitted
    case edited
    case dismissed
}

public struct PullRequestReviewEvent: Codable, Sendable {
    public let action: PullRequestReviewAction
    public let review: GitHubReview
    public let pullRequest: GitHubPullRequest
    public let changes: GitHubPullRequestReviewChanges?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

public struct GitHubPullRequestReviewChanges: Codable, Sendable, Hashable {
    public let body: GitHubChangedValue?
}

// MARK: - Pull Request Review Comment Event

public enum PullRequestReviewCommentAction: String, Codable, Sendable, Hashable {
    case created
    case edited
    case deleted
}

public struct PullRequestReviewCommentEvent: Codable, Sendable {
    public let action: PullRequestReviewCommentAction
    public let comment: GitHubComment
    public let pullRequest: GitHubPullRequest
    public let changes: GitHubPullRequestReviewCommentChanges?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

public struct GitHubPullRequestReviewCommentChanges: Codable, Sendable, Hashable {
    public let body: GitHubChangedValue?
}

// MARK: - Pull Request Review Thread Event

public enum PullRequestReviewThreadAction: String, Codable, Sendable, Hashable {
    case resolved
    case unresolved
}

public struct PullRequestReviewThreadEvent: Codable, Sendable {
    public let action: PullRequestReviewThreadAction
    public let pullRequest: GitHubPullRequest
    public let thread: GitHubReviewThread
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}
