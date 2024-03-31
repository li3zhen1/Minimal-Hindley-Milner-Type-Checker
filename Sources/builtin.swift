import Antlr4

func buildTupleTy(_ types: MonoType...) -> MonoType {
  return .functionApplication(.tuple(types.count), parameters: types)
}

let boolTy: MonoType = .functionApplication(.bool, parameters: [])
let intTy: MonoType = .functionApplication(.int, parameters: [])
let stringTy: MonoType = .functionApplication(.string, parameters: [])

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
