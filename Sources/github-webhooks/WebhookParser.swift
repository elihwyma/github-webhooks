import Foundation

// MARK: - Errors

public enum GitHubWebhookParserError: Error, Sendable {
    /// The event type is recognised but the payload JSON is malformed or missing required fields.
    case decodingFailed(eventType: String, underlyingError: Error)
}

// MARK: - Parser

/// Parses raw GitHub webhook payloads into strongly-typed ``GitHubWebhookEvent`` values.
///
/// Usage:
/// ```swift
/// let event = try GitHubWebhookParser.parse(
///     eventType: request.headers["X-GitHub-Event"] ?? "",
///     data: request.body
/// )
/// switch event {
/// case .push(let payload):
///     print("Pushed to", payload.ref)
/// case .pullRequest(let payload):
///     print("PR action:", payload.action)
/// default:
///     break
/// }
/// ```
public struct GitHubWebhookParser: Sendable {

    /// A shared ``JSONDecoder`` configured to handle GitHub's snake_case naming convention.
    /// Keys are automatically converted from `snake_case` → `camelCase`.
    public static let decoder: JSONDecoder = {
        let d = JSONDecoder()
        d.keyDecodingStrategy = .convertFromSnakeCase
        return d
    }()

    private init() {}

    // MARK: - Public API

    /// Parse a raw webhook payload into a ``GitHubWebhookEvent``.
    ///
    /// - Parameters:
    ///   - eventType: The value of the `X-GitHub-Event` HTTP header.
    ///   - data: The raw JSON body bytes.
    /// - Returns: A ``GitHubWebhookEvent`` matching the event type.
    /// - Throws: ``GitHubWebhookParserError/decodingFailed(_:_:)`` if the payload cannot
    ///   be decoded, or a `DecodingError` for structural problems.
    ///
    /// Unknown event types return ``GitHubWebhookEvent/unknown(eventType:rawData:)`` rather
    /// than throwing, so callers remain forward-compatible as GitHub adds new events.
    public static func parse(eventType: String, data: Data) throws -> GitHubWebhookEvent {
        do {
            return try decode(eventType: eventType, data: data)
        } catch let error as GitHubWebhookParserError {
            throw error
        } catch {
            throw GitHubWebhookParserError.decodingFailed(eventType: eventType, underlyingError: error)
        }
    }

    /// Parse a webhook payload, returning `nil` instead of throwing for decoding failures.
    ///
    /// Unknown event types still return ``GitHubWebhookEvent/unknown(eventType:rawData:)``.
    public static func tryParse(eventType: String, data: Data) -> GitHubWebhookEvent? {
        try? parse(eventType: eventType, data: data)
    }

    // MARK: - Private dispatch

