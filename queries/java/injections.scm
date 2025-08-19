; extends

; Inject SQL into strings where special keyword pattern is found.
(
    [(string_fragment)] @injection.content
    (#match? @injection.content "(SELECT|INSERT|UPDATE|DELETE).+(FROM|INTO|VALUES|SET).*(WHERE|GROUP BY)?")
    (#set! injection.language "sql")
)
