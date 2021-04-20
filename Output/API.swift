// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetCommentAuthorQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetCommentAuthor($id: ID!) {
      commentAuthor(id: $id) {
        __typename
        username
        ... on User {
          id
        }
      }
    }
    """

  public let operationName: String = "GetCommentAuthor"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("commentAuthor", arguments: ["id": GraphQLVariable("id")], type: .object(CommentAuthor.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(commentAuthor: CommentAuthor? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "commentAuthor": commentAuthor.flatMap { (value: CommentAuthor) -> ResultMap in value.resultMap }])
    }

    public var commentAuthor: CommentAuthor? {
      get {
        return (resultMap["commentAuthor"] as? ResultMap).flatMap { CommentAuthor(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "commentAuthor")
      }
    }

    public struct CommentAuthor: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User", "DeletedUser"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLTypeCase(
            variants: ["User": AsUser.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("username", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeDeletedUser(username: String) -> CommentAuthor {
        return CommentAuthor(unsafeResultMap: ["__typename": "DeletedUser", "username": username])
      }

      public static func makeUser(username: String, id: GraphQLID) -> CommentAuthor {
        return CommentAuthor(unsafeResultMap: ["__typename": "User", "username": username, "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      public var asUser: AsUser? {
        get {
          if !AsUser.possibleTypes.contains(__typename) { return nil }
          return AsUser(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsUser: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("username", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(username: String, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "User", "username": username, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var username: String {
          get {
            return resultMap["username"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}
