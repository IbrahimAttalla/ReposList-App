//
//  Repo.swift
//  ReposListApp
//
//  Created by Ebrahim Attalla on 1/4/22.
//

import Foundation
import Foundation
// MARK: - Repo
struct Repo: Codable {
    var id: Int?
    var nodeID: String?
    var name: String?
    var fullName: String?
    var repoPrivate: Bool?
    var owner: Owner?
    var htmlURL: String?
    var repoDescription: String?
    var fork: Bool?
    var url: String?
    var forksURL: String?
    var keysURL: String?
    var collaboratorsURL: String?
    var teamsURL: String?
    var hooksURL: String?
    var issueEventsURL: String?
    var eventsURL: String?
    var assigneesURL: String?
    var branchesURL: String?
    var tagsURL: String?
    var blobsURL: String?
    var gitTagsURL: String?
    var gitRefsURL: String?
    var treesURL: String?
    var statusesURL: String?
    var languagesURL: String?
    var stargazersURL: String?
    var contributorsURL: String?
    var subscribersURL: String?
    var subscriptionURL: String?
    var commitsURL: String?
    var gitCommitsURL: String?
    var commentsURL: String?
    var issueCommentURL: String?
    var contentsURL: String?
    var compareURL: String?
    var mergesURL: String?
    var archiveURL: String?
    var downloadsURL: String?
    var issuesURL: String?
    var pullsURL: String?
    var milestonesURL: String?
    var notificationsURL: String?
    var labelsURL: String?
    var releasesURL: String?
    var deploymentsURL: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case nodeID = "node_id"
        case name = "name"
        case fullName = "full_name"
        case repoPrivate = "private"
        case owner = "owner"
        case htmlURL = "html_url"
        case repoDescription = "description"
        case fork = "fork"
        case url = "url"
        case forksURL = "forks_url"
        case keysURL = "keys_url"
        case collaboratorsURL = "collaborators_url"
        case teamsURL = "teams_url"
        case hooksURL = "hooks_url"
        case issueEventsURL = "issue_events_url"
        case eventsURL = "events_url"
        case assigneesURL = "assignees_url"
        case branchesURL = "branches_url"
        case tagsURL = "tags_url"
        case blobsURL = "blobs_url"
        case gitTagsURL = "git_tags_url"
        case gitRefsURL = "git_refs_url"
        case treesURL = "trees_url"
        case statusesURL = "statuses_url"
        case languagesURL = "languages_url"
        case stargazersURL = "stargazers_url"
        case contributorsURL = "contributors_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case commitsURL = "commits_url"
        case gitCommitsURL = "git_commits_url"
        case commentsURL = "comments_url"
        case issueCommentURL = "issue_comment_url"
        case contentsURL = "contents_url"
        case compareURL = "compare_url"
        case mergesURL = "merges_url"
        case archiveURL = "archive_url"
        case downloadsURL = "downloads_url"
        case issuesURL = "issues_url"
        case pullsURL = "pulls_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case labelsURL = "labels_url"
        case releasesURL = "releases_url"
        case deploymentsURL = "deployments_url"
    }
}

