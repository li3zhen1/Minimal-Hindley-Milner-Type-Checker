export PATH=/Library/Developer/Toolchains/swift-wasm-5.9.1-RELEASE.xctoolchain/usr/bin:"${PATH}"


swiftc \
    -target wasm32-unknown-wasi \
    -parse-as-library \
    ./Sources/antlr/LangBaseListener.swift \
    ./Sources/antlr/LangBaseVisitor.swift \
    ./Sources/antlr/LangListener.swift \
    ./Sources/antlr/LangLexer.swift \
    ./Sources/antlr/LangVisitor.swift \
    ./Sources/antlr/LangParser.swift \
    ./Sources/antlr/ErrorListener.swift \
    ./Sources/AST.swift \
    ./Sources/typing.swift \
    ./Sources/debug.swift \
    ./Sources/ASTgen.swift \
    ./Sources/main.swift \
    ./Sources/builtin.swift -o lib.wasm \
    -Xlinker --export=typeCheckWrapper \
    -Xclang-linker -mexec-model=reactor