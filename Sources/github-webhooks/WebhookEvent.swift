import Foundation

/// A parsed GitHub webhook event, discriminated by event type.
///
/// Use ``GitHubWebhookParser`` to decode raw webhook data into this enum.
/// The event type string (from the `X-GitHub-Event` HTTP header) determines
/// which case is returned.
public enum GitHubWebhookEvent: Sendable {

    // MARK: - Code / Git Events

    /// `push` — one or more commits were pushed to a branch or tag.
    case push(PushEvent)

    /// `create` — a branch or tag was created.
    case create(CreateEvent)

    /// `delete` — a branch or tag was deleted.
    case delete(DeleteEvent)

    /// `commit_comment` — a commit comment was created.
    case commitComment(CommitCommentEvent)

    /// `status` — the status of a Git commit changed.
    case status(StatusEvent)

    /// `gollum` — a wiki page was created or updated.
    case gollum(GollumEvent)

    /// `public` — a private repository was made public.
    case `public`(PublicEvent)

    // MARK: - Pull Request Events

    /// `pull_request` — a pull request was opened, closed, or modified.
    case pullRequest(PullRequestEvent)

    /// `pull_request_review` — a pull request review was submitted, edited, or dismissed.
    case pullRequestReview(PullRequestReviewEvent)

    /// `pull_request_review_comment` — a comment was made on a pull request diff.
    case pullRequestReviewComment(PullRequestReviewCommentEvent)

    /// `pull_request_review_thread` — a comment thread on a pull request was resolved or unresolved.
    case pullRequestReviewThread(PullRequestReviewThreadEvent)

    // MARK: - Issue Events

    /// `issues` — an issue was opened, edited, closed, or otherwise modified.
    case issues(IssuesEvent)

    /// `issue_comment` — a comment was added to an issue or pull request.
    case issueComment(IssueCommentEvent)

    // MARK: - Check Events

    /// `check_run` — a check run was created, completed, or re-requested.
    case checkRun(CheckRunEvent)

    /// `check_suite` — a check suite was completed, requested, or re-requested.
    case checkSuite(CheckSuiteEvent)

    // MARK: - Workflow Events

    /// `workflow_run` — a workflow run was requested, in progress, or completed.
    case workflowRun(WorkflowRunEvent)

    /// `workflow_job` — a workflow job was queued, in progress, waiting, or completed.
    case workflowJob(WorkflowJobEvent)

    /// `workflow_dispatch` — a workflow dispatch was triggered manually via API or UI.
    case workflowDispatch(WorkflowDispatchEvent)

    // MARK: - Deployment Events

    /// `deployment` — a deployment was created.
    case deployment(DeploymentEvent)

    /// `deployment_status` — the status of a deployment changed.
    case deploymentStatus(DeploymentStatusEvent)

    /// `deployment_review` — a deployment review was requested, approved, or rejected.
    case deploymentReview(DeploymentReviewEvent)

    /// `deployment_protection_rule` — a custom deployment protection rule was triggered.
    case deploymentProtectionRule(DeploymentProtectionRuleEvent)

    // MARK: - Repository Events

    /// `repository` — a repository was created, deleted, archived, renamed, or visibility-changed.
    case repository(RepositoryEvent)

    /// `fork` — a repository was forked.
    case fork(ForkEvent)

    /// `release` — a release was created, published, edited, deleted, or unpublished.
    case release(ReleaseEvent)

    /// `branch_protection_rule` — a branch protection rule was created, edited, or deleted.
    case branchProtectionRule(BranchProtectionRuleEvent)

    /// `branch_protection_configuration` — branch protection was globally enabled or disabled.
    case branchProtectionConfiguration(BranchProtectionConfigurationEvent)

    /// `repository_ruleset` — a repository ruleset was created, edited, or deleted.
    case repositoryRuleset(RepositoryRulesetEvent)

    /// `repository_rule_suite` — a rule suite evaluation completed.
    case repositoryRuleSuite(RepositoryRuleSuiteEvent)

    /// `repository_dispatch` — a client-triggered `repository_dispatch` webhook event.
    case repositoryDispatch(RepositoryDispatchEvent)

    /// `repository_import` — a repository import finished.
    case repositoryImport(RepositoryImportEvent)

    /// `repository_vulnerability_alert` — a repository vulnerability alert was raised (deprecated; prefer `dependabot_alert`).
    case repositoryVulnerabilityAlert(RepositoryVulnerabilityAlertEvent)

    /// `repository_advisory` — a repository security advisory was published or reported.
    case repositoryAdvisory(RepositoryAdvisoryEvent)

    /// `security_and_analysis` — code security or analysis settings changed on a repository.
    case securityAndAnalysis(SecurityAndAnalysisEvent)

    /// `deploy_key` — a deploy key was added or removed.
    case deployKey(DeployKeyEvent)

    // MARK: - Organization Events

    /// `organization` — a member was added, removed, or invited, or the org was renamed/deleted.
    case organization(OrganizationEvent)

