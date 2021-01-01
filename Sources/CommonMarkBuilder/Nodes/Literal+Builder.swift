import CommonMark

public extension Literal {
    init(@StringBuilder literal: () -> String) {
        self.init(literal: literal())
    }
}
