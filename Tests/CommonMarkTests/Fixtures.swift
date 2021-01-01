public enum Fixtures {
    public static let udhr: String = #"""
    # [Universal Declaration of Human Rights][udhr]

    ## Article 1.

    All human beings are born free and equal in dignity and rights.
    They are endowed with reason and conscience
    and should act towards one another in a spirit of brotherhood.

    [udhr]: https://www.un.org/en/universal-declaration-human-rights/ "View full version"
    """#

    static let frontmatter: String = """
    ---
    author: George P. Burdell
    description: A single-line description of the course.
    cover: shiny.jpg
    ---

    # Big Nerd Ranch Guides: The Big Nerd Ranch Guide
    """

    static let admonition: String = """
    # Heading

    > **Tip:** This is a `tip` aside.
    > This may present similarly to a block quote.

    This text comes after the admonition.

    """
}
