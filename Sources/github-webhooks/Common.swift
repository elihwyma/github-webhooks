import Foundation

// MARK: - Timestamp

/// Handles both Unix epoch integers and ISO 8601 strings used by GitHub webhook payloads.
public struct GitHubTimestamp: Codable, Sendable, Hashable {
    public let date: Date

    public init(date: Date) {
        self.date = date
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let unix = try? container.decode(Int.self) {
            date = Date(timeIntervalSince1970: TimeInterval(unix))
        } else {
            let string = try container.decode(String.self)
            let iso = ISO8601DateFormatter()
            if let d = iso.date(from: string) {
                date = d
            } else {
                iso.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
                guard let d = iso.date(from: string) else {
                    throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot parse date: \(string)")
                }
                date = d
            }
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(ISO8601DateFormatter().string(from: date))
    }
}

// MARK: - User

public struct GitHubUser: Codable, Sendable, Hashable {
    public let login: String
    public let id: Int
    public let nodeId: String
    public let avatarUrl: String
    public let gravatarId: String?
    public let url: String
    public let htmlUrl: String
    public let followersUrl: String?
    public let followingUrl: String?
    public let gistsUrl: String?
    public let starredUrl: String?
    public let subscriptionsUrl: String?
    public let organizationsUrl: String?
    public let reposUrl: String?
    public let eventsUrl: String?
    public let receivedEventsUrl: String?
    public let type: String
    public let siteAdmin: Bool
    public let name: String?
    public let email: String?
}

// MARK: - License

public struct GitHubLicense: Codable, Sendable, Hashable {
    public let key: String
    public let name: String
    public let spdxId: String?
    public let url: String?
    public let nodeId: String?
}

// MARK: - Organization

public struct GitHubOrganization: Codable, Sendable, Hashable {
    public let login: String
    public let id: Int
    public let nodeId: String?
    public let url: String?
    public let reposUrl: String?
    public let eventsUrl: String?
    public let hooksUrl: String?
    public let issuesUrl: String?
    public let membersUrl: String?
    public let publicMembersUrl: String?
    public let avatarUrl: String?
    public let description: String?
}

// MARK: - Installation

/// Covers both the small reference `{id, node_id}` in event common fields
/// and the full installation object in the `installation` event.
public struct GitHubInstallation: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let appId: Int?
    public let appSlug: String?
    public let targetId: Int?
    public let targetType: String?
    public let account: GitHubUser?
    public let repositorySelection: String?
    public let accessTokensUrl: String?
    public let repositoriesUrl: String?
    public let htmlUrl: String?
    public let events: [String]?
    public let createdAt: GitHubTimestamp?
    public let updatedAt: GitHubTimestamp?
    public let singleFileName: String?
    public let suspendedBy: GitHubUser?
    public let suspendedAt: GitHubTimestamp?
}

// MARK: - Enterprise

public struct GitHubEnterprise: Codable, Sendable, Hashable {
    public let id: Int
    public let slug: String?
    public let name: String
    public let nodeId: String?
    public let avatarUrl: String?
    public let description: String?
    public let websiteUrl: String?
    public let htmlUrl: String?
    public let createdAt: GitHubTimestamp?
    public let updatedAt: GitHubTimestamp?
}

// MARK: - Repository

