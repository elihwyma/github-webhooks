import Foundation

// MARK: - Deployment Event

/// Triggered when a deployment is created.
public struct DeploymentEvent: Codable, Sendable {
    public let action: String
    public let deployment: GitHubDeployment
    public let workflow: GitHubWorkflow?
    public let workflowRun: GitHubWorkflowRun?
    public let repository: GitHubRepository
    public let sender: GitHubUser
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
    public let repository: GitHubRepository
    public let sender: GitHubUser
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

public struct GitHubDeploymentReviewer: Codable, Sendable, Hashable {
    public let type: String
    public let reviewer: GitHubUser?
}

public struct DeploymentReviewEvent: Codable, Sendable {
    public let action: DeploymentReviewAction
    public let environment: String
    public let requester: GitHubUser?
    public let reviewers: [GitHubDeploymentReviewer]?
    public let workflowRun: GitHubWorkflowRun?
    public let repository: GitHubRepository
    public let organization: GitHubOrganization?
    public let sender: GitHubUser
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Deployment Protection Rule Event

public struct DeploymentProtectionRuleEvent: Codable, Sendable {
    public let action: String
    public let environment: String
    public let event: String
    public let deploymentCallbackUrl: String?
    public let deployment: GitHubDeployment?
    public let pullRequests: [GitHubPullRequest]?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}
