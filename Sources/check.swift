import Antlr4

var myContext = Context(
  typeEnv: [
    "not": .functionApplication(.arrow, parameters: [boolTy, boolTy]),
    "and": .functionApplication(
      .arrow, parameters: [boolTy, .functionApplication(.arrow, parameters: [boolTy, boolTy])]),
    "odd": .functionApplication(.arrow, parameters: [intTy, boolTy]),
    "even": .functionApplication(.arrow, parameters: [intTy, boolTy]),
    "true": .functionApplication(.bool, parameters: []),
    "false": .functionApplication(.bool, parameters: []),
    "one": .functionApplication(.int, parameters: []),
  ]
)

let oddOne = ApplicationExpression(
  function: VariableExpression(name: "odd"),
  argument: VariableExpression(name: "one")
)

let notOddOne = ApplicationExpression(
  function: VariableExpression(name: "not"),
  argument: oddOne
)