public struct GitHubRepository: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String
    public let name: String
    public let fullName: String
    public let owner: GitHubUser
    public let `private`: Bool
    public let htmlUrl: String
    public let description: String?
    public let fork: Bool
    public let url: String
    public let archiveUrl: String?
    public let assigneesUrl: String?
    public let blobsUrl: String?
    public let branchesUrl: String?
    public let collaboratorsUrl: String?
    public let commentsUrl: String?
    public let commitsUrl: String?
    public let compareUrl: String?
    public let contentsUrl: String?
    public let contributorsUrl: String?
    public let deploymentsUrl: String?
    public let downloadsUrl: String?
    public let eventsUrl: String?
    public let forksUrl: String?
    public let gitCommitsUrl: String?
    public let gitRefsUrl: String?
    public let gitTagsUrl: String?
    public let gitUrl: String?
    public let issueCommentUrl: String?
    public let issueEventsUrl: String?
    public let issuesUrl: String?
    public let keysUrl: String?
    public let labelsUrl: String?
    public let languagesUrl: String?
    public let mergesUrl: String?
    public let milestonesUrl: String?
    public let notificationsUrl: String?
    public let pullsUrl: String?
    public let releasesUrl: String?
    public let sshUrl: String?
    public let stargazersUrl: String?
    public let statusesUrl: String?
    public let subscribersUrl: String?
    public let subscriptionUrl: String?
    public let tagsUrl: String?
    public let teamsUrl: String?
    public let treesUrl: String?
    public let cloneUrl: String?
    public let mirrorUrl: String?
    public let hooksUrl: String?
    public let svnUrl: String?
    public let homepage: String?
    public let language: String?
    public let forksCount: Int?
    public let stargazersCount: Int?
    public let watchersCount: Int?
    public let size: Int?
    public let defaultBranch: String?
    public let openIssuesCount: Int?
    public let isTemplate: Bool?
    public let topics: [String]?
    public let hasIssues: Bool?
    public let hasProjects: Bool?
    public let hasWiki: Bool?
    public let hasPages: Bool?
    public let hasDownloads: Bool?
    public let hasDiscussions: Bool?
    public let archived: Bool?
    public let disabled: Bool?
    public let visibility: String?
    public let pushedAt: GitHubTimestamp?
    public let createdAt: GitHubTimestamp?
    public let updatedAt: GitHubTimestamp?
    public let allowRebaseMerge: Bool?
    public let allowSquashMerge: Bool?
    public let allowMergeCommit: Bool?
    public let allowForking: Bool?
    public let webCommitSignoffRequired: Bool?
    public let forks: Int?
    public let openIssues: Int?
    public let watchers: Int?
    public let stargazers: Int?
    public let masterBranch: String?
    public let license: GitHubLicense?
    public let organization: String?
}

// MARK: - Team

public struct GitHubTeam: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let name: String
    public let slug: String?
    public let description: String?
    public let privacy: String?
    public let notificationSetting: String?
    public let permission: String?
    public let url: String?
    public let htmlUrl: String?
    public let membersUrl: String?
    public let repositoriesUrl: String?
    public let parent: GitHubTeamParent?
}

public struct GitHubTeamParent: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let name: String
    public let slug: String?
    public let description: String?
    public let privacy: String?
    public let permission: String?
    public let htmlUrl: String?
    public let url: String?
    public let membersUrl: String?
    public let repositoriesUrl: String?
}

// MARK: - Label

public struct GitHubLabel: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let url: String?
    public let name: String
    public let description: String?
    public let color: String
    public let `default`: Bool
}

// MARK: - Milestone

public struct GitHubMilestone: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let number: Int
    public let title: String
    public let description: String?
    public let creator: GitHubUser?
    public let openIssues: Int
    public let closedIssues: Int
    public let state: String
    public let createdAt: String
    public let updatedAt: String?
    public let dueOn: String?
    public let closedAt: String?
    public let htmlUrl: String?
    public let url: String?
    public let labelsUrl: String?
}

// MARK: - Reactions

public struct GitHubReactions: Codable, Sendable, Hashable {
    public let url: String?
    public let totalCount: Int?
    public let plusOne: Int?
    public let minusOne: Int?
    public let laugh: Int?
    public let hooray: Int?
    public let confused: Int?
    public let heart: Int?
    public let rocket: Int?
    public let eyes: Int?

    // `+1` and `-1` are not valid Swift identifiers; explicit CodingKeys required.
    // With convertFromSnakeCase, raw values here must be the post-conversion form
    // (camelCase) for underscored fields, or the literal JSON key for others.
    enum CodingKeys: String, CodingKey {
        case url, hooray, confused, heart, rocket, eyes, laugh
        case totalCount
        case plusOne = "+1"
        case minusOne = "-1"
    }
}

// MARK: - App

public struct GitHubApp: Codable, Sendable, Hashable {
    public let id: Int
    public let slug: String?
    public let nodeId: String?
    public let owner: GitHubUser?
    public let name: String
    public let description: String?
    public let externalUrl: String?
    public let htmlUrl: String?
    public let createdAt: String?
    public let updatedAt: String?
}

// MARK: - Issue

public struct GitHubIssuePullRequestRef: Codable, Sendable, Hashable {
    public let url: String?
    public let htmlUrl: String?
    public let diffUrl: String?
    public let patchUrl: String?
    public let mergedAt: String?
}

