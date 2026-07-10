import Foundation

// MARK: - Ping Event

public struct PingEvent: Codable, Sendable {
    public let zen: String
    public let hookId: Int
    public let hook: GitHubHook?
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
}

// MARK: - Star Event

public enum StarAction: String, Codable, Sendable, Hashable {
    case created
    case deleted
}

public struct StarEvent: Codable, Sendable {
    public let action: StarAction
    public let starredAt: String?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Watch Event

public enum WatchAction: String, Codable, Sendable, Hashable {
    case started
}

public struct WatchEvent: Codable, Sendable {
    public let action: WatchAction
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Label Event

public enum LabelAction: String, Codable, Sendable, Hashable {
    case created
    case deleted
    case edited
}

public struct GitHubLabelChanges: Codable, Sendable, Hashable {
    public let name: GitHubChangedValue?
    public let color: GitHubChangedValue?
    public let description: GitHubChangedValue?
}

public struct LabelEvent: Codable, Sendable {
    public let action: LabelAction
    public let label: GitHubLabel
    public let changes: GitHubLabelChanges?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Milestone Event

public enum MilestoneAction: String, Codable, Sendable, Hashable {
    case closed
    case created
    case deleted
    case edited
    case opened
}

public struct GitHubMilestoneChanges: Codable, Sendable, Hashable {
    public let title: GitHubChangedValue?
    public let description: GitHubChangedValue?
    public let dueOn: GitHubChangedValue?
}

public struct MilestoneEvent: Codable, Sendable {
    public let action: MilestoneAction
    public let milestone: GitHubMilestone
    public let changes: GitHubMilestoneChanges?
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Meta Event

public enum MetaAction: String, Codable, Sendable, Hashable {
    case deleted
}

public struct MetaEvent: Codable, Sendable {
    public let action: MetaAction
    public let hookId: Int
    public let hook: GitHubHook
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Installation Event

public enum InstallationAction: String, Codable, Sendable, Hashable {
    case created
    case deleted
    case newPermissionsAccepted = "new_permissions_accepted"
    case suspend
    case unsuspend
}

public struct InstallationEvent: Codable, Sendable {
    public let action: InstallationAction
    public let installation: GitHubInstallation
    public let repositories: [GitHubInstallationRepository]?
    public let requester: GitHubUser?
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let enterprise: GitHubEnterprise?
}

public struct GitHubInstallationRepository: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let name: String
    public let fullName: String
    public let `private`: Bool
}

// MARK: - Installation Repositories Event

public enum InstallationRepositoriesAction: String, Codable, Sendable, Hashable {
    case added
    case removed
}

public struct InstallationRepositoriesEvent: Codable, Sendable {
    public let action: InstallationRepositoriesAction
    public let installation: GitHubInstallation
    public let repositorySelection: String?
    public let repositoriesAdded: [GitHubInstallationRepository]
    public let repositoriesRemoved: [GitHubInstallationRepository]
    public let requester: GitHubUser?
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Installation Target Event

public struct InstallationTargetEvent: Codable, Sendable {
    public let action: String
    public let installation: GitHubInstallation
    public let account: GitHubUser?
    public let changes: GitHubInstallationTargetChanges?
    public let targetType: String?
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let enterprise: GitHubEnterprise?
}

public struct GitHubInstallationTargetChanges: Codable, Sendable, Hashable {
    public let login: GitHubChangedValue?
    public let slug: GitHubChangedValue?
}

// MARK: - GitHub App Authorization Event

public enum GitHubAppAuthorizationAction: String, Codable, Sendable, Hashable {
    case revoked
}

public struct GitHubAppAuthorizationEvent: Codable, Sendable {
    public let action: GitHubAppAuthorizationAction
    public let sender: GitHubUser
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Marketplace Purchase Event

public enum MarketplacePurchaseAction: String, Codable, Sendable, Hashable {
    case cancelled
    case changed
    case pendingChange = "pending_change"
    case pendingChangeCancelled = "pending_change_cancelled"
    case purchased
}

public struct GitHubMarketplacePlan: Codable, Sendable, Hashable {
    public let id: Int
    public let name: String
    public let description: String?
    public let monthlyPriceInCents: Int?
    public let yearlyPriceInCents: Int?
    public let priceModel: String?
    public let hasFreeTrial: Bool?
    public let unitName: String?
    public let bullets: [String]?
}

public struct GitHubMarketplacePurchaseAccount: Codable, Sendable, Hashable {
    public let type: String
    public let id: Int
    public let nodeId: String?
    public let login: String
    public let organizationBillingEmail: String?
}

public struct GitHubMarketplacePurchase: Codable, Sendable, Hashable {
    public let account: GitHubMarketplacePurchaseAccount?
    public let billingCycle: String?
    public let unitCount: Int?
    public let onFreeTrial: Bool?
    public let freeTrialEndsOn: String?
    public let nextBillingDate: String?
    public let plan: GitHubMarketplacePlan?
}

public struct MarketplacePurchaseEvent: Codable, Sendable {
    public let action: MarketplacePurchaseAction
    public let effectiveDate: String
    public let sender: GitHubUser
    public let marketplacePurchase: GitHubMarketplacePurchase
    public let previousMarketplacePurchase: GitHubMarketplacePurchase?
    public let installation: GitHubInstallation?
}

// MARK: - Personal Access Token Request Event

public enum PersonalAccessTokenRequestAction: String, Codable, Sendable, Hashable {
    case approved
    case cancelled
    case created
    case denied
}

public struct GitHubPersonalAccessTokenRequest: Codable, Sendable, Hashable {
    public let id: Int
    public let owner: GitHubUser?
    public let permissionsAdded: [String: [String]]?
    public let permissionsUpgraded: [String: [String]]?
    public let permissionsResult: [String: [String]]?
    public let repositorySelection: String?
    public let repositoryCount: Int?
    public let repositories: [GitHubRepository]?
    public let createdAt: String?
    public let tokenExpired: Bool?
    public let tokenExpiresAt: String?
    public let tokenLastUsedAt: String?
}

public struct PersonalAccessTokenRequestEvent: Codable, Sendable {
    public let action: PersonalAccessTokenRequestAction
    public let personalAccessTokenRequest: GitHubPersonalAccessTokenRequest
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Merge Group Event

public enum MergeGroupAction: String, Codable, Sendable, Hashable {
    case checksRequested = "checks_requested"
    case destroyed
}

public enum MergeGroupDestroyedReason: String, Codable, Sendable, Hashable {
    case merged
    case invalidated
    case dequeued
}

public struct GitHubMergeGroup: Codable, Sendable, Hashable {
    public let headSha: String
    public let headRef: String
    public let baseRef: String
    public let baseSha: String
    public let headCommit: GitHubSimpleCommit?
}

public struct MergeGroupEvent: Codable, Sendable {
    public let action: MergeGroupAction
    public let mergeGroup: GitHubMergeGroup
    public let reason: MergeGroupDestroyedReason?
    public let repository: GitHubRepository?
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Custom Property Event

public enum CustomPropertyAction: String, Codable, Sendable, Hashable {
    case created
    case deleted
    case updated
}

public struct GitHubCustomProperty: Codable, Sendable, Hashable {
    public let propertyName: String
    public let valueType: String
    public let required: Bool?
    public let defaultValue: String?
    public let description: String?
    public let allowedValues: [String]?
    public let valuesEditableBy: String?
}

public struct CustomPropertyEvent: Codable, Sendable {
    public let action: CustomPropertyAction
    public let definition: GitHubCustomProperty?
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Custom Property Values Event

public enum CustomPropertyValuesAction: String, Codable, Sendable, Hashable {
    case updated
}

public struct GitHubCustomPropertyValue: Codable, Sendable, Hashable {
    public let propertyName: String
    public let value: String?
}

public struct CustomPropertyValuesEvent: Codable, Sendable {
    public let action: CustomPropertyValuesAction
    public let repository: GitHubRepository
    public let oldProperties: [GitHubCustomPropertyValue]?
    public let newProperties: [GitHubCustomPropertyValue]?
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Sub Issues Event

public enum SubIssuesAction: String, Codable, Sendable, Hashable {
    case parentIssueAdded = "parent_issue_added"
    case parentIssueRemoved = "parent_issue_removed"
    case subIssueAdded = "sub_issue_added"
    case subIssueRemoved = "sub_issue_removed"
}

public struct SubIssuesEvent: Codable, Sendable {
    public let action: SubIssuesAction
    public let issue: GitHubIssue?
    public let parentIssue: GitHubIssue?
    public let subIssue: GitHubIssue?
    public let parentIssueRepo: GitHubRepository?
    public let subIssueRepo: GitHubRepository?
    public let repository: GitHubRepository?
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Page Build Event

public struct GitHubPageBuildError: Codable, Sendable, Hashable {
    public let message: String?
}

public struct GitHubPageBuild: Codable, Sendable, Hashable {
    public let id: Int?
    public let status: String?
    public let error: GitHubPageBuildError?
    public let pusher: GitHubUser?
    public let commit: String?
    public let duration: Int?
    public let createdAt: String?
    public let updatedAt: String?
    public let url: String?
}

public struct PageBuildEvent: Codable, Sendable {
    public let id: Int
    public let build: GitHubPageBuild
    public let repository: GitHubRepository
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Sponsorship Event

public enum SponsorshipAction: String, Codable, Sendable, Hashable {
    case cancelled
    case created
    case edited
    case pendingCancellation = "pending_cancellation"
    case pendingTierChange = "pending_tier_change"
    case tierChanged = "tier_changed"
}

public struct GitHubSponsorshipTier: Codable, Sendable, Hashable {
    public let nodeId: String?
    public let createdAt: String?
    public let description: String?
    public let monthlyPriceInCents: Int?
    public let monthlyPriceInDollars: Int?
    public let name: String?
    public let isOneTime: Bool?
    public let isCustomAmount: Bool?
}

public struct GitHubSponsorship: Codable, Sendable, Hashable {
    public let nodeId: String?
    public let createdAt: String?
    public let maintainer: GitHubUser?
    public let sponsor: GitHubUser?
    public let sponsorable: GitHubUser?
    public let tier: GitHubSponsorshipTier?
}

public struct SponsorshipEvent: Codable, Sendable {
    public let action: SponsorshipAction
    public let sponsorship: GitHubSponsorship
    public let changes: GitHubSponsorshipChanges?
    public let effectiveDate: String?
    public let sender: GitHubUser
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

public struct GitHubSponsorshipChanges: Codable, Sendable, Hashable {
    public let tier: GitHubSponsorshipTierChange?
    public let privacyLevel: GitHubChangedValue?
}

public struct GitHubSponsorshipTierChange: Codable, Sendable, Hashable {
    public let from: GitHubSponsorshipTier?
}

// MARK: - Package Event

public enum PackageAction: String, Codable, Sendable, Hashable {
    case published
    case updated
}

public struct GitHubPackageVersion: Codable, Sendable, Hashable {
    public let id: Int
    public let version: String?
    public let summary: String?
    public let body: String?
    public let bodyHtml: String?
    public let release: GitHubRelease?
    public let manifest: String?
    public let htmlUrl: String?
    public let tagName: String?
    public let targetCommitish: String?
    public let targetOid: String?
    public let isDraft: Bool?
    public let isPrerelease: Bool?
    public let createdAt: String?
    public let updatedAt: String?
    public let metadata: [String]?
    public let dockerMetadata: [String]?
    public let packageType: String?
    public let installedBy: GitHubUser?
    public let name: String?
    public let description: String?
    public let author: GitHubUser?
    public let rubygemsMetadata: [String]?
    public let nugetMetadata: [String]?
}

public struct GitHubPackage: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let name: String
    public let namespace: String?
    public let description: String?
    public let ecosystem: String?
    public let packageType: String?
    public let htmlUrl: String?
    public let createdAt: String?
    public let updatedAt: String?
    public let owner: GitHubUser?
    public let packageVersion: GitHubPackageVersion?
    public let registry: GitHubPackageRegistry?
}

public struct GitHubPackageRegistry: Codable, Sendable, Hashable {
    public let aboutUrl: String?
    public let name: String?
    public let type: String?
    public let url: String?
    public let vendor: String?
}

public struct PackageEvent: Codable, Sendable {
    public let action: PackageAction
    public let package: GitHubPackage
    public let repository: GitHubRepository?
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Registry Package Event

public enum RegistryPackageAction: String, Codable, Sendable, Hashable {
    case published
    case updated
}

public struct RegistryPackageEvent: Codable, Sendable {
    public let action: RegistryPackageAction
    public let package: GitHubPackage
    public let repository: GitHubRepository?
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let enterprise: GitHubEnterprise?
}
