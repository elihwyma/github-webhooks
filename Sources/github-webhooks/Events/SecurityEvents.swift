import Foundation

// MARK: - Code Scanning Alert Event

public enum CodeScanningAlertAction: String, Codable, Sendable, Hashable {
    case appearedInBranch = "appeared_in_branch"
    case closedByUser = "closed_by_user"
    case created
    case fixed
    case reopened
    case reopenedByUser = "reopened_by_user"
    case updatedAssignment = "updated_assignment"
}

public struct GitHubCodeScanningAlertRule: Codable, Sendable, Hashable {
    public let id: String?
    public let name: String?
    public let severity: String?
    public let description: String?
    public let fullDescription: String?
    public let tags: [String]?
    public let help: String?
    public let helpUri: String?
}

public struct GitHubCodeScanningAlertTool: Codable, Sendable, Hashable {
    public let name: String
    public let guid: String?
    public let version: String?
}

public struct GitHubCodeScanningAlertLocation: Codable, Sendable, Hashable {
    public let path: String?
    public let startLine: Int?
    public let endLine: Int?
    public let startColumn: Int?
    public let endColumn: Int?
}

public struct GitHubCodeScanningAlertInstance: Codable, Sendable, Hashable {
    public let ref: String?
    public let analysisKey: String?
    public let environment: String?
    public let category: String?
    public let state: String?
    public let commitSha: String?
    public let message: GitHubCodeScanningAlertMessage?
    public let location: GitHubCodeScanningAlertLocation?
    public let classifications: [String]?
}

public struct GitHubCodeScanningAlertMessage: Codable, Sendable, Hashable {
    public let text: String?
}

public struct GitHubCodeScanningAlert: Codable, Sendable, Hashable {
    public let number: Int
    public let createdAt: String?
    public let updatedAt: String?
    public let url: String?
    public let htmlUrl: String?
    public let state: String
    public let fixedAt: String?
    public let dismissedBy: GitHubUser?
    public let dismissedAt: String?
    public let dismissedReason: String?
    public let dismissedComment: String?
    public let rule: GitHubCodeScanningAlertRule?
    public let tool: GitHubCodeScanningAlertTool?
    public let mostRecentInstance: GitHubCodeScanningAlertInstance?
    public let instances: [GitHubCodeScanningAlertInstance]?
    public let instancesUrl: String?
    public let assignees: [GitHubUser]?
    public let dismissalApprovedBy: GitHubUser?
}