public struct GitHubSubIssuesSummary: Codable, Sendable, Hashable {
    public let total: Int
    public let completed: Int
    public let percentCompleted: Int
}

public struct GitHubIssue: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String
    public let number: Int
    public let title: String
    public let body: String?
    public let bodyHtml: String?
    public let bodyText: String?
    public let user: GitHubUser?
    public let labels: [GitHubLabel]
    public let state: String
    public let stateName: String?
    public let locked: Bool
    public let assignee: GitHubUser?
    public let assignees: [GitHubUser]
    public let milestone: GitHubMilestone?
    public let comments: Int
    public let createdAt: String
    public let updatedAt: String?
    public let closedAt: String?
    public let closedBy: GitHubUser?
    public let htmlUrl: String
    public let url: String
    public let repositoryUrl: String?
    public let labelsUrl: String?
    public let commentsUrl: String?
    public let eventsUrl: String?
    public let timelineUrl: String?
    public let pullRequest: GitHubIssuePullRequestRef?
    public let draft: Bool?
    public let reactions: GitHubReactions?
    public let activeLockReason: String?
    public let authorAssociation: String?
    public let performedViaGithubApp: GitHubApp?
    public let stateReason: String?
    public let subIssuesSummary: GitHubSubIssuesSummary?
}

// MARK: - Pull Request

public struct GitHubPullRequestBranch: Codable, Sendable, Hashable {
    public let label: String?
    public let ref: String
    public let sha: String
    public let user: GitHubUser?
    public let repo: GitHubRepository?
}

public struct GitHubAutoMerge: Codable, Sendable, Hashable {
    public let enabledBy: GitHubUser?
    public let mergeMethod: String
    public let commitTitle: String
    public let commitMessage: String
}

public struct GitHubPullRequest: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let number: Int
    public let url: String
    public let htmlUrl: String?
    public let diffUrl: String?
    public let patchUrl: String?
    public let issueUrl: String?
    public let state: String?
    public let locked: Bool?
    public let title: String?
    public let user: GitHubUser?
    public let body: String?
    public let labels: [GitHubLabel]?
    public let milestone: GitHubMilestone?
    public let assignee: GitHubUser?
    public let assignees: [GitHubUser]?
    public let requestedReviewers: [GitHubUser]?
    public let requestedTeams: [GitHubTeam]?
    public let draft: Bool?
    public let head: GitHubPullRequestBranch
    public let base: GitHubPullRequestBranch
    public let createdAt: String?
    public let updatedAt: String?
    public let closedAt: String?
    public let mergedAt: String?
    public let mergeCommitSha: String?
    public let merged: Bool?
    public let mergeable: Bool?
    public let mergeableState: String?
    public let mergedBy: GitHubUser?
    public let comments: Int?
    public let reviewComments: Int?
    public let maintainerCanModify: Bool?
    public let commits: Int?
    public let additions: Int?
    public let deletions: Int?
    public let changedFiles: Int?
    public let authorAssociation: String?
    public let activeLockReason: String?
    public let autoMerge: GitHubAutoMerge?
    public let rebaseable: Bool?
    public let commitsUrl: String?
    public let reviewCommentsUrl: String?
    public let reviewCommentUrl: String?
    public let commentsUrl: String?
    public let statusesUrl: String?
}

// MARK: - Commit (push format)

public struct GitHubCommitAuthor: Codable, Sendable, Hashable {
    public let name: String?
    public let email: String?
    public let username: String?
    public let login: String?
    public let date: String?
}

public struct GitHubPushCommit: Codable, Sendable, Hashable {
    public let id: String
    public let treeId: String?
    public let distinct: Bool
    public let message: String
    public let timestamp: String
    public let url: String
    public let author: GitHubCommitAuthor?
    public let committer: GitHubCommitAuthor?
    public let added: [String]
    public let removed: [String]
    public let modified: [String]
}

public struct GitHubSimpleCommit: Codable, Sendable, Hashable {
    public let id: String
    public let treeId: String?
    public let message: String
    public let timestamp: String
    public let author: GitHubCommitAuthor?
    public let committer: GitHubCommitAuthor?
}

// MARK: - Release

