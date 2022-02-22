import UIKit

enum LessonType {
    case math(rating: Int)
    case nativeLanguage(rating: Int)
    case computerSince(rating: Int)
    case literature(rating: Int)
}

extension LessonType: Equatable {
    
    static func ==(first: LessonType, second: LessonType) -> Bool {
        switch (first, second) {
        case (.math(rating: let a), .math(rating: let b)):
            return a == b
        case (.nativeLanguage(rating: let a), .nativeLanguage(rating: let b)):
            return a == b
        case (.computerSince(rating: let a), .computerSince(rating: let b)):
            return a == b
        case (.literature(rating: let a), .literature(rating: let b)):
            return a == b
        default:
            return false
        }
    }
}

extension LessonType: Comparable {
    
    static func >=(first: LessonType, second: LessonType) -> Bool {
        switch (first, second) {
        case (.math(rating: let a), .math(rating: let b)):
            return a >= b
        case (.nativeLanguage(rating: let a), .nativeLanguage(rating: let b)):
            return a >= b
        case (.computerSince(rating: let a), .computerSince(rating: let b)):
            return a >= b
        case (.literature(rating: let a), .literature(rating: let b)):
            return a >= b
        default:
            return false
        }
    }

    static func > (first: LessonType, second: LessonType) -> Bool {
        switch (first, second) {
        case (.math(rating: let a), .math(rating: let b)):
            return a > b
        case (.nativeLanguage(rating: let a), .nativeLanguage(rating: let b)):
            return a > b
        case (.computerSince(rating: let a), .computerSince(rating: let b)):
            return a > b
        case (.literature(rating: let a), .literature(rating: let b)):
            return a > b
        default:
            return false
        }
    }

    static func <= (first: LessonType, second: LessonType) -> Bool {
        switch (first, second) {
        case (.math(rating: let a), .math(rating: let b)):
            return a <= b
        case (.nativeLanguage(rating: let a), .nativeLanguage(rating: let b)):
            return a <= b
        case (.computerSince(rating: let a), .computerSince(rating: let b)):
            return a <= b
        case (.literature(rating: let a), .literature(rating: let b)):
            return a <= b
        default:
            return false
        }
    }

    static func <(first: LessonType, second: LessonType) -> Bool {
        switch (first, second) {
        case (.math(rating: let a), .math(rating: let b)):
            return a < b
        case (.nativeLanguage(rating: let a), .nativeLanguage(rating: let b)):
            return a < b
        case (.computerSince(rating: let a), .computerSince(rating: let b)):
            return a < b
        case (.literature(rating: let a), .literature(rating: let b)):
            return a < b
        default:
            return false
        }
    }
}

let math1 = LessonType.math(rating: 12)
let math2 = LessonType.math(rating: 8)
let language1 = LessonType.nativeLanguage(rating: 10)
let language2 = LessonType.nativeLanguage(rating: 23)

print(math1 == math2)

let isLess = LessonType.math(rating: 5) < LessonType.math(rating: 8)
print(isLess)

let isLessOrEqual = LessonType.computerSince(rating: 45) <= LessonType.computerSince(rating: 23)
print(isLessOrEqual)

print(language1 >= language2)
