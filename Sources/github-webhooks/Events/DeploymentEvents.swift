import Foundation

// MARK: - Deployment Event

/// Triggered when a deployment is created.
public struct DeploymentEvent: Codable, Sendable {
    public let action: String
    public let deployment: GitHubDeployment
    public let workflow: GitHubWorkflow?
    public let workflowRun: GitHubWorkflowRun?
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Deployment Status Event

/// Triggered when a deployment status changes.
public struct DeploymentStatusEvent: Codable, Sendable {
    public let action: String
    public let deploymentStatus: GitHubDeploymentStatus
    public let deployment: GitHubDeployment
    public let checkRun: GitHubCheckRun?
    public let workflow: GitHubWorkflow?
    public let workflowRun: GitHubWorkflowRun?
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Deployment Review Event

public enum DeploymentReviewAction: String, Codable, Sendable, Hashable {
    case approved
    case rejected
    case requested
}

/// Either a user or a team. Reviewers on a deployment review may be of type
/// `User` or `Team`; a team object has no `login`, so this decodes a user
/// first and falls back to a team.
public enum GitHubUserOrTeam: Codable, Sendable, Hashable {
    case user(GitHubUser)
    case team(GitHubTeam)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let user = try? container.decode(GitHubUser.self) {
            self = .user(user)
        } else {
            self = .team(try container.decode(GitHubTeam.self))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .user(let user):
            try container.encode(user)
        case .team(let team):
            try container.encode(team)
        }
    }
}

public struct GitHubDeploymentReviewer: Codable, Sendable, Hashable {
    /// Either `User` or `Team`.
    public let type: String
    public let reviewer: GitHubUserOrTeam?
}

/// A workflow job run attached to a deployment review event.
public struct GitHubWorkflowJobRun: Codable, Sendable, Hashable {
    public let id: Int
    public let name: String?
    public let status: String
    public let conclusion: String?
    public let htmlUrl: String
    public let createdAt: String
    public let updatedAt: String
    public let environment: String
}

public struct DeploymentReviewEvent: Codable, Sendable {
    public let action: DeploymentReviewAction
    /// Present on `requested` events only.
    public let environment: String?
    /// The payload key is `requestor` (GitHub's spelling), not `requester`.
    /// Present on `requested` events only.
    public let requestor: GitHubUser?
    public let reviewers: [GitHubDeploymentReviewer]?
    public let since: String
    /// The user who approved or rejected the review. Present on `approved`
    /// and `rejected` events only.
    public let approver: GitHubUser?
    /// The comment left when approving or rejecting. Present on `approved`
    /// and `rejected` events only.
    public let comment: String?
    public let workflowJobRun: GitHubWorkflowJobRun?
    /// Present on `approved` and `rejected` events only.
    public let workflowJobRuns: [GitHubWorkflowJobRun]?
    public let workflowRun: GitHubWorkflowRun?
    public let repository: GitHubRepository?
    public let organization: GitHubOrganization?
    public let sender: GitHubUser?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Deployment Protection Rule Event

public struct DeploymentProtectionRuleEvent: Codable, Sendable {
    public let action: String
    public let environment: String?
    public let event: String?
    public let deploymentCallbackUrl: String?
    public let deployment: GitHubDeployment?
    public let pullRequests: [GitHubPullRequest]?
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}
