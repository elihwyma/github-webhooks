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
    /// Present for the `edited`, `renamed`, and `transferred` actions.
    public let changes: GitHubRepositoryChanges?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

public struct GitHubRepositoryChanges: Codable, Sendable, Hashable {
    // `edited` action
    public let defaultBranch: GitHubChangedValue?
    public let description: GitHubChangedValue?
    public let homepage: GitHubChangedValue?
    public let topics: GitHubChangedStringArrayValue?
    // `renamed` action
    public let repository: GitHubRepositoryNameChanges?
    // `transferred` action
    public let owner: GitHubRepositoryOwnerChanges?
}

public struct GitHubRepositoryNameChanges: Codable, Sendable, Hashable {
    public let name: GitHubChangedValue?
}

public struct GitHubRepositoryOwnerChanges: Codable, Sendable, Hashable {
    public let from: GitHubRepositoryOwnerFrom?
}

public struct GitHubRepositoryOwnerFrom: Codable, Sendable, Hashable {
    public let user: GitHubUser?
    public let organization: GitHubOrganization?
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
    public let tagName: GitHubChangedValue?
    public let makeLatest: GitHubMakeLatestChange?
}

public struct GitHubMakeLatestChange: Codable, Sendable, Hashable {
    /// Whether this release was explicitly `edited` to be the latest.
    public let to: Bool?
}

// MARK: - Branch Protection Rule Event

public enum BranchProtectionRuleAction: String, Codable, Sendable, Hashable {
    case created
    case deleted
    case edited
}

public struct GitHubBranchProtectionRule: Codable, Sendable, Hashable {
    public let id: Int
    public let repositoryId: Int
    public let name: String
    public let createdAt: String
    public let updatedAt: String
    public let pullRequestReviewsEnforcementLevel: String
    public let requiredApprovingReviewCount: Int
    public let dismissStaleReviewsOnPush: Bool
    public let requireCodeOwnerReview: Bool
    public let requireLastPushApproval: Bool?
    public let authorizedDismissalActorsOnly: Bool
    public let ignoreApprovalsFromContributors: Bool
    public let requiredStatusChecks: [String]
    public let requiredStatusChecksEnforcementLevel: String
    public let strictRequiredStatusChecksPolicy: Bool
    public let signatureRequirementEnforcementLevel: String
    public let linearHistoryRequirementEnforcementLevel: String
    public let adminEnforced: Bool
    public let createProtected: Bool?
    public let allowForcePushesEnforcementLevel: String
    public let allowDeletionsEnforcementLevel: String
    public let mergeQueueEnforcementLevel: String
    public let requiredDeploymentsEnforcementLevel: String
    public let requiredConversationResolutionLevel: String
    public let authorizedActorsOnly: Bool
    public let authorizedActorNames: [String]
}

public struct GitHubBranchProtectionRuleChanges: Codable, Sendable, Hashable {
    public let adminEnforced: GitHubChangedBoolValue?
    public let allowDeletionsEnforcementLevel: GitHubChangedValue?
    public let allowForcePushesEnforcementLevel: GitHubChangedValue?
    public let authorizedActorNames: GitHubChangedStringArrayValue?
    public let authorizedActorsOnly: GitHubChangedBoolValue?
    public let authorizedDismissalActorsOnly: GitHubChangedBoolValue?
    public let dismissStaleReviewsOnPush: GitHubChangedBoolValue?
    public let linearHistoryRequirementEnforcementLevel: GitHubChangedValue?
    public let pullRequestReviewsEnforcementLevel: GitHubChangedValue?
    public let requireCodeOwnerReview: GitHubChangedBoolValue?
    public let requiredApprovingReviewCount: GitHubChangedIntValue?
    public let requiredConversationResolutionLevel: GitHubChangedValue?
    public let requiredDeploymentsEnforcementLevel: GitHubChangedValue?
    public let requiredStatusChecks: GitHubChangedStringArrayValue?
    public let requiredStatusChecksEnforcementLevel: GitHubChangedValue?
    public let signatureRequirementEnforcementLevel: GitHubChangedValue?
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
    /// One of: `branch`, `tag`, `push`, `repository`.
    public let target: String?
    /// One of: `Repository`, `Organization`, `Enterprise`.
    public let sourceType: String?
    public let source: String
    /// One of: `disabled`, `active`, `evaluate`.
    public let enforcement: String
    public let bypassActors: [GitHubRulesetBypassActor]?
    /// One of: `always`, `pull_requests_only`, `never`, `exempt`.
    public let currentUserCanBypass: String?
    public let nodeId: String?
    public let _links: GitHubRulesetLinks?
    public let conditions: GitHubJSONValue?
    public let rules: [GitHubRepositoryRulesetRule]?
    public let createdAt: String?
    public let updatedAt: String?
}

public struct GitHubRulesetBypassActor: Codable, Sendable, Hashable {
    public let actorId: Int?
    /// One of: `Integration`, `OrganizationAdmin`, `RepositoryRole`, `Team`, `DeployKey`, `User`.
    public let actorType: String?
    /// One of: `always`, `pull_request`, `exempt`.
    public let bypassMode: String?
}

public struct GitHubRulesetLinks: Codable, Sendable, Hashable {
    public let selfLink: GitHubRulesetLinkHref?
    public let html: GitHubRulesetLinkHref?

    enum CodingKeys: String, CodingKey {
        case selfLink = "self"
        case html
    }
}

public struct GitHubRulesetLinkHref: Codable, Sendable, Hashable {
    public let href: String?
}

public struct GitHubRepositoryRulesetRule: Codable, Sendable, Hashable {
    public let type: String
    public let parameters: GitHubJSONValue?
}

