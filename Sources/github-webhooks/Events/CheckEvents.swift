import Foundation

// MARK: - Check Run Event

public enum CheckRunAction: String, Codable, Sendable, Hashable {
    case created
    case completed
    case rerequested
    case requestedAction = "requested_action"
}

/// The action requested by the user (only present for `requested_action` events).
public struct GitHubRequestedAction: Codable, Sendable, Hashable {
    public let identifier: String?
}

public struct CheckRunEvent: Codable, Sendable {
    public let action: CheckRunAction
    public let checkRun: GitHubCheckRun
    /// Present when `action` is `requested_action`.
    public let requestedAction: GitHubRequestedAction?
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Check Suite Event

public enum CheckSuiteAction: String, Codable, Sendable, Hashable {
    case completed
    case requested
    case rerequested
}

public struct CheckSuiteEvent: Codable, Sendable {
    public let action: CheckSuiteAction
    public let checkSuite: GitHubCheckSuite
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}