    private static func decode(eventType: String, data: Data) throws -> GitHubWebhookEvent {
        let d = decoder
        switch eventType {

        // MARK: Code / Git
        case "push":
            return .push(try d.decode(PushEvent.self, from: data))
        case "create":
            return .create(try d.decode(CreateEvent.self, from: data))
        case "delete":
            return .delete(try d.decode(DeleteEvent.self, from: data))
        case "commit_comment":
            return .commitComment(try d.decode(CommitCommentEvent.self, from: data))
        case "status":
            return .status(try d.decode(StatusEvent.self, from: data))
        case "gollum":
            return .gollum(try d.decode(GollumEvent.self, from: data))
        case "public":
            return .`public`(try d.decode(PublicEvent.self, from: data))

        // MARK: Pull Request
        case "pull_request":
            return .pullRequest(try d.decode(PullRequestEvent.self, from: data))
        case "pull_request_review":
            return .pullRequestReview(try d.decode(PullRequestReviewEvent.self, from: data))
        case "pull_request_review_comment":
            return .pullRequestReviewComment(try d.decode(PullRequestReviewCommentEvent.self, from: data))
        case "pull_request_review_thread":
            return .pullRequestReviewThread(try d.decode(PullRequestReviewThreadEvent.self, from: data))

        // MARK: Issues
        case "issues":
            return .issues(try d.decode(IssuesEvent.self, from: data))
        case "issue_comment":
            return .issueComment(try d.decode(IssueCommentEvent.self, from: data))

        // MARK: Checks
        case "check_run":
            return .checkRun(try d.decode(CheckRunEvent.self, from: data))
        case "check_suite":
            return .checkSuite(try d.decode(CheckSuiteEvent.self, from: data))

        // MARK: Workflows
        case "workflow_run":
            return .workflowRun(try d.decode(WorkflowRunEvent.self, from: data))
        case "workflow_job":
            return .workflowJob(try d.decode(WorkflowJobEvent.self, from: data))
        case "workflow_dispatch":
            return .workflowDispatch(try d.decode(WorkflowDispatchEvent.self, from: data))

        // MARK: Deployments
        case "deployment":
            return .deployment(try d.decode(DeploymentEvent.self, from: data))
        case "deployment_status":
            return .deploymentStatus(try d.decode(DeploymentStatusEvent.self, from: data))
        case "deployment_review":
            return .deploymentReview(try d.decode(DeploymentReviewEvent.self, from: data))
        case "deployment_protection_rule":
            return .deploymentProtectionRule(try d.decode(DeploymentProtectionRuleEvent.self, from: data))

        // MARK: Repository
        case "repository":
            return .repository(try d.decode(RepositoryEvent.self, from: data))
        case "fork":
            return .fork(try d.decode(ForkEvent.self, from: data))
        case "release":
            return .release(try d.decode(ReleaseEvent.self, from: data))
        case "branch_protection_rule":
            return .branchProtectionRule(try d.decode(BranchProtectionRuleEvent.self, from: data))
        case "branch_protection_configuration":
            return .branchProtectionConfiguration(try d.decode(BranchProtectionConfigurationEvent.self, from: data))
        case "repository_ruleset":
            return .repositoryRuleset(try d.decode(RepositoryRulesetEvent.self, from: data))
        case "repository_rule_suite":
            return .repositoryRuleSuite(try d.decode(RepositoryRuleSuiteEvent.self, from: data))
        case "repository_dispatch":
            return .repositoryDispatch(try d.decode(RepositoryDispatchEvent.self, from: data))
        case "repository_import":
            return .repositoryImport(try d.decode(RepositoryImportEvent.self, from: data))
        case "repository_vulnerability_alert":
            return .repositoryVulnerabilityAlert(try d.decode(RepositoryVulnerabilityAlertEvent.self, from: data))
        case "repository_advisory":
            return .repositoryAdvisory(try d.decode(RepositoryAdvisoryEvent.self, from: data))
        case "security_and_analysis":
            return .securityAndAnalysis(try d.decode(SecurityAndAnalysisEvent.self, from: data))
        case "deploy_key":
            return .deployKey(try d.decode(DeployKeyEvent.self, from: data))

        // MARK: Organization
        case "organization":
            return .organization(try d.decode(OrganizationEvent.self, from: data))
        case "member":
            return .member(try d.decode(MemberEvent.self, from: data))
        case "membership":
            return .membership(try d.decode(MembershipEvent.self, from: data))
        case "team":
            return .team(try d.decode(TeamEvent.self, from: data))
        case "team_add":
            return .teamAdd(try d.decode(TeamAddEvent.self, from: data))
        case "org_block":
            return .orgBlock(try d.decode(OrgBlockEvent.self, from: data))

        // MARK: Projects
        case "project":
            return .project(try d.decode(ProjectEvent.self, from: data))
        case "project_card":
            return .projectCard(try d.decode(ProjectCardEvent.self, from: data))
        case "project_column":
            return .projectColumn(try d.decode(ProjectColumnEvent.self, from: data))
        case "projects_v2":
            return .projectsV2(try d.decode(ProjectsV2Event.self, from: data))
        case "projects_v2_item":
            return .projectsV2Item(try d.decode(ProjectsV2ItemEvent.self, from: data))
        case "projects_v2_status_update":
            return .projectsV2StatusUpdate(try d.decode(ProjectsV2StatusUpdateEvent.self, from: data))

        // MARK: Discussions
        case "discussion":
            return .discussion(try d.decode(DiscussionEvent.self, from: data))
        case "discussion_comment":
            return .discussionComment(try d.decode(DiscussionCommentEvent.self, from: data))

        // MARK: Security
        case "code_scanning_alert":
            return .codeScanningAlert(try d.decode(CodeScanningAlertEvent.self, from: data))
        case "secret_scanning_alert":
            return .secretScanningAlert(try d.decode(SecretScanningAlertEvent.self, from: data))
        case "secret_scanning_alert_location":
            return .secretScanningAlertLocation(try d.decode(SecretScanningAlertLocationEvent.self, from: data))
        case "dependabot_alert":
            return .dependabotAlert(try d.decode(DependabotAlertEvent.self, from: data))
        case "security_advisory":
            return .securityAdvisory(try d.decode(SecurityAdvisoryEvent.self, from: data))

        // MARK: Miscellaneous
        case "ping":
            return .ping(try d.decode(PingEvent.self, from: data))
        case "star":
            return .star(try d.decode(StarEvent.self, from: data))
        case "watch":
            return .watch(try d.decode(WatchEvent.self, from: data))
        case "label":
            return .label(try d.decode(LabelEvent.self, from: data))
        case "milestone":
            return .milestone(try d.decode(MilestoneEvent.self, from: data))
        case "meta":
            return .meta(try d.decode(MetaEvent.self, from: data))
        case "installation":
            return .installation(try d.decode(InstallationEvent.self, from: data))
        case "installation_repositories":
            return .installationRepositories(try d.decode(InstallationRepositoriesEvent.self, from: data))
        case "installation_target":
            return .installationTarget(try d.decode(InstallationTargetEvent.self, from: data))
        case "github_app_authorization":
            return .githubAppAuthorization(try d.decode(GitHubAppAuthorizationEvent.self, from: data))
        case "marketplace_purchase":
            return .marketplacePurchase(try d.decode(MarketplacePurchaseEvent.self, from: data))
        case "personal_access_token_request":
            return .personalAccessTokenRequest(try d.decode(PersonalAccessTokenRequestEvent.self, from: data))
        case "merge_group":
            return .mergeGroup(try d.decode(MergeGroupEvent.self, from: data))
        case "custom_property":
            return .customProperty(try d.decode(CustomPropertyEvent.self, from: data))
        case "custom_property_values":
            return .customPropertyValues(try d.decode(CustomPropertyValuesEvent.self, from: data))
        case "sub_issues":
            return .subIssues(try d.decode(SubIssuesEvent.self, from: data))
        case "page_build":
            return .pageBuild(try d.decode(PageBuildEvent.self, from: data))
        case "sponsorship":
            return .sponsorship(try d.decode(SponsorshipEvent.self, from: data))
        case "package":
            return .package(try d.decode(PackageEvent.self, from: data))
        case "registry_package":
            return .registryPackage(try d.decode(RegistryPackageEvent.self, from: data))

        // MARK: Unknown
        default:
            return .unknown(eventType: eventType, rawData: data)
        }
    }
}
