import Foundation

// MARK: - Workflow Run Event

public enum WorkflowRunAction: String, Codable, Sendable, Hashable {
    case completed
    case inProgress = "in_progress"
    case requested
}

public struct WorkflowRunEvent: Codable, Sendable {
    public let action: WorkflowRunAction
    public let workflowRun: GitHubWorkflowRun
    public let workflow: GitHubWorkflow?
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Workflow Job Event

public enum WorkflowJobAction: String, Codable, Sendable, Hashable {
    case queued
    case inProgress = "in_progress"
    case completed
    case waiting
}

public struct WorkflowJobEvent: Codable, Sendable {
    public let action: WorkflowJobAction
    public let workflowJob: GitHubWorkflowJob
    public let deployment: GitHubDeployment?
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Workflow Dispatch Event

public struct WorkflowDispatchEvent: Codable, Sendable {
    public let workflow: String
    public let ref: String
    /// The user-supplied inputs for the workflow dispatch trigger (JSON object as dictionary).
    public let inputs: [String: GitHubJSONValue]?
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}