public struct CodeScanningAlertEvent: Codable, Sendable {
    public let action: CodeScanningAlertAction
    public let alert: GitHubCodeScanningAlert
    public let ref: String?
    public let commitOid: String?
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Secret Scanning Alert Event

public enum SecretScanningAlertAction: String, Codable, Sendable, Hashable {
    case assigned
    case created
    case metadataCreated = "metadata_created"
    case metadataRemoved = "metadata_removed"
    case publiclyLeaked = "publicly_leaked"
    case reopened
    case resolved
    case unassigned
    case validated
}

public struct GitHubSecretScanningAlert: Codable, Sendable, Hashable {
    public let number: Int?
    public let createdAt: String?
    public let updatedAt: String?
    public let url: String?
    public let htmlUrl: String?
    public let locationsUrl: String?
    public let state: String?
    public let resolution: String?
    public let resolvedAt: String?
    public let resolvedBy: GitHubUser?
    public let secretType: String?
    public let secretTypeDisplayName: String?
    public let secret: String?
    public let pushProtectionBypassed: Bool?
    public let pushProtectionBypassedBy: GitHubUser?
    public let pushProtectionBypassedAt: String?
    public let pushProtectionBypassRequestComment: String?
    public let pushProtectionBypassRequestHtmlUrl: String?
    public let pushProtectionBypassRequestReviewer: GitHubUser?
    public let pushProtectionBypassRequestReviewerComment: String?
    public let resolutionComment: String?
    public let validity: String?
    public let publiclyLeaked: Bool?
    public let multiRepo: Bool?
    public let assignedTo: GitHubUser?
    public let closureRequestComment: String?
    public let closureRequestReviewer: GitHubUser?
    public let closureRequestReviewerComment: String?
    public let metadata: [GitHubSecretScanningAlertMetadata]?
    public let provider: String?
    public let providerSlug: String?
}

public struct GitHubSecretScanningAlertMetadata: Codable, Sendable, Hashable {
    public let key: String
    public let value: String
}

public struct SecretScanningAlertEvent: Codable, Sendable {
    public let action: SecretScanningAlertAction
    public let alert: GitHubSecretScanningAlert
    public let assignee: GitHubUser?
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Secret Scanning Alert Location Event

public enum SecretScanningAlertLocationAction: String, Codable, Sendable, Hashable {
    case created
}

public struct GitHubSecretScanningAlertLocation: Codable, Sendable, Hashable {
    public let type: String?
    public let details: GitHubSecretScanningAlertLocationDetails?
}

public struct GitHubSecretScanningAlertLocationDetails: Codable, Sendable, Hashable {
    public let path: String?
    public let startLine: Int?
    public let endLine: Int?
    public let startColumn: Int?
    public let endColumn: Int?
    public let blobSha: String?
    public let blobUrl: String?
    public let commitSha: String?
    public let commitUrl: String?
    public let pageUrl: String?
    public let htmlUrl: String?
    public let issueTitleUrl: String?
    public let issueBodyUrl: String?
    public let issueCommentUrl: String?
    public let discussionTitleUrl: String?
    public let discussionBodyUrl: String?
    public let discussionCommentUrl: String?
    public let pullRequestTitleUrl: String?
    public let pullRequestBodyUrl: String?
    public let pullRequestCommentUrl: String?
    public let pullRequestReviewUrl: String?
    public let pullRequestReviewCommentUrl: String?
}

public struct SecretScanningAlertLocationEvent: Codable, Sendable {
    public let action: SecretScanningAlertLocationAction
    public let alert: GitHubSecretScanningAlert
    public let location: GitHubSecretScanningAlertLocation
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Dependabot Alert Event

public enum DependabotAlertAction: String, Codable, Sendable, Hashable {
    case assigneesChanged = "assignees_changed"
    case autoDismissed = "auto_dismissed"
    case autoReopened = "auto_reopened"
    case created
    case dismissed
    case fixed
    case reintroduced
    case reopened
}

public struct GitHubDependabotAlertPackage: Codable, Sendable, Hashable {
    public let ecosystem: String
    public let name: String
}

public struct GitHubDependabotAlertDependency: Codable, Sendable, Hashable {
    public let package: GitHubDependabotAlertPackage?
    public let manifestPath: String?
    public let scope: String?
    public let relationship: String?
}

public struct GitHubDependabotAlertAdvisory: Codable, Sendable, Hashable {
    public let ghsaId: String?
    public let cveId: String?
    public let summary: String?
    public let description: String?
    public let severity: String?
    public let identifiers: [GitHubAdvisoryIdentifier]?
    public let references: [GitHubAdvisoryReference]?
    public let publishedAt: String?
    public let updatedAt: String?
    public let withdrawnAt: String?
    public let vulnerabilities: [GitHubDependabotAlertVulnerability]?
    public let cvss: GitHubDependabotAlertCvss?
    public let cvssSeverities: GitHubAdvisoryCvssSeverities?
    public let epss: GitHubAdvisoryEpss?
    public let classification: String?
    public let cwes: [GitHubAdvisoryCwe]?
}

public struct GitHubAdvisoryCvssSeverities: Codable, Sendable, Hashable {
    public let cvssV3: GitHubDependabotAlertCvss?
    public let cvssV4: GitHubDependabotAlertCvss?
}

public struct GitHubAdvisoryEpss: Codable, Sendable, Hashable {
    public let percentage: Double?
    public let percentile: Double?
}

public struct GitHubAdvisoryReference: Codable, Sendable, Hashable {
    public let url: String
}

public struct GitHubDependabotAlertVulnerability: Codable, Sendable, Hashable {
    public let package: GitHubDependabotAlertPackage?
    public let severity: String?
    public let vulnerableVersionRange: String?
    public let firstPatchedVersion: GitHubDependabotAlertFirstPatchedVersion?
}

public struct GitHubDependabotAlertFirstPatchedVersion: Codable, Sendable, Hashable {
    public let identifier: String
}

public struct GitHubDependabotAlertCvss: Codable, Sendable, Hashable {
    public let score: Double?
    public let vectorString: String?
}

public struct GitHubDependabotAlert: Codable, Sendable, Hashable {
    public let number: Int?
    public let state: String
    public let dependency: GitHubDependabotAlertDependency?
    public let securityAdvisory: GitHubDependabotAlertAdvisory?
    public let securityVulnerability: GitHubDependabotAlertVulnerability?
    public let url: String?
    public let htmlUrl: String?
    public let createdAt: String?
    public let updatedAt: String?
    public let dismissedAt: String?
    public let dismissedBy: GitHubUser?
    public let dismissedReason: String?
    public let dismissedComment: String?
    public let dismissalRequest: GitHubDependabotAlertDismissalRequest?
    public let fixedAt: String?
    public let autoDismissedAt: String?
    public let assignees: [GitHubUser]?
}

public struct GitHubDependabotAlertDismissalRequest: Codable, Sendable, Hashable {
    public let id: Int?
    public let status: String?
    public let requester: GitHubDependabotAlertDismissalRequestRequester?
    public let createdAt: String?
    public let url: String?
}

public struct GitHubDependabotAlertDismissalRequestRequester: Codable, Sendable, Hashable {
    public let id: Int?
    public let login: String?
}

public struct DependabotAlertEvent: Codable, Sendable {
    public let action: DependabotAlertAction
    public let alert: GitHubDependabotAlert
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Security Advisory Event

public enum SecurityAdvisoryAction: String, Codable, Sendable, Hashable {
    case performed
    case published
    case updated
    case withdrawn
}

public struct GitHubSecurityAdvisory: Codable, Sendable, Hashable {
    public let ghsaId: String
    public let cveId: String?
    public let summary: String
    public let description: String?
    public let severity: String
    public let identifiers: [GitHubAdvisoryIdentifier]?
    public let references: [GitHubAdvisoryReference]?
    public let publishedAt: String?
    public let updatedAt: String?
    public let withdrawnAt: String?
    public let vulnerabilities: [GitHubSecurityAdvisoryVulnerability]?
    public let cvss: GitHubDependabotAlertCvss?
    public let cvssSeverities: GitHubAdvisoryCvssSeverities?
    public let cwes: [GitHubAdvisoryCwe]?
}

public struct GitHubSecurityAdvisoryVulnerability: Codable, Sendable, Hashable {
    public let package: GitHubSecurityAdvisoryPackage?
    public let severity: String?
    public let vulnerableVersionRange: String?
    public let firstPatchedVersion: GitHubDependabotAlertFirstPatchedVersion?
}

public struct GitHubSecurityAdvisoryPackage: Codable, Sendable, Hashable {
    public let ecosystem: String
    public let name: String?
}

public struct SecurityAdvisoryEvent: Codable, Sendable {
    public let action: SecurityAdvisoryAction
    public let securityAdvisory: GitHubSecurityAdvisory
    public let repository: GitHubRepository?
    public let sender: GitHubUser?
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}