public struct GitHubRepositoryRulesetChanges: Codable, Sendable, Hashable {
    public let name: GitHubChangedValue?
    public let enforcement: GitHubChangedValue?
    public let conditions: GitHubRulesetChangedItems?
    public let rules: GitHubRulesetChangedItems?
}

public struct GitHubRulesetChangedItems: Codable, Sendable, Hashable {
    public let added: [GitHubJSONValue]?
    public let deleted: [GitHubJSONValue]?
    public let updated: [GitHubJSONValue]?
}

public struct RepositoryRulesetEvent: Codable, Sendable {
    public let action: RepositoryRulesetAction
    public let repositoryRuleset: GitHubRepositoryRuleset
    /// Present for the `edited` action.
    public let changes: GitHubRepositoryRulesetChanges?
    public let repository: GitHubRepository?
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Repository Rule Suite Event

public struct RepositoryRuleSuiteEvent: Codable, Sendable {
    public let action: String?
    public let ruleSuite: GitHubRuleSuite?
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

public struct GitHubRuleSuite: Codable, Sendable, Hashable {
    public let id: Int?
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
    public let clientPayload: [String: GitHubJSONValue]?
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
    public let number: Int
    public let nodeId: String
    /// One of: `open`, `dismissed`, `fixed`.
    public let state: String
    public let affectedRange: String
    public let affectedPackageName: String
    public let externalReference: String
    public let externalIdentifier: String
    public let ghsaId: String
    public let severity: String
    public let createdAt: String
    // `dismiss` action
    public let dismisser: GitHubUser?
    public let dismissReason: String?
    public let dismissedAt: String?
    public let dismissComment: String?
    // `resolve` action
    public let fixedIn: String?
    public let fixedAt: String?
    public let fixReason: String?
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
    public let url: String
    public let htmlUrl: String
    public let summary: String
    public let description: String?
    /// One of: `critical`, `high`, `medium`, `low`, or `null`.
    public let severity: String?
    public let author: GitHubUser?
    public let publisher: GitHubUser?
    public let identifiers: [GitHubAdvisoryIdentifier]
    /// One of: `published`, `closed`, `withdrawn`, `draft`, `triage`.
    public let state: String
    public let createdAt: String?
    public let updatedAt: String?
    public let publishedAt: String?
    public let closedAt: String?
    public let withdrawnAt: String?
    public let submission: GitHubAdvisorySubmission?
    public let vulnerabilities: [GitHubAdvisoryVulnerability]?
    public let cvss: GitHubRepositoryAdvisoryCvss?
    public let cvssSeverities: GitHubAdvisoryCvssSeverities?
    public let cwes: [GitHubAdvisoryCwe]?
    public let cweIds: [String]?
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
    public let vulnerableVersionRange: String?
    public let patchedVersions: String?
    public let vulnerableFunctions: [String]?
}

public struct GitHubAdvisoryCwe: Codable, Sendable, Hashable {
    public let cweId: String
    public let name: String
}

public struct GitHubAdvisoryCredit: Codable, Sendable, Hashable {
    public let login: String?
    /// One of: `analyst`, `finder`, `reporter`, `coordinator`, `remediation_developer`,
    /// `remediation_reviewer`, `remediation_verifier`, `tool`, `sponsor`, `other`.
    public let type: String?
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
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Security and Analysis Event

public struct SecurityAndAnalysisEvent: Codable, Sendable {
    public let changes: GitHubSecurityAndAnalysisChanges
    public let repository: GitHubRepository
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

public struct GitHubSecurityAndAnalysisChanges: Codable, Sendable, Hashable {
    public let from: GitHubSecurityAndAnalysisChangesFrom?
}

public struct GitHubSecurityAndAnalysisChangesFrom: Codable, Sendable, Hashable {
    public let securityAndAnalysis: GitHubSecurityAndAnalysisState?
}

public struct GitHubSecurityAndAnalysisState: Codable, Sendable, Hashable {
    public let advancedSecurity: GitHubSecurityFeatureStatus?
    public let codeSecurity: GitHubSecurityFeatureStatus?
    public let dependabotSecurityUpdates: GitHubSecurityFeatureStatus?
    public let secretScanning: GitHubSecurityFeatureStatus?
    public let secretScanningPushProtection: GitHubSecurityFeatureStatus?
    public let secretScanningNonProviderPatterns: GitHubSecurityFeatureStatus?
    public let secretScanningAiDetection: GitHubSecurityFeatureStatus?
    public let secretScanningDelegatedAlertDismissal: GitHubSecurityFeatureStatus?
    public let secretScanningDelegatedBypass: GitHubSecurityFeatureStatus?
    public let secretScanningDelegatedBypassOptions: GitHubSecretScanningDelegatedBypassOptions?
}

public struct GitHubSecurityFeatureStatus: Codable, Sendable, Hashable {
    /// `enabled` or `disabled`.
    public let status: String?
}

public struct GitHubSecretScanningDelegatedBypassOptions: Codable, Sendable, Hashable {
    public let reviewers: [GitHubSecretScanningBypassReviewer]?
}

public struct GitHubSecretScanningBypassReviewer: Codable, Sendable, Hashable {
    /// The ID of the team or role selected as a bypass reviewer.
    public let reviewerId: Int
    /// `TEAM` or `ROLE`.
    public let reviewerType: String
    /// `ALWAYS` or `EXEMPT`.
    public let mode: String?
}

// MARK: - Deploy Key Event

public enum DeployKeyAction: String, Codable, Sendable, Hashable {
    case created
    case deleted
}

public struct GitHubDeployKey: Codable, Sendable, Hashable {
    public let id: Int
    public let key: String
    public let url: String
    public let title: String
    public let verified: Bool
    public let createdAt: String
    public let readOnly: Bool
    public let addedBy: String?
    public let lastUsed: String?
    public let enabled: Bool?
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