public struct GitHubReleaseAsset: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let url: String?
    public let browserDownloadUrl: String?
    public let name: String
    public let label: String?
    public let state: String?
    public let contentType: String?
    public let size: Int?
    public let downloadCount: Int?
    public let createdAt: String?
    public let updatedAt: String?
    public let uploader: GitHubUser?
}

public struct GitHubRelease: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let tagName: String
    public let targetCommitish: String?
    public let name: String?
    public let body: String?
    public let draft: Bool
    public let prerelease: Bool
    public let createdAt: String?
    public let publishedAt: String?
    public let url: String?
    public let assetsUrl: String?
    public let uploadUrl: String?
    public let htmlUrl: String?
    public let tarballUrl: String?
    public let zipballUrl: String?
    public let author: GitHubUser?
    public let assets: [GitHubReleaseAsset]
    public let discussionUrl: String?
}

// MARK: - Check Run / Suite

public struct GitHubCheckRunOutput: Codable, Sendable, Hashable {
    public let title: String?
    public let summary: String?
    public let text: String?
    public let annotationsCount: Int?
    public let annotationsUrl: String?
}

public struct GitHubCheckSuiteRef: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let headBranch: String?
    public let headSha: String?
    public let status: String?
    public let conclusion: String?
    public let url: String?
    public let before: String?
    public let after: String?
    public let app: GitHubApp?
}

public struct GitHubCheckRun: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let headSha: String
    public let externalId: String?
    public let url: String?
    public let htmlUrl: String?
    public let detailsUrl: String?
    public let status: String
    public let conclusion: String?
    public let startedAt: String?
    public let completedAt: String?
    public let output: GitHubCheckRunOutput?
    public let name: String
    public let checkSuite: GitHubCheckSuiteRef?
    public let app: GitHubApp?
    public let pullRequests: [GitHubPullRequest]?
    public let deployment: GitHubDeployment?
}

public struct GitHubCheckSuite: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let headBranch: String?
    public let headSha: String
    public let status: String?
    public let conclusion: String?
    public let url: String?
    public let before: String?
    public let after: String?
    public let app: GitHubApp?
    public let pullRequests: [GitHubPullRequest]?
    public let headCommit: GitHubSimpleCommit?
    public let latestCheckRunsCount: Int?
    public let checkRunsUrl: String?
    public let rerequestable: Bool?
    public let runsRerequestable: Bool?
}

// MARK: - Deployment

public struct GitHubDeployment: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let sha: String?
    public let ref: String?
    public let task: String?
    public let originalEnvironment: String?
    public let environment: String?
    public let description: String?
    public let creator: GitHubUser?
    public let createdAt: String?
    public let updatedAt: String?
    public let statusesUrl: String?
    public let repositoryUrl: String?
    public let url: String?
    public let performedViaGithubApp: GitHubApp?
    public let productionEnvironment: Bool?
    public let transientEnvironment: Bool?
}

public struct GitHubDeploymentStatus: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let state: String
    public let creator: GitHubUser?
    public let description: String?
    public let environment: String?
    public let targetUrl: String?
    public let createdAt: String?
    public let updatedAt: String?
    public let deploymentUrl: String?
    public let repositoryUrl: String?
    public let url: String?
    public let environmentUrl: String?
    public let logUrl: String?
    public let performedViaGithubApp: GitHubApp?
}

// MARK: - Workflow

public struct GitHubWorkflow: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let name: String
    public let path: String
    public let state: String?
    public let createdAt: String?
    public let updatedAt: String?
    public let url: String?
    public let htmlUrl: String?
    public let badgeUrl: String?
}

public struct GitHubReferencedWorkflow: Codable, Sendable, Hashable {
    public let path: String
    public let sha: String
    public let ref: String?
}

public struct GitHubWorkflowRun: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let name: String?
    public let headBranch: String?
    public let headSha: String
    public let path: String?
    public let displayTitle: String?
    public let runNumber: Int?
    public let runAttempt: Int?
    public let event: String
    public let status: String?
    public let conclusion: String?
    public let workflowId: Int?
    public let url: String?
    public let htmlUrl: String?
    public let pullRequests: [GitHubPullRequest]?
    public let createdAt: String?
    public let updatedAt: String?
    public let actor: GitHubUser?
    public let triggeringActor: GitHubUser?
    public let runStartedAt: String?
    public let jobsUrl: String?
    public let logsUrl: String?
    public let checkSuiteUrl: String?
    public let artifactsUrl: String?
    public let cancelUrl: String?
    public let rerunUrl: String?
    public let workflowUrl: String?
    public let referencedWorkflows: [GitHubReferencedWorkflow]?
    public let previousAttemptUrl: String?
    public let headCommit: GitHubSimpleCommit?
    public let repository: GitHubRepository?
    public let headRepository: GitHubRepository?
}

