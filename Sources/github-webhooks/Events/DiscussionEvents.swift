import Foundation

// MARK: - Discussion Event

public enum DiscussionAction: String, Codable, Sendable, Hashable {
    case answered
    case categoryChanged = "category_changed"
    case closed
    case created
    case deleted
    case edited
    case labeled
    case locked
    case pinned
    case reopened
    case transferred
    case unanswered
    case unlabeled
    case unlocked
    case unpinned
}

public struct GitHubDiscussionCategory: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let repositoryId: Int?
    public let emoji: String
    public let name: String
    public let description: String?
    public let createdAt: String?
    public let updatedAt: String?
    public let slug: String?
    public let isAnswerable: Bool?
}

public struct GitHubDiscussion: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let htmlUrl: String?
    public let category: GitHubDiscussionCategory?
    public let answerHtmlUrl: String?
    public let answerChosenAt: String?
    public let answerChosenBy: GitHubUser?
    public let repositoryUrl: String?
    public let number: Int
    public let title: String
    public let user: GitHubUser?
    public let state: String?
    public let stateReason: String?
    public let locked: Bool?
    public let comments: Int?
    public let body: String?
    public let createdAt: String?
    public let updatedAt: String?
    public let authorAssociation: String?
    public let activeLockReason: String?
    public let labels: [GitHubLabel]?
    public let reactions: GitHubReactions?
    public let timelineUrl: String?
}

public struct GitHubDiscussionCategoryChange: Codable, Sendable, Hashable {
    public let from: GitHubDiscussionCategory?
}

public struct GitHubDiscussionChanges: Codable, Sendable, Hashable {
    /// Present on the `edited` action when the title was changed.
    public let title: GitHubChangedValue?
    /// Present on the `edited` action when the body was changed.
    public let body: GitHubChangedValue?
    /// Present on the `category_changed` action.
    public let category: GitHubDiscussionCategoryChange?
    /// Present on the `transferred` action.
    public let newDiscussion: GitHubDiscussion?
    /// Present on the `transferred` action.
    public let newRepository: GitHubRepository?
}

public struct DiscussionEvent: Codable, Sendable {
    public let action: DiscussionAction
    public let discussion: GitHubDiscussion
    public let changes: GitHubDiscussionChanges?
    public let answer: GitHubDiscussionComment?
    /// Present on the `unanswered` action.
    public let oldAnswer: GitHubDiscussionComment?
    public let label: GitHubLabel?
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Discussion Comment Event

public enum DiscussionCommentAction: String, Codable, Sendable, Hashable {
    case created
    case deleted
    case edited
}

public struct GitHubDiscussionComment: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let htmlUrl: String?
    public let parentId: Int?
    public let childCommentCount: Int?
    public let repositoryUrl: String?
    public let discussionId: Int?
    public let authorAssociation: String?
    public let user: GitHubUser?
    public let createdAt: String?
    public let updatedAt: String?
    public let body: String?
    public let reactions: GitHubReactions?
}

public struct GitHubDiscussionCommentChanges: Codable, Sendable, Hashable {
    public let body: GitHubChangedValue?
}

public struct DiscussionCommentEvent: Codable, Sendable {
    public let action: DiscussionCommentAction
    public let comment: GitHubDiscussionComment
    public let discussion: GitHubDiscussion
    public let changes: GitHubDiscussionCommentChanges?
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}
