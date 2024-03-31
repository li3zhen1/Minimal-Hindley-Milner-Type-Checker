import Antlr4

class ErrorListener: ANTLRErrorListener {

  struct ErrorInfo: CustomStringConvertible {
    let line: Int
    let col: Int
    let message: String

    var description: String {
      return "line: \(line), column: \(col), message: \(message)"
    }
  }

  var errors = [ErrorInfo]()

  func syntaxError<T>(
    _ recognizer: Antlr4.Recognizer<T>,
    _ offendingSymbol: AnyObject?, _ line: Int, _ charPositionInLine: Int, _ msg: String,
    _ e: AnyObject?
  ) where T: Antlr4.ATNSimulator {
    errors.append(ErrorInfo(line: line, col: charPositionInLine, message: msg))
  }

  func reportAmbiguity(
    _ recognizer: Antlr4.Parser, _ dfa: Antlr4.DFA, _ startIndex: Int, _ stopIndex: Int,
    _ exact: Bool, _ ambigAlts: Antlr4.BitSet, _ configs: Antlr4.ATNConfigSet
  ) {}

  func reportAttemptingFullContext(
    _ recognizer: Antlr4.Parser, _ dfa: Antlr4.DFA, _ startIndex: Int, _ stopIndex: Int,
    _ conflictingAlts: Antlr4.BitSet?, _ configs: Antlr4.ATNConfigSet
  ) {}

  func reportContextSensitivity(
    _ recognizer: Antlr4.Parser, _ dfa: Antlr4.DFA, _ startIndex: Int, _ stopIndex: Int,
    _ prediction: Int, _ configs: Antlr4.ATNConfigSet
  ) {}
}
