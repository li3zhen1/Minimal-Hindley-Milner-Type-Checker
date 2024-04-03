
func buildTupleTy(_ types: MonoType...) -> MonoType {
  return .functionApplication(.tuple(types.count), parameters: types)
}

let boolTy: MonoType = .functionApplication(.bool, parameters: [])
let intTy: MonoType = .functionApplication(.int, parameters: [])
let stringTy: MonoType = .functionApplication(.string, parameters: [])

var myContext = Context(
  typeEnv: [
    "+": .mono(intTy => intTy => intTy),
    "-": .mono(intTy => intTy => intTy),
    "*": .mono(intTy => intTy => intTy),
    "/": .mono(intTy => intTy => intTy),
    "^": .mono(boolTy => boolTy => boolTy),
    "&&": .mono(boolTy => boolTy => boolTy),
    "||": .mono(boolTy => boolTy => boolTy),
    "not": .mono(boolTy => boolTy),
    "and": .mono(boolTy => boolTy => boolTy),
    "odd": .mono(intTy => boolTy),
    "even": .mono(intTy => boolTy),
    "true": .mono(boolTy),
    "false": .mono(boolTy),
    "one": .mono(intTy),
  ]
)

var namedTypeContext: [String: MonoType] = [
  "Int": intTy,
  "Bool": boolTy,
  "String": stringTy,
]