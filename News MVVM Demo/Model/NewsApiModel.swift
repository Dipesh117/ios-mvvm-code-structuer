//
//  NewsApiModel.swift
//  News MVVM Demo
//
//  Created by iMac on 31/07/21.
//

import Foundation
import UIKit

class NewsModelClass: Codable {

  enum CodingKeys: String, CodingKey {
    case articles
    case status
    case totalResults
  }

  var articles: [Articles]?
  var status: String?
  var totalResults: Int?

  init (articles: [Articles]?, status: String?, totalResults: Int?) {
    self.articles = articles
    self.status = status
    self.totalResults = totalResults
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    articles = try container.decodeIfPresent([Articles].self, forKey: .articles)
    status = try container.decodeIfPresent(String.self, forKey: .status)
    totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
  }

}

class Articles: Codable {

  enum CodingKeys: String, CodingKey {
    case publishedAt
    case title
    case url
    case source
    case content
    case descriptionValue = "description"
    case urlToImage
    case author
  }

  var publishedAt: String?
  var title: String?
  var url: String?
  var source: Source?
  var content: String?
  var descriptionValue: String?
  var urlToImage: String?
  var author: String?

  init (publishedAt: String?, title: String?, url: String?, source: Source?, content: String?, descriptionValue: String?, urlToImage: String?, author: String?) {
    self.publishedAt = publishedAt
    self.title = title
    self.url = url
    self.source = source
    self.content = content
    self.descriptionValue = descriptionValue
    self.urlToImage = urlToImage
    self.author = author
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    url = try container.decodeIfPresent(String.self, forKey: .url)
    source = try container.decodeIfPresent(Source.self, forKey: .source)
    content = try container.decodeIfPresent(String.self, forKey: .content)
    descriptionValue = try container.decodeIfPresent(String.self, forKey: .descriptionValue)
    urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
    author = try container.decodeIfPresent(String.self, forKey: .author)
  }

}


import Foundation

class Source: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case name
  }

  var id: String?
  var name: String?

  init (id: String?, name: String?) {
    self.id = id
    self.name = name
  }

  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(String.self, forKey: .id)
    name = try container.decodeIfPresent(String.self, forKey: .name)
  }

}
