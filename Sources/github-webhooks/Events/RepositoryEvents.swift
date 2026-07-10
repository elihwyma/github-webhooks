import Foundation

// MARK: - Repository Event

public enum RepositoryAction: String, Codable, Sendable, Hashable {
    case archived
    case created
    case deleted
    case edited
    case privatized
    case publicized
    case renamed
    case transferred
    case unarchived
}

public struct RepositoryEvent: Codable, Sendable {
    public let action: RepositoryAction
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Fork Event

public struct ForkEvent: Codable, Sendable {
    /// The created repository (the fork).
    public let forkee: GitHubRepository
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Release Event

public enum ReleaseAction: String, Codable, Sendable, Hashable {
    case created
    case deleted
    case edited
    case prereleased
    case published
    case released
    case unpublished
}

public struct ReleaseEvent: Codable, Sendable {
    public let action: ReleaseAction
    public let release: GitHubRelease
    public let changes: GitHubReleaseChanges?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

public struct GitHubReleaseChanges: Codable, Sendable, Hashable {
    public let body: GitHubChangedValue?
    public let name: GitHubChangedValue?
    public let makLatest: GitHubChangedValue?
}

// MARK: - Branch Protection Rule Event

public enum BranchProtectionRuleAction: String, Codable, Sendable, Hashable {
    case created
    case deleted
    case edited
}

public struct GitHubBranchProtectionRule: Codable, Sendable, Hashable {
    public let id: Int
    public let repositoryId: Int?
    public let name: String
    public let createdAt: String?
    public let updatedAt: String?
    public let pullRequestReviewsEnforcementLevel: String?
    public let requiredApprovingReviewCount: Int?
    public let dismissStaleReviewsOnPush: Bool?
    public let requireCodeOwnerReview: Bool?
    public let authorizedDismissalActorsOnly: Bool?
    public let ignoreApprovalsFromContributors: Bool?
    public let requireLastPushApproval: Bool?
    public let requiredStatusChecks: [String]?
    public let requiredDeploymentEnvironments: [String]?
    public let requiredConversationResolution: Bool?
    public let requireSignedCommits: Bool?
    public let enforceAdmins: Bool?
    public let linearHistoryRequirement: String?
    public let deleteBranchOnMerge: Bool?
    public let lockAllowsFetchAndMerge: Bool?
    public let allowForcePushes: String?
    public let allowDeletions: Bool?
    public let mergeQueueEnforcementLevel: String?
    public let requiredMergeQueue: Bool?
    public let lockBranch: String?
    public let bypassForcePushAllowancesUrl: String?
    public let bypassPullRequestAllowancesUrl: String?
    public let url: String?
}

public struct GitHubBranchProtectionRuleChanges: Codable, Sendable, Hashable {
    public let authorizedDismissalActorsOnly: GitHubChangedBoolValue?
    public let authorizedActorsOnly: GitHubChangedBoolValue?
    public let dismissStaleReviewsOnPush: GitHubChangedBoolValue?
    public let pullRequestReviewsEnforcementLevel: GitHubChangedValue?
    public let requiredStatusChecks: GitHubChangedStringArrayValue?
    public let requiredConversationResolutionLevel: GitHubChangedValue?
    public let requiredDeployments: GitHubChangedStringArrayValue?
}

public struct GitHubChangedBoolValue: Codable, Sendable, Hashable {
    public let from: Bool?
}

public struct GitHubChangedStringArrayValue: Codable, Sendable, Hashable {
    public let from: [String]?
}

public struct BranchProtectionRuleEvent: Codable, Sendable {
    public let action: BranchProtectionRuleAction
    public let rule: GitHubBranchProtectionRule
    public let changes: GitHubBranchProtectionRuleChanges?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Branch Protection Configuration Event

public enum BranchProtectionConfigurationAction: String, Codable, Sendable, Hashable {
    case disabled
    case enabled
}

public struct BranchProtectionConfigurationEvent: Codable, Sendable {
    public let action: BranchProtectionConfigurationAction
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Repository Ruleset Event

public enum RepositoryRulesetAction: String, Codable, Sendable, Hashable {
    case created
    case deleted
    case edited
}

public struct GitHubRepositoryRuleset: Codable, Sendable, Hashable {
    public let id: Int
    public let name: String
    public let target: String?
    public let sourceType: String?
    public let source: String?
    public let enforcement: String?
    public let nodeId: String?
    public let createdAt: String?
    public let updatedAt: String?
    public let currentUserCanBypass: String?
}

public struct RepositoryRulesetEvent: Codable, Sendable {
    public let action: RepositoryRulesetAction
    public let ruleset: GitHubRepositoryRuleset
    public let changes: [String: String]?
    public let repository: GitHubRepository?
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Repository Rule Suite Event

public struct RepositoryRuleSuiteEvent: Codable, Sendable {
    public let action: String
    public let ruleSuite: GitHubRuleSuite?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

public struct GitHubRuleSuite: Codable, Sendable, Hashable {
    public let id: Int
    public let actorId: Int?
    public let actorName: String?
    public let beforeSha: String?
    public let afterSha: String?
    public let ref: String?
    public let repositoryId: Int?
    public let result: String?
    public let evaluationResult: String?
    public let pushedAt: String?
}

// MARK: - Repository Dispatch Event

public struct RepositoryDispatchEvent: Codable, Sendable {
    public let action: String
    public let branch: String
    public let clientPayload: [String: String]?
    public let installation: GitHubInstallation?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Repository Import Event

/// Triggered when a repository import is successful, failed, or cancelled.
public struct RepositoryImportEvent: Codable, Sendable {
    /// The final import status: `success`, `cancelled`, or `failure`.
    public let status: String
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Repository Vulnerability Alert Event (deprecated)

public enum RepositoryVulnerabilityAlertAction: String, Codable, Sendable, Hashable {
    case create
    case dismiss
    case reopen
    case resolve
}

public struct GitHubRepositoryVulnerabilityAlert: Codable, Sendable, Hashable {
    public let id: Int
    public let affectedRange: String?
    public let affectedPackageName: String?
    public let externalReference: String?
    public let externalIdentifier: String?
    public let ghsaId: String?
    public let severity: String?
    public let cvss: String?
    public let number: Int?
    public let createdAt: String?
    public let url: String?
    public let htmlUrl: String?
    public let fixedIn: String?
    public let autoDismissedAt: String?
    public let dismisser: GitHubUser?
    public let dismissReason: String?
    public let dismissedAt: String?
    public let autodismissedAt: String?
}

public struct RepositoryVulnerabilityAlertEvent: Codable, Sendable {
    public let action: RepositoryVulnerabilityAlertAction
    public let alert: GitHubRepositoryVulnerabilityAlert
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Repository Advisory Event

public enum RepositoryAdvisoryAction: String, Codable, Sendable, Hashable {
    case published
    case reported
}

public struct GitHubRepositoryAdvisoryCvss: Codable, Sendable, Hashable {
    public let vectorString: String?
    public let score: Double?
}

public struct GitHubRepositoryAdvisoryPackage: Codable, Sendable, Hashable {
    public let ecosystem: String
    public let name: String?
}

public struct GitHubRepositoryAdvisory: Codable, Sendable, Hashable {
    public let ghsaId: String
    public let cveId: String?
    public let url: String?
    public let htmlUrl: String?
    public let summary: String
    public let description: String?
    public let severity: String
    public let author: GitHubUser?
    public let publisher: GitHubUser?
    public let identifiers: [GitHubAdvisoryIdentifier]?
    public let state: String
    public let createdAt: String?
    public let updatedAt: String?
    public let publishedAt: String?
    public let closedAt: String?
    public let withdrawnAt: String?
    public let submission: GitHubAdvisorySubmission?
    public let vulnerabilities: [GitHubAdvisoryVulnerability]?
    public let cvss: GitHubRepositoryAdvisoryCvss?
    public let cwe: [GitHubAdvisoryCwe]?
    public let credits: [GitHubAdvisoryCredit]?
    public let creditsDetailed: [GitHubAdvisoryCreditDetailed]?
    public let collaboratingUsers: [GitHubUser]?
    public let collaboratingTeams: [GitHubTeam]?
    public let privateFork: GitHubRepository?
}

public struct GitHubAdvisoryIdentifier: Codable, Sendable, Hashable {
    public let type: String
    public let value: String
}

public struct GitHubAdvisorySubmission: Codable, Sendable, Hashable {
    public let accepted: Bool
}

public struct GitHubAdvisoryVulnerability: Codable, Sendable, Hashable {
    public let package: GitHubRepositoryAdvisoryPackage?
    public let severity: String?
    public let vulnerableVersionRange: String?
    public let firstPatchedVersion: GitHubAdvisoryFirstPatchedVersion?
}

public struct GitHubAdvisoryFirstPatchedVersion: Codable, Sendable, Hashable {
    public let identifier: String
}

public struct GitHubAdvisoryCwe: Codable, Sendable, Hashable {
    public let cweId: String
    public let name: String
}

public struct GitHubAdvisoryCredit: Codable, Sendable, Hashable {
    public let login: String
}

public struct GitHubAdvisoryCreditDetailed: Codable, Sendable, Hashable {
    public let user: GitHubUser?
    public let type: String?
    public let state: String?
}

public struct RepositoryAdvisoryEvent: Codable, Sendable {
    public let action: RepositoryAdvisoryAction
    public let repositoryAdvisory: GitHubRepositoryAdvisory
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Security and Analysis Event

public struct SecurityAndAnalysisEvent: Codable, Sendable {
    public let changes: GitHubSecurityAndAnalysisChanges?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

public struct GitHubSecurityAndAnalysisChanges: Codable, Sendable, Hashable {
    public let from: GitHubSecurityAndAnalysisState?
}

public struct GitHubSecurityAndAnalysisState: Codable, Sendable, Hashable {
    public let advancedSecurity: GitHubSecurityFeatureStatus?
    public let dependabotSecurityUpdates: GitHubSecurityFeatureStatus?
    public let secretScanning: GitHubSecurityFeatureStatus?
    public let secretScanningPushProtection: GitHubSecurityFeatureStatus?
}

public struct GitHubSecurityFeatureStatus: Codable, Sendable, Hashable {
    public let status: String
}

// MARK: - Deploy Key Event

public enum DeployKeyAction: String, Codable, Sendable, Hashable {
    case created
    case deleted
}

public struct GitHubDeployKey: Codable, Sendable, Hashable {
    public let id: Int
    public let key: String
    public let url: String?
    public let title: String?
    public let verified: Bool?
    public let createdAt: String?
    public let readOnly: Bool?
    public let addedBy: String?
    public let lastUsed: String?
}

public struct DeployKeyEvent: Codable, Sendable {
    public let action: DeployKeyAction
    public let key: GitHubDeployKey
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}
