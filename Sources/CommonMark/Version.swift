import cmark_gfm

/// A version number.
public typealias Version = (major: Int, minor: Int, patch: Int)

/// The version of CommonMark used by this package.
public let version: Version = (
    major: Int((cmark_version() >> 24) & 0xFF),
    minor: Int((cmark_version() >> 16) & 0xFF),
    patch: Int((cmark_version() >> 8) & 0xFF)
)
