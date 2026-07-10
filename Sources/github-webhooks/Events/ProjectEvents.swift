import Foundation

// MARK: - Project Event (classic)

public enum ProjectAction: String, Codable, Sendable, Hashable {
    case closed
    case created
    case deleted
    case edited
    case reopened
}

public struct GitHubProject: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let url: String?
    public let htmlUrl: String?
    public let columnsUrl: String?
    public let name: String
    public let body: String?
    public let number: Int
    public let state: String
    public let creator: GitHubUser?
    public let createdAt: String?
    public let updatedAt: String?
}

public struct GitHubProjectChanges: Codable, Sendable, Hashable {
    public let name: GitHubChangedValue?
    public let body: GitHubChangedValue?
}

public struct ProjectEvent: Codable, Sendable {
    public let action: ProjectAction
    public let project: GitHubProject
    public let changes: GitHubProjectChanges?
    public let repository: GitHubRepository?
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Project Card Event (classic)

public enum ProjectCardAction: String, Codable, Sendable, Hashable {
    case converted
    case created
    case deleted
    case edited
    case moved
}

public struct GitHubProjectCard: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let url: String?
    public let projectUrl: String?
    public let columnUrl: String?
    public let columnId: Int?
    public let note: String?
    public let creator: GitHubUser?
    public let createdAt: String?
    public let updatedAt: String?
    public let contentUrl: String?
    public let archived: Bool?
}

public struct GitHubProjectCardChanges: Codable, Sendable, Hashable {
    public let note: GitHubChangedValue?
    public let columnId: GitHubChangedIntValue?
}

public struct GitHubChangedIntValue: Codable, Sendable, Hashable {
    public let from: Int?
}

public struct ProjectCardEvent: Codable, Sendable {
    public let action: ProjectCardAction
    public let projectCard: GitHubProjectCard
    public let changes: GitHubProjectCardChanges?
    public let afterId: Int?
    public let repository: GitHubRepository?
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Project Column Event (classic)

public enum ProjectColumnAction: String, Codable, Sendable, Hashable {
    case created
    case deleted
    case edited
    case moved
}

public struct GitHubProjectColumn: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let url: String?
    public let projectUrl: String?
    public let cardsUrl: String?
    public let name: String
    public let createdAt: String?
    public let updatedAt: String?
}

public struct GitHubProjectColumnChanges: Codable, Sendable, Hashable {
    public let name: GitHubChangedValue?
}

public struct ProjectColumnEvent: Codable, Sendable {
    public let action: ProjectColumnAction
    public let projectColumn: GitHubProjectColumn
    public let changes: GitHubProjectColumnChanges?
    public let afterId: Int?
    public let repository: GitHubRepository?
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Projects V2 Event

public enum ProjectsV2Action: String, Codable, Sendable, Hashable {
    case closed
    case created
    case deleted
    case edited
    case reopened
}

public struct GitHubProjectsV2: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let owner: GitHubUser?
    public let creator: GitHubUser?
    public let title: String
    public let description: String?
    public let `public`: Bool?
    public let closedAt: String?
    public let createdAt: String?
    public let updatedAt: String?
    public let number: Int
    public let shortDescription: String?
    public let deletedAt: String?
    public let deletedBy: GitHubUser?
}

public struct ProjectsV2Event: Codable, Sendable {
    public let action: ProjectsV2Action
    public let projectsV2: GitHubProjectsV2
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Projects V2 Item Event

public enum ProjectsV2ItemAction: String, Codable, Sendable, Hashable {
    case archived
    case converted
    case created
    case deleted
    case edited
    case reordered
    case restored
}

public struct GitHubProjectsV2Item: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let projectNodeId: String?
    public let contentNodeId: String?
    public let contentType: String?
    public let creator: GitHubUser?
    public let createdAt: String?
    public let updatedAt: String?
    public let archivedAt: String?
}

public struct GitHubProjectsV2ItemChanges: Codable, Sendable, Hashable {
    public let fieldValue: GitHubProjectsV2FieldValueChange?
    public let previousProjectsV2ItemNodeId: String?
}

public struct GitHubProjectsV2FieldValueChange: Codable, Sendable, Hashable {
    public let fieldNodeId: String?
    public let fieldType: String?
}

public struct ProjectsV2ItemEvent: Codable, Sendable {
    public let action: ProjectsV2ItemAction
    public let projectsV2Item: GitHubProjectsV2Item
    public let changes: GitHubProjectsV2ItemChanges?
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}

// MARK: - Projects V2 Status Update Event

public enum ProjectsV2StatusUpdateAction: String, Codable, Sendable, Hashable {
    case created
    case deleted
    case edited
}

public struct GitHubProjectsV2StatusUpdate: Codable, Sendable, Hashable {
    public let id: Int
    public let nodeId: String?
    public let projectNodeId: String?
    public let creator: GitHubUser?
    public let createdAt: String?
    public let updatedAt: String?
    public let status: String?
    public let startDate: String?
    public let targetDate: String?
    public let body: String?
}

public struct ProjectsV2StatusUpdateEvent: Codable, Sendable {
    public let action: ProjectsV2StatusUpdateAction
    public let projectsV2StatusUpdate: GitHubProjectsV2StatusUpdate
    public let sender: GitHubUser
    public let organization: GitHubOrganization?
    public let installation: GitHubInstallation?
    public let enterprise: GitHubEnterprise?
}