    /// `member` — collaborator access to a repository changed.
    case member(MemberEvent)

    /// `membership` — a team membership was added or removed.
    case membership(MembershipEvent)

    /// `team` — a team was created, deleted, edited, or added/removed from a repository.
    case team(TeamEvent)

    /// `team_add` — a repository was added to a team.
    case teamAdd(TeamAddEvent)

    /// `org_block` — an organization owner blocked or unblocked a user.
    case orgBlock(OrgBlockEvent)

    // MARK: - Project Events

    /// `project` — a classic project was created, closed, reopened, edited, or deleted.
    case project(ProjectEvent)

    /// `project_card` — a classic project card was created, edited, moved, converted, or deleted.
    case projectCard(ProjectCardEvent)

    /// `project_column` — a classic project column was created, edited, moved, or deleted.
    case projectColumn(ProjectColumnEvent)

    /// `projects_v2` — a Projects (v2) project was created, closed, reopened, edited, or deleted.
    case projectsV2(ProjectsV2Event)

    /// `projects_v2_item` — an item in a Projects (v2) project was created, edited, archived, reordered, or deleted.
    case projectsV2Item(ProjectsV2ItemEvent)

    /// `projects_v2_status_update` — a status update was created, edited, or deleted on a Projects (v2) project.
    case projectsV2StatusUpdate(ProjectsV2StatusUpdateEvent)

    // MARK: - Discussion Events

    /// `discussion` — a discussion was created, edited, closed, answered, or otherwise modified.
    case discussion(DiscussionEvent)

    /// `discussion_comment` — a discussion comment was created, edited, or deleted.
    case discussionComment(DiscussionCommentEvent)

    // MARK: - Security Events

    /// `code_scanning_alert` — a code scanning alert was created, fixed, dismissed, or re-opened.
    case codeScanningAlert(CodeScanningAlertEvent)

    /// `secret_scanning_alert` — a secret scanning alert was created, resolved, or re-opened.
    case secretScanningAlert(SecretScanningAlertEvent)

    /// `secret_scanning_alert_location` — a new location for a secret scanning alert was created.
    case secretScanningAlertLocation(SecretScanningAlertLocationEvent)

    /// `dependabot_alert` — a Dependabot alert was created, dismissed, fixed, or re-introduced.
    case dependabotAlert(DependabotAlertEvent)

    /// `security_advisory` — a GitHub security advisory was published, updated, or withdrawn.
    case securityAdvisory(SecurityAdvisoryEvent)

    // MARK: - Miscellaneous Events

    /// `ping` — a webhook was successfully configured.
    case ping(PingEvent)

    /// `star` — a repository was starred or un-starred.
    case star(StarEvent)

    /// `watch` — a user started watching a repository.
    case watch(WatchEvent)

    /// `label` — a label was created, edited, or deleted.
    case label(LabelEvent)

    /// `milestone` — a milestone was created, closed, opened, edited, or deleted.
    case milestone(MilestoneEvent)

    /// `meta` — the webhook itself was deleted.
    case meta(MetaEvent)

    /// `installation` — a GitHub App was installed, uninstalled, or its permissions were updated.
    case installation(InstallationEvent)

    /// `installation_repositories` — repositories were added or removed from a GitHub App installation.
    case installationRepositories(InstallationRepositoriesEvent)

    /// `installation_target` — the target of a GitHub App installation changed.
    case installationTarget(InstallationTargetEvent)

    /// `github_app_authorization` — a user revoked their authorization of a GitHub App.
    case githubAppAuthorization(GitHubAppAuthorizationEvent)

    /// `marketplace_purchase` — a GitHub Marketplace plan was purchased, cancelled, or changed.
    case marketplacePurchase(MarketplacePurchaseEvent)

    /// `personal_access_token_request` — a fine-grained PAT request was created, approved, denied, or cancelled.
    case personalAccessTokenRequest(PersonalAccessTokenRequestEvent)

    /// `merge_group` — a merge queue group received checks or was destroyed.
    case mergeGroup(MergeGroupEvent)

    /// `custom_property` — a custom organization property was created, updated, or deleted.
    case customProperty(CustomPropertyEvent)

    /// `custom_property_values` — custom property values on a repository were updated.
    case customPropertyValues(CustomPropertyValuesEvent)

    /// `sub_issues` — a sub-issue relationship was added or removed.
    case subIssues(SubIssuesEvent)

    /// `page_build` — a GitHub Pages build attempt was made.
    case pageBuild(PageBuildEvent)

    /// `sponsorship` — a GitHub Sponsors sponsorship was created, cancelled, or changed.
    case sponsorship(SponsorshipEvent)

    /// `package` — a package was published or updated in the GitHub Packages registry.
    case package(PackageEvent)

    /// `registry_package` — a package was published or updated in a GitHub Package registry.
    case registryPackage(RegistryPackageEvent)

    // MARK: - Unknown

    /// An event type that is not recognized by this library.
    /// The raw event type string and payload bytes are preserved for forward-compatibility.
    case unknown(eventType: String, rawData: Data)
}