public struct GitHubWorkflowStep: Codable, Sendable, Hashable {
    public let name: String
    public let status: String
    public let conclusion: String?
    public let number: Int
    public let startedAt: String?
    public let completedAt: String?
}

public struct GitHubWorkflowJob: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let runId: Int?
    public let runUrl: String?
    public let runAttempt: Int?
    public let headSha: String
    public let url: String?
    public let htmlUrl: String?
    public let status: String
    public let conclusion: String?
    public let createdAt: String?
    public let startedAt: String?
    public let completedAt: String?
    public let name: String
    public let steps: [GitHubWorkflowStep]?
    public let checkRunUrl: String?
    public let labels: [String]?
    public let runnerId: Int?
    public let runnerName: String?
    public let runnerGroupId: Int?
    public let runnerGroupName: String?
    public let workflowName: String?
    public let headBranch: String?
}

// MARK: - Hook (ping event)

public struct GitHubHookConfig: Codable, Sendable, Hashable {
    public let contentType: String?
    public let insecureSsl: String?
    public let url: String?
    public let secret: String?
}

public struct GitHubHookResponse: Codable, Sendable, Hashable {
    public let code: Int?
    public let status: String?
    public let message: String?
}

public struct GitHubHook: Codable, Sendable, Hashable {
    public let id: Int
    public let type: String
    public let name: String
    public let active: Bool
    public let events: [String]
    public let config: GitHubHookConfig
    public let createdAt: String?
    public let updatedAt: String?
    public let url: String?
    public let testUrl: String?
    public let pingUrl: String?
    public let deliveriesUrl: String?
    public let lastResponse: GitHubHookResponse?
}

// MARK: - Review

public struct GitHubHrefLink: Codable, Sendable, Hashable {
    public let href: String
}

public struct GitHubReviewLinks: Codable, Sendable, Hashable {
    public let html: GitHubHrefLink?
    public let pullRequest: GitHubHrefLink?
}

public struct GitHubReview: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let user: GitHubUser?
    public let body: String?
    public let state: String
    public let htmlUrl: String?
    public let pullRequestUrl: String?
    public let commitId: String?
    public let submittedAt: String?
    public let authorAssociation: String?
}

// MARK: - Comment

/// General-purpose comment covering issue comments, PR review comments, and commit comments.
public struct GitHubComment: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let url: String?
    public let htmlUrl: String?
    public let body: String?
    public let user: GitHubUser?
    public let createdAt: String?
    public let updatedAt: String?
    public let authorAssociation: String?
    public let reactions: GitHubReactions?
    public let performedViaGithubApp: GitHubApp?
    // PR review comment fields
    public let pullRequestReviewId: Int?
    public let diffHunk: String?
    public let path: String?
    public let position: Int?
    public let originalPosition: Int?
    public let commitId: String?
    public let originalCommitId: String?
    public let inReplyToId: Int?
    public let pullRequestUrl: String?
    public let startLine: Int?
    public let originalStartLine: Int?
    public let startSide: String?
    public let line: Int?
    public let originalLine: Int?
    public let side: String?
    public let subjectType: String?
}

// MARK: - Membership

public struct GitHubMembership: Codable, Sendable, Hashable {
    public let url: String?
    public let state: String
    public let role: String
    public let organizationUrl: String?
    public let organization: GitHubOrganization?
    public let user: GitHubUser?
}

// MARK: - Review Thread

public struct GitHubReviewThread: Codable, Sendable, Hashable {
    public let nodeId: String?
    public let comments: [GitHubComment]?
    public let startLine: Int?
    public let originalStartLine: Int?
    public let startSide: String?
    public let line: Int?
    public let originalLine: Int?
    public let side: String?
    public let path: String?
    public let diffSide: String?
    public let resolved: Bool?
    public let resolvedBy: GitHubUser?
    public let isCollapsed: Bool?
}
