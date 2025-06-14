syntax keyword quickbuildFunction as true false nextgroup=quickbuildIdentifier skipwhite
syntax match quickbuildIdentifier /[a-zA-Z0-9_\-]\+/
syntax match quickbuildWildcard /\*/
syntax region quickbuildEscapedExpression start=/\[/ end=/\]/ contains=quickbuildIdentifier contained
syntax region quickbuildString start=/"/ end=/"/ contains=quickbuildEscapedExpression,quickbuildFunction,quickbuildWildcard

syntax match quickbuildTargetImmutable /.*{/me=e-1
syntax match quickbuildTargetIterator /.* as /me=e-3 nextgroup=quickbuildFunction
syntax match quickbuildComment /#.*/
syntax match quickbuildFunction /\(:\)\|\(\->\)/

highlight link quickbuildWildcard Keyword
highlight link quickbuildIdentifier Identifier
highlight link quickbuildString String
highlight link quickbuildComment Comment
highlight link quickbuildTargetImmutable Function
highlight link quickbuildTargetIterator Function
highlight link quickbuildFunction Keyword
